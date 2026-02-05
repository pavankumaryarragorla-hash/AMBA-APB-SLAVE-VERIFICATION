//======================================================================
// File: APB_TRANSACTION.sv
// Description: Sequence item representing an APB bus transaction
// Author: Y.V.PAVAN KUMAR
// Notes: Defines fields for APB protocol signals, factory registration,
//        and constraints for randomized stimulus.
//        Used by driver, monitor, refmodel, and scoreboard.
//======================================================================

class apb_transaction extends uvm_sequence_item;

  // -----------------------------
  // APB transaction fields
  // -----------------------------
  logic        presetn;   // Reset (not really part of transaction, but captured)
  logic        psel;      // Select signal (handshake)
  rand logic   pwrite;    // Direction: 1=write, 0=read
  rand logic [31:0] paddr;   // Address bus
  rand logic [31:0] pwdata;  // Write data bus
  logic        penable;   // Enable signal (handshake)
  logic        pready;    // Ready signal (handshake)
  logic [31:0] prdata;    // Read data bus
  logic        pslverr;   // Error response signal

  // -----------------------------
  // Factory registration + field macros
  // -----------------------------
  `uvm_object_utils_begin(apb_transaction)

    // Transaction content fields
    // These are compared, copied, and printed
    `uvm_field_int(paddr,   UVM_ALL_ON | UVM_DEC)
    `uvm_field_int(pwrite,  UVM_ALL_ON | UVM_DEC)
    `uvm_field_int(pwdata,  UVM_ALL_ON | UVM_DEC)
    `uvm_field_int(prdata,  UVM_ALL_ON | UVM_DEC)

    // Handshake/status fields
    // Ignored in compare (UVM_NOCOMPARE), but still printable
    `uvm_field_int(psel,    UVM_NOCOMPARE | UVM_DEC)
    `uvm_field_int(penable, UVM_NOCOMPARE | UVM_DEC)
    `uvm_field_int(pready,  UVM_NOCOMPARE | UVM_DEC)
    `uvm_field_int(pslverr, UVM_NOCOMPARE | UVM_DEC)
    `uvm_field_int(presetn, UVM_NOCOMPARE | UVM_DEC)

  `uvm_object_utils_end

  // -----------------------------
  // Constructor
  // -----------------------------
  function new(string name="apb_transaction");
    super.new(name);
  endfunction

  // -----------------------------
  // Constraints
  // -----------------------------
  constraint addr_range   { paddr inside {[0:31]}; }   // Limit address range
  constraint pwdata_range { pwdata inside {[1:50]}; }  // Limit write data range

endclass
