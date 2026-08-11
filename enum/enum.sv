//--------------------------------enum //-----------------------

module tb;

/*typedef enum {read,write,read_write}op_code;
op_code e;

initial begin
  
  e=write;
  $display("write=%0d",write);
  //$display("%p",e);
end*/

  //////////////Explicit Value Assignment && automatic increment///////////////
  
 /* typedef enum {read=5,write,read_write}op_code;
op_code e;

initial begin

 // e=write;
  
   $display("read=%0d",read);
  $display("write=%0d",write);
  $display("read_write=%0d",read_write);
 
end */

  ///////////////////////NEGATIVE VALUES//////////////////
 
  /*typedef enum {

    NEG = -2,
    ZERO ,
    POS = 2

} number_t;
  
  initial begin
  $display("NEG=%0d",NEG);
  $display("ZERO=%0d",ZERO);
  $display("POS=%0d",POS);
  end  */
  
  //////////////////duplicte values(ERROR)//////////////////
  
/*  typedef enum {

    add = 0,
    sub = 0,
    jmp = 1

} opcode_t;

initial begin

    $display("add = %0d", add);
    $display("sub = %0d", sub);
    $display("jmp = %0d", jmp);

end*/
  
  /////////////////////enum methods///////////////
typedef enum {

    add,
    sub,
    jmp,
    mul

} opcode_t;

opcode_t opcode;

initial begin

 
    opcode = sub;


  
    $display("opcode        = %s", opcode.name());
    $display("Integer Value = %0d", opcode);

    $display("\nfirst() = %s", opcode.first().name());

  
    $display("last()  = %s", opcode.last().name());

    $display("next()  = %s", opcode.next().name());


    $display("prev()  = %s", opcode.prev().name());

  
  $display("num()   = %0d", opcode.num());

    $display("name()  = %s", opcode.name());

end


  endmodule
