//======================================================================
// File: APB_SCOREBOARD.sv
// Description: Scoreboard for APB protocol verification
// Author:Y.V.PAVAN KUMAR
// Notes: Compares actual DUT transactions (from monitor) against
//        expected transactions (from refmodel). Reports Match/Mismatch.
//======================================================================

class apb_scoreboard extends uvm_scoreboard;
  `uvm_component_utils(apb_scoreboard) 
  // Registers scoreboard with UVM factory for create() and overrides

  // Analysis FIFOs to receive transactions
  uvm_tlm_analysis_fifo #(apb_transaction) act_fifo; // Actual transactions from DUT
  uvm_tlm_analysis_fifo #(apb_transaction) exp_fifo; // Expected transactions from refmodel

  // Constructor: create analysis FIFOs
  function new(string name="apb_scoreboard", uvm_component parent);
    super.new(name, parent);
    act_fifo = new("act_fifo", this);
    exp_fifo = new("exp_fifo", this);
  endfunction

  // Run phase: main scoreboard loop
  // 1. Get actual and expected transactions from FIFOs
  // 2. Compare them using UVM compare()
  // 3. Report Match or Mismatch
  task run_phase(uvm_phase phase);
    apb_transaction act_tr, exp_tr;
    forever begin
      act_fifo.get(act_tr); // Get actual transaction
      exp_fifo.get(exp_tr); // Get expected transaction

      if (!act_tr.compare(exp_tr)) begin
        // Report mismatch with detailed field values
        `uvm_error("APB_SCB", $sformatf(
          "Mismatch!\nACTUAL:   psel=%0d paddr=%0h pwrite=%0d pwdata=%0h prdata=%0h\nEXPECTED: psel=%0d paddr=%0h pwrite=%0d pwdata=%0h prdata=%0h",
          act_tr.psel, act_tr.paddr, act_tr.pwrite, act_tr.pwdata, act_tr.prdata,
          exp_tr.psel, exp_tr.paddr, exp_tr.pwrite, exp_tr.pwdata, exp_tr.prdata))
      end else begin
        // Report match with detailed field values
        `uvm_info("APB_SCB", $sformatf(
          "Match!\nACTUAL:   psel=%0d paddr=%0h pwrite=%0d pwdata=%0h prdata=%0h\nEXPECTED: psel=%0d paddr=%0h pwrite=%0d pwdata=%0h prdata=%0h",
          act_tr.psel, act_tr.paddr, act_tr.pwrite, act_tr.pwdata, act_tr.prdata,
          exp_tr.psel, exp_tr.paddr, exp_tr.pwrite, exp_tr.pwdata, exp_tr.prdata), UVM_NONE)
      end

      // Separator for readability in logs
      $display("----------------------------------------------------------------");
    end
  endtask

endclass
