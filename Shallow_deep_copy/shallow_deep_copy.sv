//------------Shallow Copy---------------

class sub_main;
  bit[31:0] data; 
endclass

class main;
  int id;
  sub_main sm=new();
endclass

module Shallow_copy_ex;
 main m1,m2;
  initial begin 
    m1 = new();
    m1.id=10;
    m1.sm.data=1;
    $display("m1_handle : data=%0d,id=%0d",m1.sm.data,m1.id);
   
    m2=new m1;
    $display("after  m2=new m1");
    $display("m1_handle : after assing of m1 handle to m2 data=%0d,id=%0d",m1.sm.data,m1.id); 
    $display("m2_handle : after assing of m1 handle to m2 data=%0d,id=%0d",m2.sm.data,m2.id); 
    m2.id=20;
    m2.sm.data=2;  
    $display("after changing m2 handle properties");
     $display("m1_handle : data=%0d,id=%0d",m1.sm.data,m1.id); 
    $display("m2_handle : data=%0d,id=%0d",m2.sm.data,m2.id); 
  end
endmodule

/////--------------------------deep copy--------------------------
//// Code your testbench here
// or browse Examples
class sub_main;
  bit[31:0] data;
endclass

class main;
  int id;
  sub_main sm=new();

  function main copy();
    copy = new();
    copy.id = this.id;
    copy.sm.data = this.sm.data;
  endfunction

endclass

module deep_copy_ex;
 main m1,m2;
  initial begin
    m1 = new();
    m1.id=10;
     m1.sm.data=1;
    $display("m1_handle data=%0d,id=%0d",m1.sm.data,m1.id);

    m2 = m1.copy;
    $display("m2_handle : after copy data=%0d,id=%0d",m2.sm.data,m2.id);
    m2.id=20;
    m2.sm.data=2;
    $display("after changing the m2 handle properties");
             $display("m1_handle data=%0d,id=%0d",m1.sm.data,m1.id);
    $display("m2_handle data=%0d,id=%0d",m2.sm.data,m2.id);
  end
endmodule
