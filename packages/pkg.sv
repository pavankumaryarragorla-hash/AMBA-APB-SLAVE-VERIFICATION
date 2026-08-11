
//`include "pkg1.sv"
package A;

int a;
int b;

import B::*;
export B::mul;

function void display();
  $display("Pakage A : a=%0d,b=%0d",a,b);
  $display("Pakage A : i=%0d,j=%0d",i,j);

endfunction

endpackage
