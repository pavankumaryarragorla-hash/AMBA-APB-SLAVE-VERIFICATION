

/*module tb;
  
  task task_a;
    $display("Time:%0t task_a started",$time);
    #10
    $display("Time:%0t task_a end",$time);
  endtask
  
   task task_b;
     $display("Time:%0t task_b started",$time);
    #15
     $display("Time:%0t task_b end",$time);
  endtask
  
   task task_c;
     $display("Time:%0t task_c ",$time);
  endtask
  
  
  initial begin 
    fork
    task_a;
    task_b;
    task_c;
    join  
end
  
endmodule */


/////////////////////for loop - fork///////////////////////
/*
module for_fork;
//int a;
  
  initial begin
    // fork // this is normal loop behavior only.
    for(int i=0;i<3;i++)begin
      $display("time : %0t  before fork i=%0d",$time,i);                            
        //#4;//working 
      fork
       //  a++;
        // #5; // no changes
     //   $display("a=%0d",a);
      //  automatic int k=i;
      //  $display("time : %0t inside fork(automatic) k=%0d",$time,k);
        $display("time : %0t inside fork i=%0d",$time,i);
                                          //#10; // no changes
      join_none
    end
                                 //join_none 
  end
endmodule
*/

/*
module exp;
  
  initial begin
  
  fork
//------------------------tread 1 --------------------------------    
    fork
      #5 $display("$TIME : %0t tread 1",$time);   
    join_any
 //--------------------tread 2 ---------------------------
    fork
      #5 $display("$TIME : %0d tread2",$time);
      for(int i=0;i<3;i++)begin
       // #1;
        $display("$TIME : %0d inside for loop i=%0d",$time,i);
      end
    join_any
//------------------tread 3---------------------    
    fork
      #6;
      $display("$TIME : %0d tread 3",$time);
    join_any
    
//-------------------tread 4-----------------------    
    $display("$TIME : %0t inside outer join",$time);
    
  join

    $display("$TIME : %0t after join",$time);

  end
  
endmodule
*/

//////////////////////////exp///////////

/*
module exp;
  initial begin
 //   #35;
    //---------------F1 ---------------
    fork //F1
      #10 $display("Time : %0t F1 T1",$time);
      
      fork //f2
        #20 $display("Time : %0t F2 T1",$time);
        #30 $display("Time : %0t F2 T2",$time);
        #40 $display("Time : %0t F2 T3",$time);
        #5 $display("Time : %0t F2 T4",$time);
      join //f2 end
      
      
      #5 $display("Time : %0t F1 T2(0)",$time);
      #20 $display("Time : %0t F1 T2(1)",$time);
      
    
      fork //f3
        #50 $display("Time : %0t F3 T1",$time);
        
        fork //f4
          #10 $display("Time : %0t F4 T1",$time);
          #15 $display("Time : %0t F4 T2",$time);
        join //f4 end
     
      join //f3 end

      #25 $display("Time : %0t F1 T4",$time);

      fork //f5
        #50 $display("Time : %0t  f5 t1",$time);
        #20 $display("Time : %0t  f5 t2",$time);
        #10 $display("Time : %0t  f5 t3",$time);

        fork //f6 
          #30 $display("Time : %0t F6 T1",$time);
          #35 $display("Time : %0t F6 T2",$time);

        join
        
      join//f5end
      
    join //F1 end
  end
  
endmodule*/

//-------------------------------------------------
//----------------5/07/2026-------------------------//
//-------------------------------------------------
/*
program tb;
  
  task task_a;
    $display("Time:%0t task_a started",$time);
    //#10
  #10  $display("Time:%0t task_a end",$time);
  endtask
  
   task task_b;
    
     $display("Time:%0t task_b started",$time);
    #15
     $display("Time:%0t task_b end",$time);
  endtask
  
   task task_c;
     $display("Time:%0t task_c ",$time);
  endtask
  
  
  initial begin 
    fork
    task_a;
    task_b;
    task_c;
    join  
end
  
  
  endprogram */


/*module tb;
  initial begin
    fork 
      #5 $display("fork 1 is started");
     #2 $display("f ");
    join
  end
endmodule*/

//----- Without wait-fork, change the behaviour of join_any to join_none---------

/*
module tb;
  
  initial begin
    fork 
      begin:A
        #1 $display($time,"\tA");
      end:A
      disable fork;
    join_any
      $display("\tOutside fork");
  end
endmodule
*/



//---------------- join to join_any--------------------------
/*
module tb;
  
  initial begin
    fork
      	begin:p1
          #10 $display($time,"\tA");
        end:p1
      begin
        $display($time,"\tB");
        disable p1;
      end
    join
    $display("exists child");
  end
  
endmodule
*/

// from join_none to join using semaphore
/*
module tb;
  semaphore smp = new(0);
  
  initial begin
    fork 
      begin
        smp.put(1);
        $display("1");
      end
      begin
        smp.put(2);
        $display("2");
      end
    join_none
    smp.get(2);
//     smp.try_get(2);
    $display("Outside");
  end
endmodule
*/

//----------- from join_none to join using event-----------------------
/*
module tb;
event e2,e3;
  
  initial begin
    fork 
      begin
        $display("1");
       
        fork
          #10 $display("1-1");
          ->e2;
        join
      end
      begin
        @e2;
       #20 $display("2");
        ->e3;
      end
    join_none
    @(e3);
    $display("Outside");
  end
endmodule
*/

//calling a task inside a function

/*
module tb;
  int x,y,z;
  
  task add(input int x,y,output int z);
    $display("task1 add x=%0d y=%0d z=%0d",x,y,z);
    z = x + y;
    $display("task2 add x=%0d y=%0d z=%0d",x,y,z);
  endtask
  
  function int add1();
    begin
    //  fork
      $display("f add x=%0d y=%0d z=%0d",x,y,z);
      add(7,3,z);
      $display("f add x=%0d y=%0d z=%0d",x,y,z);
    //  join_none
    end
  endfunction
  
  initial begin
    add1();
  end
endmodule
*/


//           |above|
//without join none it jjust giveing some warning
// Warning-[TEIF] Task enabled inside a function
// testbench.sv, 294
// tb, "add(7, 3, z);"
//   Task 'add' is enabled inside function 'add1', it may bring delays into the 
//   function.



// module dut();
//   reg [3:0] in=4'b0101;
//   bit clk=1;
  
//   always_ff @(posedge clk)begin
//     fork
// //       in = 4'b0010;
//       $display($time,"%d",in);
//       $display($time,"statement-1");
//     join
//   end
// //   always #5 clk = ~clk;
// //   initial begin
// //     in = 9;
// //     #1;
// //     $display("%d",in);
// //     in = 7;
// //     $display("%d",in);

// //   end
  
//   initial begin
// // $dumpfile("dump.vcd"); $dumpvars;
//     #50 $finish();
//   end
// endmodule

//------------------always latch---------------------------

/*
module tb;
  int a,b;
  
  always_latch begin
    #5;
    fork
      a = $urandom_range(1,10);
      $display($time,"\ta:%0d",a);
      fork
        b = $urandom_range(1,10);
      	#10
        $display($time,"\tb:%0d",b);
      join_any
    join
  end
endmodule */
//----------------always_comb---------------------

/*    always_comb begin
    #5;
    fork
      a = $urandom_range(1,10);
      $display($time,"\ta:%0d",a);				
      fork
        b = $urandom_range(1,10);
      	#10
        $display($time,"\tb:%0d",b);
      join_any
    join
  end
endmodule */


// Error-[SE] Syntax error
//   Following verilog source has syntax error :
//   "testbench.sv", 362: token is 'always_comb'
//       always_comb begin
//                  ^
//   SystemVerilog  keyword 'always_comb' is not expected to be used in this 
//   context.


///////////////////////join to any/////////////
/*

module tb;
  event a;
  
  task add();
  #10  $display(" [%0t] add",$time);
    endtask
    
    task mul();
      $display(" [%0t] mul",$time);
    endtask
  
  initial begin
   
    fork
    begin
      mul();
    end
      begin
      @(a);
      end
      begin
      add();
      end
    join
    
    $display("after fork");
    ->a;
  end
endmodule */


module tb;
  
  initial begin
    fork : f
      begin : block1
        #10;
        $display("[%0t] 1",$time);
        #5;
        $display("[%0t] 2",$time);
        disable f;
      end
      
      
      begin
        #2;
        $display("[%0t] 3",$time);
        #20;
        $display("[%0t] 4",$time);
      end
      
    join
 $display("[%0t] after fork",$time);
  end
endmodule
