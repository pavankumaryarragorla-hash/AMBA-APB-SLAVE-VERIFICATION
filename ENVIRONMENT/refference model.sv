//======================================================================
// File: APB_REFMODEL.sv
// Description: Reference model for APB protocol
// Author:Y.V.PAVAN KUMAR
// Notes: Predicts expected DUT behavior using a simple memory model.
//        Receives transactions from monitor, generates expected results,
//        and sends them to scoreboard for comparison.
//======================================================================

class apb_refmodel extends uvm_component;
  `uvm_component_utils(apb_refmodel) 
  // Registers refmodel with UVM factory for create() and overrides

  // Analysis implementation port: receives transactions from monitor
  uvm_analysis_imp #(apb_transaction, apb_refmodel) mon2ref_imp;

  // Analysis port: sends expected transactions to scoreboard
  uvm_analysis_port #(apb_transaction) ref2sco_port;

  // Simple memory model: indexed by address, stores 32-bit data
  bit [31:0] mem[int];

  // Constructor: create analysis ports
  function new(string name="apb_refmodel", uvm_component parent);
    super.new(name, parent);
    mon2ref_imp  = new("mon2ref_imp", this);
    ref2sco_port = new("ref2sco_port", this);
  endfunction

  // Write method: called when monitor sends a transaction
  function void write(apb_transaction tr);
    // Create expected transaction object
    apb_transaction exp_data = apb_transaction::type_id::create("exp_data");

    // Copy all fields from monitor transaction into expected transaction
    exp_data.copy(tr);

    // Update memory model based on transaction type
    if (tr.pwrite) begin
      // Write operation: store data at given address
      mem[tr.paddr] = tr.pwdata;
    end else begin
      // Read operation: return stored data if exists, else 0
      if (mem.exists(tr.paddr))
        exp_data.prdata = mem[tr.paddr];
      else
        exp_data.prdata = '0;
    end

    // Debug print of expected transaction
    `uvm_info("REFMODEL",
      $sformatf("psel=%0d paddr=%0h pwrite=%0d pwdata=%0h penable=%0d pready=%0d prdata=%0h pslverr=%0d",
        exp_data.psel, exp_data.paddr, exp_data.pwrite, exp_data.pwdata,
        exp_data.penable, exp_data.pready, exp_data.prdata, exp_data.pslverr),
      UVM_NONE)

    // Send expected transaction to scoreboard
    ref2sco_port.write(exp_data);
  endfunction

endclass
