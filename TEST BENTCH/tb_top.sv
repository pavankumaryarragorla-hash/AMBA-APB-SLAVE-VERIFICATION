//======================================================================
// File: top.sv
// Description: Top-level testbench for APB environment
// Author: Y.V.PAVAN KUMAR
// Notes: Instantiates DUT (apb_ram), APB interface, and connects UVM
//        environment. Configures virtual interface and runs selected test.
//======================================================================

// UVM includes
`include "uvm_macros.svh"   // Contains all UVM macros
import uvm_pkg::*;          // Contains all UVM base classes

// Testbench includes
`include "apb_interface.sv"
`include "config.sv"
`include "transaction.sv"
`include "apb_sequence.sv"
`include "apb_sequencer.sv"
`include "apb_driver.sv"
`include "apb_monitor.sv"
`include "apb_agent.sv"
`include "apb_refmodel.sv"
`include "apb_scoreboard.sv"
`include "apb_environment.sv"
`include "apb_test.sv"
`include "apb_wr_rd_test.sv"

module top();
  // Clock signal
  logic pclk;

  // Instantiate APB interface
  apb_intf inf(.pclk(pclk));

  // Instantiate DUT (APB RAM) and connect to interface
  apb_ram dut(
    .pclk   (inf.pclk),
    .presetn(inf.presetn),
    .psel   (inf.psel),
    .paddr  (inf.paddr),
    .pwrite (inf.pwrite),
    .pwdata (inf.pwdata),
    .penable(inf.penable),
    .pready (inf.pready),
    .prdata (inf.prdata),
    .pslverr(inf.pslverr)
  );

  // Initial block: configure UVM with virtual interface and run test
  initial begin
    uvm_config_db#(virtual apb_intf)::set(null,"*","vif",inf);
    // Uncomment to run base test
    // run_test("apb_test");
    // Run write+read test
    run_test("apb_wr_rd_test");
  end

  // Clock generation: 100MHz (period = 10ns)
  initial begin
    pclk = 0;
    forever #5 pclk = ~pclk;
  end

  // Waveform dump for simulation analysis
  initial begin
    $dumpfile("dump.vcd");
    $dumpvars;
  end

endmodule
