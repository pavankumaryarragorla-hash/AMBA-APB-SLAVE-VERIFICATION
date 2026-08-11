//this code is another file
/*//`define WIDTH 8

`ifndef WIDTH
  `define WIDTH 8
`endif*/



//////////////ifdef/iindef/elsif/else/endif////////////////
/*
 `define MODE1
`define MODE2
//`define MODE2

module tb;
  
  `ifdef MODE1
  `ifndef MODE1
  initial begin
    $display("mode1");
  end
  
  `elsif MODE2
   initial begin
     $display("mode2");
  end
  
  `elsif MODE3
   initial begin
     $display("mode3");
  end
  
  `else 
   initial begin
     $display(" ELSE mode");
  end
  
  `endif
  `endif
endmodule */

//////////////////time/scale///////////////

// `timescale 1ns/1ps
`timescale 1ns/100ps


module tb;
  
  initial begin
    $timeformat(-9,2,"ns",10);
    #0.001;
    $display("TIME=%0f",$realtime);
    $display("TIME=%0t",$time);
    #10;
    $display("TIME=%0t",$time);
    #13.5;
    $display("TIME=%0f",$realtime);
    $display("TIME=%0t",$time);

  end
endmodule


///////////////////////////include//////////////
/*
//  `include "file.sv"
`define WIDTH 16
  //`include "file.sv"

module tb;
  `include "file.sv"

  logic[`WIDTH-1:0]a;
  
  initial begin
    a=8'haa;
    $display(" `WIDTH =%0d, a=%0h",`WIDTH,a);
    
  end
endmodule*/

// `default_nettype wire

// module tb;
//   assign y = a&b;
  
//   initial begin
//     $display("data type of a = %0s \n data type of a = %0s \n data type of a = %0s",$typename(a),$typename(b),$typename(y));
//       end
 
// endmodule 

