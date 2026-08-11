*module tb;
  
  bit[3:0] a = 4'b1001;
  bit[3:0]b = 4'b1100;
  logic[3:0] c = 4'b11x0;
  bit signed[3:0] s=4'b0110;
  bit signed[7:0] result;
  logic [3:0] l=4'b11x0;
  
  initial begin
    $display("LOGICAL OPERATOR a=%0b b=%0b c=%0b:: A&&B =%0d  A||B=%0d  !A =%0d  !c=%0d",a,b,c,a&&b,a||b,!a,!c);
    
    $display("LOGICAL OPERATOR a=%0b b=%0b c=%0b:: A&&C =%0d  A||C=%0d  !C =%0d  !C=%0d",a,b,c,a&&c,a||c,!c,!c);
    
    $display("BITWISE OPERATOR a=%0b b=%0b c=%0b:: a&b=%0d  a|b=%0d  a^b=%0d  ~a=%0d a~^b=%0d",a,b,c,a&b, a|b,a^b,~a,a~^b);
  
    $display("BITWISE OPERATOR a=%0b b=%0b c=%0b:: a&c=%0d  a|c=%0d  a^c=%0d  ~c=%0d a~^c=%0d",a,b,c,a&c, a|c,a^c,~c,a~^c);
    
    $display("REDUCTION OPERATOR a=%0b b=%0b c=%0b:: &b=%0d  |b=%0d  ~|a=%0d ^b=%0d  ~a=%0d ~^b=%0d",a,b,c,&b, |b,~|b,^b,~a,~^b);
    
      
    $display("REDUCTION OPERATOR a=%0b b=%0b c=%0b:: &C=%0d  |C=%0d ~|c=%0d ^C=%0d  ~C=%0d ~^C=%0d",a,b,c,&c, |c,~|c,^c,~c,~^c);
    
    result = (s << 2); // s * 2**2
    $display("LEFT SHIFT(mul) : s=%b result=%0b result=%0d",s,result,result);
    result = (s >> 2); // s % 2*2
    $display("RIGHT SHIFT(div) : s=%b result=%b,result=%0d",s,result,result);
    
    result = (s <<< 2); 
    $display("LEFT SHIFT : s=%b result=%0b result=%0d",s,result,result);
    result = (s >>> 2);
    $display("RIGHT SHIFT : s=%b result=%b,result=%0d",s,result,result);

    $display("EQUAL OPERATOR a=%b  b=%0b c=%b:: A==B =%0d  A!=B=%0d a==c=%b  a!=c=%b",a,b,c,a==b,a!=b,a==c,a!=c);
    $display("EQUAL OPERATOR l=%b c=%0b:: c===l =%0d  c!==l=%0d",l,c,c===l,c!==l);

    
  end
    
endmodule */

////////////////////////PRE/POST incr & DECR ///////////////////
/*
module tb;
  
  bit[3:0] a;
  bit[3:0] b;
  
  initial begin
    
    b=++a;
    $display("PRE INCR :: a=%0d  b=%0d",a,b);
    b=a++;   
    $display("POST INCR :: a=%0d  b=%0d",a,b);
    b=a--;
    $display("POST DECR :: a=%0d  b=%0d",a,b);
    b=--a;
    $display("POST DECR :: a=%0d  b=%0d",a,b);
    
  end

endmodule*/



// Code your design here
module mux_8 (
  input [7:0]i,
  input [2:0]sel,
output logic y);

//  assign y = sel[2] ? (sel[1] ? (sel[0] ? i[7] : i[6]) : (sel[0] ? i[5] : i[4])) : (sel[1]? (sel[0] ? i[3] : i[2]) : (sel[0] ? i[1] : i[0]));
  assign y = i[sel];

endmodule

/////////////////////tb for 8*1 mux//////////////////


module tb;

    logic [7:0] i;
    logic [2:0] sel;
    logic y;

    mux_8 dut (.i(i),.sel (sel),.y (y));

    initial begin
        i = 8'b1010_1100;
        repeat (10) begin
          sel = $urandom_range(0, 7);
            $display("sel = %0d  i[%0d] = %0d  y = %0d",sel,sel,i[sel],y);
        end
        $finish;
    end

endmodule

