////////////////dut////////////////////

// //`define MODE

// module dut(
  
//   input logic [3:0]in,
//   input logic [1:0]sel,
//  input logic [1:0]d_i,
//   input logic en,
//   output logic  y,
//   output logic [3:0]d_o
//  );
  
//   `ifdef MODE //`ifndef MODE
//   always_comb begin 
//     case({sel})
//       2'b00:y=in[0];
//       2'b01:y=in[1];
//       2'b10:y=in[2];
//       2'b11:y=in[3];
//     endcase
//   end 
  
//   `else 
//   always_comb  begin
//     if (en) begin
//       case (d_i)
//             2'b00: d_o = 4'b0001;
//             2'b01: d_o = 4'b0010;
//             2'b10: d_o = 4'b0100;
//             2'b11: d_o = 4'b1000;
//         endcase
//     end
//     else 
//         d_o = 4'b0000;
    
// end 

//   `endif
 
  
// endmodule
//
////////////////////////////////////tb//////////////////////

// module tb;

//   logic [3:0]in;
//   logic [1:0]sel;
//   logic [1:0]d_i;
//    logic en;
//    logic  y;
//   logic [3:0]d_o;

// dut dut_inst (.in  (in),.sel (sel),.d_i (d_i),.en (en),.y (y),.d_o (d_o));

//    initial begin

//      repeat(5) begin
//        en=1;
//        {in,sel,d_i}=$random;
//        #10;
//       $display("mux : TIME=%0t | in=%b | sel=%b  | y=%b",$time, in, sel,y);
//        $display("decoder :  TIME=%0t | en=%b | d_i=%b | d_o=%b", $time, en,d_i,d_o);
//      end

//     end
// endmodule


