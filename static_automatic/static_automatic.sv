// Code your testbench here
// or browse Examples
/////////////////////////////////class/////////////////////////////
//////static var inside class////////

/*
class packet;
  static int s;
  int a; //it is automatic nature by default
  
  function new();
    s++;
    a++;
   // $display("s=%0d a=%0d",s,a);
  endfunction
  
endclass

module tb;
  packet p[5];
  initial begin
    foreach(p[i])begin
      p[i]=new();
      $display(" s=%0d a=%0d ",p[i].s,p[i].a);
    end
    end
endmodule
*/

//////////////static method & var inside the class////////////////
/*
class transaction;
  
  static int s;
  int id;
  
  static function void s_incr();
    s++;
    //id++;
    endfunction
  
  function void incr();
    s++;
    id++;
  endfunction
  
endclass

module tb;
  transaction tr[];

  
  initial begin
    
    tr=new[5];
    foreach(tr[i])begin
     // tr[i] = new();
      //tr[i].s_incr();
      transaction::s_incr;
      $display("s=%0d ",transaction::s);
    end
    
    transaction::s=0;
    
    foreach(tr[i])begin
       tr[i]=new();
      tr[i].s_incr();
     
      		tr[i].incr();
          	$display("incr : s=%0d id=%0d",tr[i].s,tr[i].id);
      end    
  end
  
endmodule
*/
//////////////////////function static & automatic in class///////////////////////////
/*
class packet ;
//   int a ;
//   static int s;
  
  function static void s_display();
    int s;
     automatic int a;
    a++;  //without automatic it treat as a satic
    s++;
    $display("static : a=%0d s=%0d",a,s);
  endfunction
  
  function automatic void a_display();
    static int s;
     //int s;
     int a;
    a++;  //without static keyword for var s  it treat as a automatic
    s++;
    $display("automatic : a=%0d s=%0d",a,s);
  endfunction
  
  function void display();
  int a; 
    int s;
     a++;
    s++;
        $display("a=%0d s=%0d",a,s);
  endfunction
  
endclass

module tb;
  packet p;
  
  initial begin
    p=new();
    repeat(5)begin
    //  p.s_display();
    //  p.a_display();
      p.display();
    end
  end
  
endmodule*/


//////////////////////function static & automatic in module///////////////////////////
/*
module exp;
 // int a;
 // automatic int b; //illegal
  
  // automatic task incr(); //illegal syntax error
  
//   task incr();  // by default all var are satic until unless we mention as automatic.
//   automatic int a;
//     int b;
    
//     a++;
//     b++;
//     $display("a=%0d b=%0d",a,b);
//   endtask 
  
  task automatic incr;  // by default all var are automatic until unless we mention as static.
  static int a;
    int b;
    
    a++;
    b++;
    $display("a=%0d b=%0d",a,b);
  endtask
  
  initial begin
    repeat(5)begin
      incr();
    end
  end
endmodule */


///////////////////////////////////////
///       6-08-2026     ///
///////////////////////////////////////


///---------------return type is int------------------------
 /*module calling;
   bit[3:0] a;
   bit[3:0] b;
   int y,k;
   function int display(input int x,input int z,output int y);
     a=x;
     b=z;
     return (y=a+b);
   endfunction
     
   initial begin
     display(1,6,y);
     $display("a=%0d b=%0d y=%0d",a,b,y);
   end
 endmodule*/

//---------------------------------------------------------

/*
module p_struct;
  
  typedef struct packed {logic [7:0] addr;logic [7:0] data;} pkt_t;
  
function pkt_t build_pkt(input logic [7:0] a, d);
    pkt_t p;
    p.addr = a; p.data = d;
    return p;
endfunction
  pkt_t p;
  initial begin
   p = build_pkt(1,2);
    $display("%p",p);
  end
  
endmodule*/


///----------------dynamic array as return type-------------------------

/*typedef int dynamic[];

module tb #(parameter WIDTH=8,ADDR=8);
  bit[WIDTH-1:0]x;
  bit[ADDR-1:0]y;
  int z;

  function dynamic display(input int a,b);
   
        dynamic arr;
	x=a;
    y=b;
    
    arr=new[5];
   
    foreach (arr[i])begin
      arr[i]=a*b;
    end 
    
    return arr;
  endfunction
      //  tb #(.WIDTH(3),.ADDR(2)) dut();
  initial begin 
    dynamic arr;
    arr=new[5];
    foreach(arr[i])begin
      arr=display($urandom_range(1,10),2);
      $display(" x*y : %0d*%0d arr[%0d] = %0d",x,y,i,arr[i]);
  end 
              //$display("arr = %0p", arr);
  end  
endmodule*/

/*
class sample;
  rand bit[3:0] a;
  rand bit [3:0] b;
  
  function sample add(bit [3:0] a= 4'hA,b = 4'hE);
    sample s = new();
    s.a = a;
    s.b = b;
    
    return s;
  endfunction

endclass

module tb;
  sample s1,s2;
  
  initial begin
    s1 = new();
        s2 = s1.add();
    $display("a : %b %0d",s2.a,s2.a);
    $display("b : %b %0d",s2.b,s2.b);
  end
endmodule*/




///////////////// add(add(a,b),add(c,d));//////////////////////
//////////calling function and pass arguments as function/////////


/*
module exp;
  
  int a,b,c,d;
  int y;
  
  function int add(input int s,r);
    $display("s=%0d r=%0d",s,r);
    return (s+r);
  endfunction
  
  initial begin
    repeat(5) begin
    //  {a,b,c,d}=$urandom_range(5,20);
      a=$urandom_range(1,10);
      b=$urandom_range(5,20);
      c=$urandom_range(10,20);
      d=$urandom_range(1,20);
   y= add(add(a,b),add(c,d));
    $display("a=%0d b=%0d c=%0d d=%0d y=%0d",a,b,c,d,y);
  end
  end
endmodule */




