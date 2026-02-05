//======================================================================
// File: APB_ENV.sv
// Description: APB environment encapsulating agent, scoreboard, and refmodel
// Author: Y.V.PAVAN KUMAR
// Notes: Top-level UVM environment that ties together agent, refmodel,
//        and scoreboard. Responsible for building components and
//        connecting analysis ports for transaction flow.
//======================================================================

class apb_env extends uvm_env;
  `uvm_component_utils(apb_env) 
  // Registers environment with UVM factory for create() and overrides

  // Handles to sub-components
  apb_scoreboard sco_h; // Scoreboard: compares actual vs expected transactions
  apb_agent      agent_h; // Agent: encapsulates driver, sequencer, monitor
  apb_refmodel   ref_h; // Reference model: predicts expected DUT behavior
  apb_config     my_config; // Configuration object (contains vif + mode)

  // Constructor
  function new(string name="apb_env", uvm_component parent);
    super.new(name, parent);
  endfunction

  // Build phase: create sub-components and retrieve config
  virtual function void build_phase(uvm_phase phase);
    super.build_phase(phase);

    // Retrieve configuration object from config DB
    if(!uvm_config_db#(apb_config)::get(this,"","apb_config",my_config)) begin
      `uvm_fatal("Env", "set the config")
    end

    // Create agent, scoreboard, and refmodel
    agent_h = apb_agent::type_id::create("agent_h", this);
    sco_h   = apb_scoreboard::type_id::create("sco_h", this);
    ref_h   = apb_refmodel::type_id::create("ref_h", this);
  endfunction

  // Connect phase: wire up analysis ports between components
  function void connect_phase(uvm_phase phase);
    // DUT → Scoreboard (actual transactions)
    agent_h.mon_h.monitor_port.connect(sco_h.act_fifo.analysis_export);

    // DUT → Refmodel (monitor sends transactions to refmodel)
    agent_h.mon_h.monitor_port.connect(ref_h.mon2ref_imp);

    // Refmodel → Scoreboard (expected transactions)
    ref_h.ref2sco_port.connect(sco_h.exp_fifo.analysis_export);
  endfunction

endclass
