////////////////////    16/07/2026   //////////////////////////
/*
class parent;

  int id;
  bit [31:0]addr;
  
virtual task reset_signals();
    $display("parent : reset the signals");
  endtask
    
  virtual task run_main();
      $display("parent : run_main task");
    endtask
    
virtual task drive();
      $display("parent : drive is started");
      reset_signals();
      run_main();
      $display("parent : drive is ended");
    endtask
    
endclass 
    
    class child extends parent;
      
      int id;
      bit[31:0]addr;
      
     task reset_signals();
         $display("child : reset the signals");
       endtask
    
   task run_main();
      $display("child : run_main task");
    endtask
    
    task drive();
      $display("child: drive is started");
//      super.reset_signals();
//       super.run_main();
      reset_signals();
      run_main();
      $display("child: drive is ended");

    endtask
         
    endclass
         
         
  module tb;
    
    initial begin
      child c;
      parent p;
      c=new();
           
      p=c;
     // p.drive();
     c.drive();
    end
    
  endmodule
         */


////////////////passing object to function///////////
/*class packet;
  
  int data;
  
  function void modify(packet p);
    p.data = 50;
    $display(" changing data with p-handle : inside modify function data=%0d",p.data);
  endfunction
  
endclass

module tb;
  packet pkt;
  
  initial begin
    pkt = new();
    pkt.data=10;
    $display(" pkt-handle : before calling modify function data=%0d",pkt.data);
   pkt.modify(pkt);
    $display("pkt-handle : after calling modify function data=%0d",pkt.data);
    
  end
endmodule
         */

//=====================parameters==========================
///////////////////////Type Parameter////////////////////

/*class parent#(parameter type T = int);
  
  T data;
  T addr;
  bit id;
  
endclass

module tb;
  parent #(bit) p;//byte,int,logic,bit
 // parent p;
  initial begin
    p= new();
    p.data = 32'haabbccdd;
    p.addr=10;
    p.id=1;
    $display("data=%0h,addr=%0h,id=%0d",p.data,p.addr,p.id);
  end
  endmodule
*/


/////////////////////////value parameter//////////////////////
/*
class packet #(parameter DATA=8,WIDTH=16);
  bit[DATA-1:0]data;
  bit[WIDTH-1:0]width;
  
endclass
         
  module tb;
    initial begin
      packet #(16,8) p1;
      packet #(32,32)p2;
      p1=new();
      p2=new();
      p1.data = 16'haabb;
      p1.width=16'hbbaa;
      $display("data=%0h,width=%0h",p1.data,p1.width);
      $display("data=%b,width=%b",p2.data,p2.width);

    end
  endmodule */
       
       

/*
class my_transaction #(parameter type T = int);

 rand T req;
  
  function void display();
    $display("transaction = %p", req);
  endfunction

endclass
         
   
class trans_A #(parameter type T=int) ;
  rand T data;
  rand T addr;
  
  function void display();
    $display("trans_A : data=%0d,addr=%0d",data,addr);
  endfunction
endclass

class trans_B;
  rand int data;
  rand bit[31:0]addr;
  
  function void display();
    $display("trans_B : data=%0d,addr=%0d",data,addr);
  endfunction                
  
endclass
         
 
module tb;
  
  my_transaction #(trans_A #(bit)) A;
  my_transaction #(trans_B) B;
  
//  my_transaction (trans_A #(bit) t_A;
  
  initial begin 
    A = new();
    B = new();
    
    A.req=new();
    B.req=new();
    
  //  t_A=new();
    
    A.req.randomize();
    B.req.randomize();
    
    A.req.display();
    B.req.display();
  end
  
endmodule    */   


//////////////////////20/07/2026/////////////////////

// class my_param#(type t=int);
  
//   function void display();
//     t a=33;
//     $display("a is %0d",a);
//   endfunction 
    
// endclass

// //class my_child_param extends my_param#(byte);

// module test();
//   my_param#(logic[3:0]) a1;
  
//   initial begin
//     a1=new();
//     a1.display();
//   end
// endmodule
  

//////////////////parameterized class////////////////////////

/*  class C #(type T = bit); // base class 
    T a;
    function void display();
      a=33;
      // byte a=30;
      $display("class c : a is %0d , type : %0s",a,$typename(a));
    endfunction 
  endclass 
  
  class D1 #(type P = real) extends C; // T is bit (the default) 
    
     function void display();
       T a=33;
       P b=22.5;
       $display("class D1 : a is %0d, type=%0s,b is %0f, type=%0s",a,$typename(a),b,$typename(b));
     endfunction 
  endclass
  
class D2 #(type P = real) extends C #(integer); // T is integer 
    
    function void display();
      T a=33;
      P b=11.5;
      $display("class D2 : a is %0d,type=%0s, b is %0f,type=%0s",a,$typename(a),b,$typename(b));
    endfunction
  endclass
  
  class D3 #(type P = real) extends C #(P); //T is P
    
    function void display();
      T a=33;
      P b = 20;
      $display("class D3 : a is %0f ,type=%0s, b is %0f,type=%0s",a,$typename(a),b,$typename(b));
    endfunction
    
  endclass
  
class D4 #(type P = C#(real)) extends C#(real); // for default, T is real
    
  function void display_d4(C p1);
      p1.a=33;
   //   p1.T a=4.6;
    $display("class D4 : a is %0d,type=%0s",p1.a,$typename(p1.a));
    endfunction
    
  endclass

  module my_test();
    C  c1;
    D1 d1;
    D2 d2;
    D3 d3;
    D4 d4;
    initial begin
      c1=new();
      c1.display();
      
      d1=new();
      d1.display();
      
      d2=new();
      d2.display();
      
      d3=new();
      d3.display();
      
      d4=new();
      d4.display_d4(c1);
    end
  endmodule
*/


//-------------------17/07/2026---------------------------

////////////////////////////////experment\\\\\\\\\\\\\\\\\\\\\\\\\\\\

/*class parent;

  int id;
  bit [31:0]addr;
  
  task reset_signals();
    $display("parent : reset the signals");
  endtask
    
  task run_main();
      $display("parent : run_main task");
    endtask
    
 virtual task drive();
      $display("parent : drive is started");
      reset_signals();
      run_main();
      $display("parent : drive is ended");
    endtask   
endclass 
    

class child extends parent;
      
      int id;
      bit[31:0]addr;
      
     task reset_signals();
         $display("child : reset the signals");
       super.reset_signals();
       endtask
    
   task run_main();
      $display("child : run_main task");
    endtask
    
    task drive();
      $display("child: drive is started");
     super.reset_signals();
       super.run_main();
//      reset_signals();
  //    run_main();
      $display("child: drive is ended");

    endtask
          endclass


  class child1 extends child;
      
      int id;
      bit[31:0]addr;
      
 virtual task reset_signals();
       $display("child1 : reset the signals");
       endtask
    
  virtual task run_main();
     $display("child1 : run_main task");
    endtask
    
 virtual task drive();
      $display("child1 : drive is started");
     super.reset_signals();
       super.run_main();
     // reset_signals();
      //run_main();
      $display("child1 : drive is ended");

    endtask
         
    endclass
         


  class child2 extends child1;
      
      int id;
      bit[31:0]addr;
      
    virtual task reset_signals();
       $display("child2 : reset the signals");
       endtask
    
   virtual task run_main();
     $display("child2 : run_main task");
    endtask
    
virtual task drive();
  
      $display("child2 : drive is started");
    //  super.reset_signals();
     //super.run_main();
     reset_signals();
      run_main();
      $display("child2 : drive is ended");

    endtask
         
    endclass
         
         
         
  module tb;
   child  c;
      child1  c1;
      child2  c2;
      parent p;
    
    initial begin
   
      
    //  c2=new();
      c1=new();
    //  c=new();
           
     // c1=c2;
     c=c1;
      p=c;
     p.drive(); //pppp without virtual : with virtual
   //  c2.drive();
     //  c.drive();
    end
    
  endmodule*/



/////////////////super nd constructor//////////////////////

/*class parent;
  int data=1;
  int addr=2;
  int size=3;
  
  function new(int a);
    addr= 5;
    size=a;
    $display("parent : data=%0d,addr=%0d,size=%0d",data,addr,size);
  endfunction

endclass

class child extends parent;
  
  int id=4;
  bit valid=1;
  
//   function new(int id,bit valid);
//         super.new(id);

// //     this.id=id;
// //     this.valid=valid;
//  //   super.new(id);
//     $display("child : id =%0d, valid=%0d",id,valid);
//   endfunction
  
   function new();
        super.new(id);

//     this.id=id;
//     this.valid=valid;
 //   super.new(id);
    $display("child : id =%0d, valid=%0d",id,valid);
  endfunction
  
endclass
  
module tb;
  parent p;
  child c;
  
  initial begin
  //  c==new(10,20);
    c=new();
    c.size=30;
    $display(" %p",c);
  end
endmodule */


/*class animal;
  int a=7;
  int b;
  
  function new(int x);
    a=x;
    b=5;
    $display("animal : a=%0d,b=%0d",a,b);
  endfunction
  
endclass

class dog extends animal;
  int c=a;
  
 function new();
    super.new(66);
   $display("dog : c=%0d",c);
  endfunction
  
endclass


module tb;
  
  dog d;
  initial begin
    d=new();
    $display("%p",d);
  end
  
endmodule*/


//==========================20/07/2026========================================


////////////////////////// polymorphism ////////////////////////////////////////
/*
class parent;

 virtual function void display();
    $display("parent");
  endfunction
  
endclass

class child extends parent;
  
  function void display();
    $display("child");
  endfunction
endclass

  class child1 extends parent;
    
    function void display();
      $display("child1");
     // super.display();
    endfunction
    
  endclass
                     
  
module tb;
  child1 c1;
     parent p;
  child c;

  initial begin
    c1=new();
    
   //p=new c;
    c=new();
    p=c;
    p.display();
    
    c=new();
    p=c1;
    p.display();
    
    end
endmodule
*/


///------------------------Inheritance----------------------------

/*
class parent;
  int data;
  int addr;
  
  function void display_p();
    $display("parent : data =%0d, addr=%0d",data,addr);
  endfunction
endclass
  
  class child extends parent;
    
    int id;
    
    function void display_c();
      $display("child : data=%0d,addr=%0d,id=%0d",data,addr,id);
    endfunction
    endclass

module tb;
  parent p;
  child c;
  
  initial begin
    c=new();
    
    c.data=10;
    c.addr=20;
    c.id=30;
    c.display_c();
    c.display_p();
  end
endmodule */


/////////////////////////////method overriding/////////////////////////////


/*
class parent;
  int data;
  int addr;
  
  function void display();
    $display("parent : data =%0d, addr=%0d",data,addr);
  endfunction
endclass
  
  class child extends parent;
    
    int id;
    
    function void display();
      $display("child : data=%0d,addr=%0d,id=%0d",data,addr,id);
    endfunction
    endclass

module tb;
  parent p;
  child c;
  
  initial begin
    c=new();
    
    c.data=10;
    c.addr=20;
    c.id=30;
    c.display();
  end
endmodule

*/


//////////////////////////21/07/2026//////////////////////////////

////////////////////////////$cast///////////////////////////////////

/*
class parent;
   
  int id;
  bit[3:0] addr;
  
 virtual function void display();
    $display("parent : id =%0d,addr=%0d",id,addr);
  endfunction

endclass

class child extends parent;
  
  int data;
  
  function void display();
    $display("child : id=%0d,daar=%0d,data=%0d",id,addr,data);
  endfunction
  
endclass

module tb;
  parent p;
  child c1,c2;
  
  initial begin
    c1=new();
    p=c1;
    c1.id=10;
    c1.addr=33;
    c1.data=43;
    c1.display();
   // c2=p;
    $cast(c2,p);
    c2.data=11;
        c2.display();

  end
endmodule*/



//////////////////////////abstraction//////////////////////

/*
virtual class parent;
  
 virtual function void display();
  $display("parent");
  endfunction
  
endclass

class child#(type T=byte) extends parent;

  rand T addr;
  rand T data;
  
   // function void display();
  function void print();
    $display("child : addr=%0d,data=%0d",addr,data);
  endfunction
endclass

  module tb;
    child c;
    initial begin
      c=new();
      c.randomize();
      //c.display();
      c.print();
    end
    
  endmodule
  */
  
  
  
  //////////////////////pure virtual ////////////////////

/*virtual class transaction;
  
  pure virtual function void display();
    
endclass
    
    class apb_transaction extends transaction;
      
      function void display();
        $display("apb : apb_transaction");
      endfunction
    endclass
    
    class axi_transaction extends transaction;
      
      function void display();
        $display("axi : axi_transaction");
      endfunction
      
    endclass
    
    module tb;
      
      apb_transaction apb;
      axi_transaction axi;
      
      initial begin
        apb=new();
        apb.display();
        
        axi=new();
        axi.display();
      end
    endmodule
    */
