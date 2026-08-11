`include "pkg1.sv"
`include "pkg.sv"

module top;
  int result;
  import A::*;
  
  
  initial begin
 /*   a=10;
    b=20;
   // j=5;  // illegal
    B::j=5;
    $display("j=%0d",B::j); //legal
    display();
    //mul(2,result);
        B::mul(2,result);
    $display("result=%0d",result);
  end */
   
    //j=4;
    mul(1,result);
    display();
  end
endmodule


