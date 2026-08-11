/////////////////////////////////////////////
////////////////process/////////////////////
////////////////////////////////////////////


/*module tb;
int a;  
  process p;
  
  initial begin  //paarent
    fork  //child
    //  begin
       p = process::self();
        a++;
        #20  $display("time : %0t child is finished a=%0d",$time,a);
 //     end
   // join
    join_any
  
  wait(p!=null)      
  
   // p.await();
    $display(" time : %0t waiting for child",$time);
    $display("status -> %s",p.status());
      
  end
endmodule*/

/////////////////////////////****IMP*****////////////////////
module tb;
  process p,p1;
initial begin
  
  fork
    begin
    p=process::self();
    begin
    #1;
      $display("t1-1 time:%0t status -> %s",$time,p.status());
    end
    end 
    begin
      $display("t2 time:%0t before suspend status -> %s",$time,p.status());
      p.suspend();
      $display("t2 time:%0t after suspend status -> %s",$time,p.status());
    end
    
    begin 
      #2;
      p.resume();
      $display("t3 time:%0t after resume status -> %s",$time,p.status());
      p.await();
      $display("after await");
    end
    
  join_none
 //  wait(p!=null)  
     //   p.resume();
  $display(" t0 time=%0t outside fork ",$time);
    end
endmodule 

/*
module tb;

  process p;

  initial begin

    fork

      begin  //child -1 process // this process alive on 20ns after this it will finish
      //  p = process::self();

        $display("[%0t] Child A Started  status %0s", $time,p.status());
        #20;
        $display("[%0t] Child A Finished  status %0s", $time,p.status());
      end

     
      begin  //child 2 process

        // Wait until p gets initialized
       // wait(p != null);
        p = process::self();
        #5;
        $display("[%0t] Status 1= %s", $time, p.status());
        #10;
        $display("[%0t] Status 2= %s", $time, p.status());
     //   #5;
        $display("[%0t] Status 3= %s", $time, p.status());
		#10;
        p.kill();
        $display("[%0t] Status 4= %s", $time, p.status());
      end	

    join
  end

endmodule*/
