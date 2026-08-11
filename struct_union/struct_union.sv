////======================== 7-7-2026  ======================



module tb;
///////////////////////////////STRUCT/////////////////////////////
 /* struct {
    int id;
    bit valid;
  } pkt1,pkt2;
  
  initial begin 
    pkt1.id =10;
    pkt1.valid=1;
    pkt2.id=120;
    pkt2.valid=1;
    $display("PKT1: id=%0d,valid=%0d",pkt1.id,pkt1.valid);
    $display("PKT2: id=%0d,valid=%0d",pkt2.id,pkt2.valid);
    
  end */
  
  //////////////////////////STRUCT WITH TYPEDEF(UNPACKED)////////////////////////
  
  /*typedef struct {
    int id;
    bit valid;
  } packet_t;

  packet_t pkt;

  initial begin
    pkt.id    = 20;
    pkt.valid = 1;

    $display("ID = %0d", pkt.id);
    $display("VALID = %0b", pkt.valid);
  end */
  
  ///////////////////////////////////PACKED STRUCT////////////////////////

/*typedef struct packed{
    bit [7:0] addr;
    bit [7:0] data;
    bit valid;
} packet_t;

packet_t pkt;

initial begin

    pkt.addr  = 8'h12;
    pkt.data  = 8'h34;
    pkt.valid = 1;

  $display("%p",pkt);
  $display("%b",pkt);


end */
  
 //////////////PACKED & UNPACKED == legal vs illegal//////////////////
  
            /////////legal in packed//////////
/*  typedef struct packed{
    bit [7:0] addr;
    bit [7:0] data;
} packet_t;

  initial begin
bit [15:0] bus;

packet_t pkt;
pkt.data=1;
bus = pkt;
    $display("bus =%0d,pkt=%0d",bus,pkt);
  end */
  
  /////////illegal in unpacked////////////////
  
 /*   typedef struct {
    bit [7:0] addr;
    bit [7:0] data;
} packet_t;

  initial begin
bit [15:0] bus;

packet_t pkt;
pkt.data=1;
bus = pkt;
    $display("bus =%0d,pkt=%0d",bus,pkt);
  end
*/

/*  Error-[ICTA] Incompatible complex type
testbench.sv, 87
  Incompatible complex type assignment
  Type of source expression is incompatible with type of target expression. 
  Mismatching types cannot be used in assignments, initializations and 
  instantiations. The type of the target is 'bit[15:0]', while the type of the
  source is 'struct tb.packet_t'.
  Source Expression: pkt   */
  
  
  ////////////////NESTED STRUCT for UNPACKED//////////////////
  
/*typedef struct {
    int id;
    int data;
  bit write;
} data_info;

typedef struct {
    string name;
    int addr;
    data_info d_info;
} addr_info;

addr_info a_info;

initial begin

    a_info.name      = "AXI";
    a_info.addr       = 25;

    a_info.d_info.id   = 7;
    a_info.d_info.data = 20;
    a_info.d_info.write  = 1;

  $display("Name  = %s",a_info.name);
  $display("Addr   = %0d",a_info.addr);
  $display("Data_info   = %0d/%0d/%0d",
              a_info.d_info.id,
              a_info.d_info.data,
              a_info.d_info.write);

end */

  
  /////////////////////NESTED STRUCT (UNPACKED)//////////////////////////////

/*typedef struct packed {

    bit [7:0] addr;
    bit [2:0] burst;

} address_t;


typedef struct packed {

    address_t address;
    bit [7:0] data;
    bit valid;

} packet_t;


packet_t pkt;

initial begin

    pkt.address.addr  = 8'h12;
    pkt.address.burst = 3'b101;

    pkt.data  = 8'hAA;
    pkt.valid = 1;

    $display("Packet = %b", pkt);
  $display("Packet = %P", pkt);


end
*/

 ////////////////array of struct//////////////////

/*typedef struct {

    int id;
    bit valid;

} packet_t;

packet_t pkt[4];

initial begin

    pkt[0].id    = 10;
    pkt[0].valid = 1;

    pkt[1].id    = 20;
    pkt[1].valid = 0;

    pkt[2].id    = 30;
    pkt[2].valid = 1;

    pkt[3].id    = 40;
    pkt[3].valid = 1;

    for(int i=0;i<4;i++)
        $display("pkt[%0d] : id=%0d valid=%0b",
                 i,pkt[i].id,pkt[i].valid);

end

*/
  
  /////////////////Struct Containing Arrays (Arrays Inside a Struct)//////////////////
  

// typedef struct {

//     int id[4];
//     bit valid[4];

// } packet_t;

// packet_t pkt;

// initial begin

//     pkt.id[0] = 10;
//     pkt.id[1] = 20;
//     pkt.id[2] = 30;
//     pkt.id[3] = 40;

//     pkt.valid[0] = 1;
//     pkt.valid[1] = 0;
//     pkt.valid[2] = 1;
//     pkt.valid[3] = 1;

//     for(int i=0;i<4;i++)
//         $display("id=%0d valid=%0b",
//                   pkt.id[i],
//                   pkt.valid[i]);

// end
  
  
////////////////Passing a Struct as input and ref--- TASK----////////////////////  
  

/*typedef struct {
    int id;
    bit valid;
} packet_t;

packet_t pkt;

  task display_packet(input packet_t p);

    p.id = 200;

    $display("Inside Task");
    $display("id=%0d valid=%0b", p.id, p.valid);

endtask

initial begin

    pkt.id = 100;
    pkt.valid = 1;

  display_packet(pkt);//original pkt will not change(if you take "ref" original pkt will affected)

    $display("Outside Task");
    $display("id=%0d valid=%0b", pkt.id, pkt.valid);

end*/
  
  
  
  
  
  //++++++++++++++++++  UNION   +++++++++++++++++++++++++++++++++==

  
  
  ////////////////////different width/////////////////////
 /* 
 typedef union {
  
    int a;
    byte b;
   logic c;
   
  }u_t;
  
  u_t u;
  
  initial begin
  u.a=32'haabbccdd;
     $display("a=%b,b=%b,c=%b",u.a,u.b,u.c);
    u.b = 7;
        $display("a=%b,b=%b,c=%b",u.a,u.b,u.c);
    u.c = 1'b0;
     $display("a=%b,b=%b,c=%b",u.a,u.b,u.c);
  end */
 
  
  ////////////////////same width//////////////////////////
  
 typedef union {

    int a;
    bit [31:0] b;

} data_t;

data_t u1;
data_t u2;

initial begin

    u1.a = 25;
    u2.a = 50;

  $display("u1 : a = %0d,b =%0d", u1.a,u1.b);
  $display("u2 : a= %0d,b=%0d", u2.a,u2.b);
end
  
  
 
endmodule
