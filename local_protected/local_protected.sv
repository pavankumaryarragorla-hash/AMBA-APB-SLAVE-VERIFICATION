//=====================20/07/2026=====================

//---------LOCAL-----------

/* If a variable or method is declared as local:
Accessible: only inside that class

Not accessible: outside the class
in derived (child) classes
*/

//------------------local as s property----------------------------
/*class A;
  local int data = 10; //local

  function void display(); 
    $display("data = %0d", data);  
  endfunction

endclass

module tb;
  A a = new();

  initial begin
   // a.data = 20; //not possible
    a.display();
  end
endmodule */

//-------------------------------------------------


/*class A;

  local int data = 10;

  function void display(int d);
    data = d;
$display("data = %0d", data); 
  endfunction
  
//   function void display();
//     data = 30;
// $display("data = %0d", data); 
//   endfunction

endclass


module tb;

  A a = new();

  initial begin
    // a.data = 20; //not possibe bec,property is local
    // $display(a.data);
    a.display(); 
  end

endmodule */



//--------------local method---------------

/*class A;
  local int data = 10; //local

local function void display(); //local
    $display("data = %0d", data);  
  endfunction
  
  function void disp();
    display();
  endfunction
    
endclass

module tb;
  A a = new();

  initial begin
   // a.data = 20; //not possible
    a.disp();
  end
endmodule */



// ======================protected======================


//-------------Protected property-------------

/*class parent;
  protected int data = 10;
  
 function void display_p();
    $display("parent : data=%0d",data);
  endfunction
  
endclass

class child extends parent;

  function void display_c();
    data = 20; 
    $display("child : data=%0d",data);
  endfunction

endclass


module tb;
  child c = new();

  initial begin
   parent p;
    c.display_p();
   // c.data=50; //directly we can not accesss
    p=c;
    p.display_p();
    
  end
endmodule*/

//---------------------protected method----------------------------------

class parent;
  protected int data = 10;
  
protected function void display_p();
    $display("parent : data=%0d",data);
  endfunction
  
endclass

class child extends parent;

  function void display_c();
    display_p();
 //   data = 20; 
    $display("child : data=%0d",data);
  endfunction

endclass

class child1 extends child;

  function void display_c1();
   // display_p(); //possible
   // data = 30; 
    $display("child1 : data=%0d",data);
  endfunction

endclass


module tb;
  child c = new();

  initial begin
   parent p;
    child1 c1=new();
    // c.display_c(); 
        
     c1.display_c1(); 

   // c.data=50; //directly we can not accesss
    //  c.display_p()//directly we can not access 
  end
endmodule 
