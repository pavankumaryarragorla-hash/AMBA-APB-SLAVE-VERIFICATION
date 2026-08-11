/*
module packet;
  typedef struct {int addr , byte data , bit valid}s;

  initial begin
  s s1;
    s1.randomize();
    $display("addr=%0d data =%0d valid =%0d",addr,data,valid);
  end
endmodule
*/
////////////////////force & release ////////////////

/*
module tb;
  
  int a;
  
  initial begin
//     #5;
    $display("TIME@ :%0tns before force a=%0d",$time,a);
    force a=1;
    $display("TIME@ :%0tns after force a=%0d",$time,a);
    #1;
    a=0;
    $display("TIME@ :%0tns after delay a=%0d",$time,a);
    #3;
    release a;
    $display("TIME@ :%0tns after release a=%0d",$time,a);
  end
endmodule*/


/////////////////////////$time - 64 bit singned//////////////////////
//$stime = 32 bit unsigned bit 
/*
`timescale 10ns/1ns

module test;
logic set;
parameter p = 1.55;
initial begin
  $monitor($time,,,"set=", set);
#p set = 0;
#p set = 1;
end
endmodule*/

///////////////////////////////////////realtime///////////////////////
/*
`timescale 10ns/1ns

module test;
logic set;
parameter p = 1.55;
initial begin
$monitor($realtime,,"set=", set);
#p set = 0;
#p set = 1;
end
endmodule*/

/*`timescale 1ns/1ps

module tb;

  initial begin
    #10.5;
    $display("$time     = %0t", $time);
    $display("$realtime = %0f", $realtime);
  end
endmodule*/

/*module tb;
  
  int a;
  initial begin
    $timeformat(-9, 2, " ns", 10);//unit/precision(show 2 digits after decimal)/ns/width
  #10.25;
  $display("TIME = %0t", $time);
end
  endmodule*/

