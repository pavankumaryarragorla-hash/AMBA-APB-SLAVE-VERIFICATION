
//////////////////Packed array//////////////////

/*module pkd;
  
  bit [3:0][2:0] a = '{3'd1,3'd5,3'd7,3'd3};
  initial begin
    foreach(a[i,j])begin
      $display("a[%0d][%0d]=%b",i,j,a[i][j]);
    end
    $display("a[0]=%0d",a[0]);
  end
  
endmodule */


//////////////unpacked array////////////////////
/*
module unpkd;
  int a[3:0][2:0];
  initial begin
    a='{'{10,7,9},'{5,6,8},'{3,8,3},{9,8,7}};
    foreach(a[i,j])begin
      $display("a[%0d][%0d]=%0d",i,j,a[i][j]);
    end
    $display("a[3][2]=%0d",a[3][2]);
  end    
endmodule 
*/
////////////packed and unpacked array//////////

/*module pkd_unpkd;
  
  bit [3:0] a [3:0][2:0];
  initial begin
    a= '{'{4'd3,4'd4,4'd7},'{4'd10,4'd15,4'd5},'{4'd4,4'd8,4'd1},'{4'd3,4'd5,4'd11}};
    foreach (a[i,j,k])begin
      $display("a[%0d][%0d][%0d]=%0d",i,j,k,a[i][j][k]);
      end
    $display("accesing particular index : a[0][1][0]=%0d",a[0][1][0]);
    end */
  
 /* bit [3:0][2:0] a[1:0];
  initial begin
    a='{'{3'd3,3'd4,3'd7,3'd6}, '{4,2,5,1}};
    foreach (a[i,j,k])begin
      $display("a[%0d[%0d][%0d]=%0d",i,j,k,a[i][j][k]);
    end
    $display("a[1][2]=%0d",a[1][2]);
  end */
  
  /*bit[2:0][3:0]a[1:0][2:0];
  initial begin

//     a='{'{'{'{4},'{5},'{7}},'{'{1},'{7},'{9}},'{'{3},'{3},'{1}}},'{'{'{1},'{1},'{1}},'{'{2},'{2},'{2}},'{'{0},'{0},'{3}}}
//        };
    a[1][2]='hABC;
    $display(" a[1][1]=%0d",a[1][1]);
     $display("%p",a);
  end
  
endmodule*/



