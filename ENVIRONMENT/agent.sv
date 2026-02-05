//======================================================================
// File: APB_AGENT.sv
// Description: APB agent encapsulating driver, sequencer, and monitor
// Author:Y.V.PAVAN KUMAR
// Notes: Provides a reusable verification component. Depending on
//        configuration, agent can be active (driver+sequencer+monitor)
//        or passive (monitor only).
//======================================================================

class apb_agent extends uvm_agent;
  `uvm_component_utils(apb_agent) 
  // Registers agent with UVM factory for create() and overrides

  // Handles to sub-components
  apb_sequencer seqr_h;   // Sequencer: provides transactions to driver
  apb_driver    driv_h;   // Driver: drives transactions onto DUT
  apb_monitor   mon_h;    // Monitor: observes DUT activity
  apb_config    my_config;// Configuration object (contains vif + mode)

  // Constructor
  function new(string name="apb_agent", uvm_component parent);
    super.new(name, parent);
  endfunction

  // Build phase: create sub-components based on config
  virtual function void build_phase(uvm_phase phase);
    super.build_phase(phase);

    // Retrieve configuration object from config DB
    if(!uvm_config_db#(apb_config)::get(this,"","apb_config",my_config)) begin
      `uvm_fatal("AGENT", "set the config")
    end

    // Always create monitor (both active and passive agents need it)
    mon_h = apb_monitor::type_id::create("mon_h", this);

    // If agent is active, also create driver and sequencer
    if(my_config.is_active == UVM_ACTIVE) begin
      driv_h = apb_driver::type_id::create("driv_h", this);
      seqr_h = apb_sequencer::type_id::create("seqr_h", this);
    end
  endfunction

  // Connect phase: connect driver to sequencer
  function void connect_phase(uvm_phase phase);
    driv_h.seq_item_port.connect(seqr_h.seq_item_export);
  endfunction

endclass
