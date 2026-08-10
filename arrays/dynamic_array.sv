module dynamic_array;
 
  
  /*
  int a[][];
  
  initial begin
    a=new[5];

    foreach(a[i])begin
      a[i]=new[(i*5)+1];
      
    end
    $display("%p",a);
    
    foreach(a[i,j])begin
      a[i][j]=$urandom_range(1,25);
    end
        $display("%p",a);
    
    a[2][1]=5;
    $display("a[2][0]=%0d",a[2][0]);
            $display("%p",a);


  end
  */
  
  
  ////////////Dynamic array----methods///////////////////
  
/* bit[31:0] a[];
  
  initial begin
    a=new[5];
    a='{10,20,30,40,50};
    
    foreach(a[i])begin
      $display("a[%0d]=%0d",i,a[i]);
  end
    $display("array size=%0d",a.size());
    a=new[7](a);
    $display("after resizeing a=%0d",a.size());
        $display("a=%p",a);

    a=new[2](a);
    $display("after shrink a=%0d",a.size());
    
    $display("a=%p",a);
    a.delete();
    $display("after delete a=%0d",a.size());
        $display("a=%p",a);

    
  end */
  
//   8.
// a. Initialize the dynamic array of size 20 elements with random values between 20 and 60.
// Find out the indexes of the elements whose value is <50. Display those indexes.
// b. Change the above dynamic array size to 30 elements and retain the old values.
  
 /* int a[];
  initial begin
    a=new[20];
    foreach(a[i])begin 
      a[i]=$urandom_range(20,60);end
    foreach(a[i])begin
    if(a[i]<50)
      $display("a[%0d]=%0d",i,a[i]);end
    
   $display("%p",a);
    end
    
*/
endmodule
