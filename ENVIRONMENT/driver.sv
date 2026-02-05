//======================================================================
// File: APB_DRIVER.sv
// Description: Driver for APB protocol transactions
// Author: Y.V.PAVAN KUMAR
// Notes: Retrieves transactions from sequencer, drives them onto DUT
//        via APB interface, and handles reset + handshake phases.
//======================================================================

class apb_driver extends uvm_driver#(apb_transaction);
  `uvm_component_utils(apb_driver) 
  // Registers driver with UVM factory for create() and overrides

  // Virtual interface handle to connect driver to DUT signals
  virtual apb_intf vif;

  // Transaction handle for requests coming from sequencer
  apb_transaction req;

  // Configuration object (contains virtual interface and agent mode)
  apb_config my_config;

  // Constructor
  function new(string name="apb_driver", uvm_component parent);
    super.new(name, parent);
  endfunction

  // Build phase: retrieve configuration object from config DB
  virtual function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    if(!uvm_config_db#(apb_config)::get(this,"","apb_config",my_config)) begin
      `uvm_fatal("DRIVER","set the config properly")
    end
  endfunction

  // Connect phase: assign virtual interface from config object
  function void connect_phase(uvm_phase phase);
    vif = my_config.vif;
  endfunction

  // Run phase: main driver loop
  // 1. Reset DUT
  // 2. Forever loop: get transaction from sequencer, drive it, mark done
  task run_phase(uvm_phase phase);
    reset_dut();
    forever begin
      seq_item_port.get_next_item(req); // Get transaction from sequencer
      `uvm_info("DRV",$sformatf(
        "psel=%d paddr=%0h pwrite=%d pwdata=%0h penable=%d pready=%d",
        req.psel, req.paddr, req.pwrite, req.pwdata, req.penable, req.pready),
        UVM_NONE)
      drive_item(req);                  // Drive transaction onto DUT
      seq_item_port.item_done();        // Handshake back to sequencer
    end
  endtask

  // Reset task: drives reset and initializes bus signals
  task reset_dut();
    vif.presetn          <= 1'b0;
    vif.drv_cb.psel      <= 1'b0;
    vif.drv_cb.penable   <= 1'b0;
    vif.drv_cb.pwrite    <= 1'b0;
    vif.drv_cb.paddr     <= '0;
    vif.drv_cb.pwdata    <= '0;

    repeat (2) @(vif.drv_cb); // Hold reset for 2 cycles
    vif.presetn <= 1'b1;      // Release reset
    @(vif.drv_cb);            // Wait one cycle
  endtask

  // Drive task: performs APB protocol handshake
  task drive_item(apb_transaction req);
    // Setup phase
    @(vif.drv_cb);
    vif.drv_cb.psel    <= 1'b1;
    vif.drv_cb.penable <= 1'b0;
    vif.drv_cb.pwrite  <= req.pwrite;
    vif.drv_cb.paddr   <= req.paddr;
    vif.drv_cb.pwdata  <= req.pwdata;

    // Access phase
    @(vif.drv_cb);
    vif.drv_cb.penable <= 1'b1;
    wait(vif.drv_cb.pready == 1'b1); // Wait until slave ready

    // Idle phase
    @(vif.drv_cb);
    vif.drv_cb.psel    <= 1'b0;
    vif.drv_cb.penable <= 1'b0;
  endtask

endclass
