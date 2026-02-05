//======================================================================
// File: APB_MONITOR.sv
// Description: Monitor for APB protocol transactions
// Author: Y.V.PAVAN KUMAR
// Notes: Observes DUT signals via APB interface, samples transactions,
//        and broadcasts them to connected components (refmodel, scoreboard).
//======================================================================

class apb_monitor extends uvm_monitor;
  `uvm_component_utils(apb_monitor) 
  // Registers monitor with UVM factory for create() and overrides

  // Virtual interface handle to connect monitor to DUT signals
  virtual apb_intf vif;

  // Configuration object (contains virtual interface and agent mode)
  apb_config my_config;

  // Transaction object used to store sampled data
  apb_transaction data_sent;

  // Analysis port: broadcasts sampled transactions to subscribers
  uvm_analysis_port#(apb_transaction) monitor_port;

  // Constructor: initializes monitor and creates analysis port
  function new(string name="apb_monitor", uvm_component parent);
    super.new(name, parent);
    monitor_port = new("monitor_port", this);
  endfunction

  // Build phase: retrieve configuration object from config DB
  virtual function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    if(!uvm_config_db#(apb_config)::get(this,"","apb_config",my_config)) begin
      `uvm_fatal("MONITOR","set the config properly")
    end
  endfunction

  // Connect phase: assign virtual interface from config object
  function void connect_phase(uvm_phase phase);
    vif = my_config.vif;
  endfunction

  // Run phase: main monitor loop
  // 1. Create transaction object
  // 2. Forever loop: collect data from DUT
  task run_phase(uvm_phase phase);
    data_sent = apb_transaction::type_id::create("data_sent");
    forever begin
      collect_data();
    end
  endtask

  // Collect task: samples DUT signals via monitor clocking block
  // Only captures transaction when psel, penable, and pready are asserted
  task collect_data();
    @(vif.mon_cb);
    if(vif.mon_cb.psel && vif.mon_cb.penable && vif.mon_cb.pready) begin
      data_sent.psel    = vif.mon_cb.psel;
      data_sent.pwrite  = vif.mon_cb.pwrite;
      data_sent.paddr   = vif.mon_cb.paddr;
      data_sent.penable = vif.mon_cb.penable;
      data_sent.pready  = vif.mon_cb.pready;
      data_sent.pslverr = vif.mon_cb.pslverr;

      if(vif.mon_cb.pwrite) begin
        data_sent.pwdata = vif.mon_cb.pwdata; // Capture write data
      end else begin
        data_sent.prdata = vif.mon_cb.prdata; // Capture read data
      end

      // Debug print of sampled transaction
      `uvm_info("MON",$sformatf(
        "psel=%d paddr=%0h pwrite=%d pwdata=%0h penable=%d pready=%d prdata=%0h pslverr=%d",
        data_sent.psel, data_sent.paddr, data_sent.pwrite, data_sent.pwdata,
        data_sent.penable, data_sent.pready, data_sent.prdata, data_sent.pslverr),
        UVM_NONE)

      // Broadcast transaction to connected components (refmodel, scoreboard)
      monitor_port.write(data_sent);
    end
  endtask

endclass
