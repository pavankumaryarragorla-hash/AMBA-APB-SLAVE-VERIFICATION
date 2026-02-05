//======================================================================
// File: APB_INTERFACE.sv
// Description: APB interface definition with clocking blocks and modports
// Author: Y.V.PAVAN KUMAR
// Notes: Groups APB bus signals into a single interface.
//        Provides driver and monitor clocking blocks for synchronized
//        access, and modports to restrict usage by role.
//======================================================================

interface apb_intf(input bit pclk);

  logic presetn;          // Active-low reset
  logic psel;             // Select line
  logic [31:0] paddr;     // Address bus
  logic pwrite;           // Write=1, Read=0
  logic [31:0] pwdata;    // Write data bus
  logic penable;          // Enable signal
  logic pready;           // Slave ready signal
  logic [31:0] prdata;    // Read data bus
  logic pslverr;          // Error response

  // Driver clocking block: defines signals the driver drives/samples
  clocking drv_cb @(posedge pclk);
    output psel;
    output paddr;
    output pwrite;
    output pwdata;
    output penable;
    input  pready;
    input  prdata;
    input  pslverr;
  endclocking

  // Monitor clocking block: defines signals the monitor observes
  clocking mon_cb @(posedge pclk);
    input psel;
    input paddr;
    input pwrite;
    input pwdata;
    input penable;
    input pready;
    input prdata;
    input pslverr;
  endclocking

  // Modports restrict access by role
  modport DRV_MP (clocking drv_cb); // Driver uses drv_cb
  modport MON_MP (clocking mon_cb); // Monitor uses mon_cb

endinterface
