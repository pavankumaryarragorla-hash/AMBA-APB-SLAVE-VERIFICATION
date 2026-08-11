module tb;
  bit[7:0] a[16];
  bit[7:0] b[16];
  bit[2:0] count;
  initial begin
    
    for (int i=0;i<16;i++)begin
      a[i]=$urandom_range(1,50);
     // $display("a[%0d]=%0d",i,a[i]);
     
    end
     $display("a=%0p",a);
      $display("----------------");
    
    for(int i=0;i<16;i++)begin
      
      if(count<4)begin
        {b[i],b[count+12]}={a[count+12],a[i]};
        $display("b[%0d]=%h,b[0%d]=%h",i,count,b[i],b[count+12]);
        count=count+1;end
        else 
//           begin
//         {a[i],a[count+12]}={a[count+12],a[i]};

   //   $display("a[%0d]=%0d",i,a[i]);
      count=0;
//           end  
    end
     $display("a=%0p",a);
   // $display("b=%0p",b);
  end
endmodule

