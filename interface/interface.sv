///////////////////////////////module to module////////////////

/*interface sample_if;
  
  logic[31:0] data;
  logic[31:0] addr;
  logic valid;
  
  //   task recevier(input logic [7:0] raddr);  //we use this prototype when we use extren keyword
//   endtask
  
  
   //madule a use this modport
  modport target(input data,input addr,input valid,export task recevier(input logic[7:0]addr) );
                                     
  //module b use this modport
  modport initiator(output data,output addr,output valid,import task recevier(input logic[7:0] addr));


endinterface*/

// //////////////////////////module A/////////////////////////////////////////

/*module A(sample_if.target intf);
  
  task intf.recevier(input logic[7:0] addr);
    $display("A : addr is received");
    $display("A : addr=%0d",intf.addr);
  endtask
    
endmodule*/

////////////////////////////module B//////////////////////////////////
    
/*module B(sample_if.initiator intf);
      
      initial begin
        $display("B : sending(calling) addr to the module_A task");
        intf.addr=10;
        intf.recevier(10);
      end  
  
endmodule*/

////////////////////////////////top/////////////////////////////////////

/*module top;
      sample_if intf();
      B b_i (.intf(intf.initiator));  //coneecting  b using initialtor modport
      A a_i (.intf(intf.target));
endmodule 
  *//



///////////////////////////////////2/////////////////////////////////////////

////////////////////////MODULE TO CLASS//////////////////////////////
/*
interface sample_if;
  logic [7:0] data;
  logic [7:0] addr;
  logic [31:0] id;

  modport target_mp(input addr ,input data,input id,export task packet(input logic[7:0] data));
                 
endinterface
*/


/////////////////////////////////2/////////////////////////////
//////////////////module to class//////////////////////////////



/////////////////////////module////////////////////////////
/*
module A(sample_if.target_mp intf);
  
  task intf.packet(input logic[7:0] data);
    $display("module_a : recevies the data");
    $display("Module_a : data =%0d ",intf.data);
  endtask
  
endmodule
*/
////////////////////////////class///////////////////////////////
/*
class parent;
  
  virtual sample_if vif;
  
  function new(virtual sample_if vif);
    this.vif=vif;
  endfunction
  
  task sender(input logic[7:0] data);
    $display("class : sending data to module");
    vif.data=data;
    vif.packet(10);
    $display("class : data=%0d",data);
  endtask
  
endclass
*/
//////////////////////////////top///////////////////////////////////
/*
module tb;
  sample_if intf();
  A a_i (.intf(intf.target_mp));
  
  parent p;
  
  initial begin
    p=new(intf);
    p.sender(10);
  end
endmodule 
*/



//////////////TASK3///////////////////////

interface sample_if3(input clk,input rst);
  logic [31:0]a=1;
  logic [31:0]b=2;
  logic [31:0]a1;
  logic [31:0]b1;
  
  modport m_mp (input a,input b,output a1,output b1,export task task_m(input logic[31:0]a,input logic[31:0]b));
                     
                modport n_mp (input a1,input b1,output a,output b,export task task_n(input logic[31:0]a1,b1));
                     
endinterface



//////////////////////TASK3 /////////////////////////////

module m(sample_if3.m_mp intf);
  
  task intf.task_m(input logic[31:0]a,b);
    add_m(a,b);
    mul_m(a,b);
  endtask
  
  task add_m(input logic[31:0]a,b);
    intf.a1=a+b;
    $display("m -> add: a=%0d,b=%0d,a1(a+b)=%0d",intf.a,intf.b,intf.a1);
  endtask
  
  task mul_m(input logic[31:0]a,b);
    intf.b1=a*b;
     $display("m -> mul: a=%0d,b=%0d,b1(a*b)=%0d",intf.a,intf.b,intf.b1);
  endtask
  
endmodule



module n(sample_if3.n_mp intf);
  
  task intf.task_n(input logic[31:0]a1,b1);
    add_n(a1,b1);
    mul_n(a1,b1);
  endtask
  
  task add_n(input logic[31:0]a1,b1);
    intf.a=a1+b1;
    $display("n:a1=%0d,b1=%0d,a(a1+b1)=%0d",intf.a1,intf.b1,intf.a);
  endtask
  
  task mul_n(input logic[31:0]a1,b1);
    intf.b=a1*b1;
    $display("n: a1=%0d,b1=%0d,b(a1*b1)=%0d",intf.a1,intf.b1,intf.b);
  endtask
  
endmodule

module top;
  
    logic clk;
  logic rst;

  sample_if3 intf(clk,rst);
  m m_i(.intf(intf.m_mp));
  n n_i(.intf(intf.n_mp));
 
  int aa[$];
  int bb[$];
  int aa1[$];
  int bb1[$];
 
  
  initial begin
    clk=0;
    forever #5 clk = ~clk;
  end
  
  initial begin
    rst=1;
    #5;
    rst=0;
    
  repeat(5)begin
       @(posedge clk);
//       if(rst==0)begin
//     intf.a=$urandom_range(1,15);
//     intf.b=$urandom_range(1,15);
    intf.task_m(intf.a,intf.b);
       #2;
             intf.task_n(intf.a1,intf.b1);
//       end
    end
    #20;
    $finish;
end
  
  always@(posedge clk)begin
    if(rst==0) begin
      aa.push_back(intf.a);
      $display("Time : %0t aa=%p",$time,aa);
    
    bb.push_back(intf.b);
      $display("Time : %0t bb=%p",$time,bb); 
    aa1.push_back(intf.a1);
      $display("Time : %0t aa1=%p",$time,aa1); 
    bb1.push_back(intf.b1);
      $display("Time : %0t bb1=%p",$time,bb1);
      $display("-------------------------");
     // intf.task_n(intf.a1,intf.b1);
  end
    else begin
      $display("in top module rst is high");
    intf.a=0;
    intf.b=0;
    intf.a1=0;
    intf.b1=0;
  end
  end
  
endmodule
