/////////////////// Array query functions /////////////////// 

module tb; 
  int data[7:0]; 
  initial begin
//     $display("size() = %0d", data.size()); 
    $display("left() = %0d", $left(data,1));
    $display("right() = %0d", $right(data,1)); 
    $display("low() = %0d", $low(data,1));
    $display("high() = %0d", $high(data,1)); 
    $display("increment() = %0d", $increment(data,1));
    $display("dimensions() = %0d", $dimensions(data));
    $display("unpacked_dimensions() = %0d", $unpacked_dimensions(data)); 
  end 
endmodule
