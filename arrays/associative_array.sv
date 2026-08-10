module  tb; 
/////////////////////////associative array////////////////////
  
 /* int a[int];
  string s[string];
  
  int idx;
  //int key;
  
  initial begin
    a[1]=10;
    a[3]=20;
    a[8]=30;
    a[5]=40;
    a[10]=50;
    

//     if (a.first(key))
//   do begin
//     $display("%0d -> %0d", key, a[key]);
//   end
//   while (a.next(key));
    
    foreach(a[i])begin
      $display("a[%0d]=%0d",i,a[i]);
    end
   
    
   $display("%p",a);
    //////////////////methods ////////////////////
    
    $display("----------Exists method------------");
    if(a.exists(8))
      $display("key is exists a[8] :%0d",a[8]);
    
    $display("----------num()-----------");
    
    $display("Number of entries is: %0d",a.num());
    
    $display("------------Frist------------");
    
    a.first(idx);
    $display("Frist key is a[%0d] : %0d",idx,a[idx]);
    
    $display("------------Last------------");

    a.last(idx);
    $display("last key is a[%0d] : %0d",idx,a[idx]);
    
    $display("------------Next------------");

    
    idx = 8;
    a.next(idx);
    $display("next  key is a[%0d] : %0d",idx,a[idx]);
    
    $display("------------Prev------------");

    a.prev(idx);
    $display("prev key is a[%0d] : %0d",idx,a[idx]);
    
    $display("------------Delete------------");

    
    a.delete(5);
    $display("deleted index is %0d",idx);
    
    a.delete();
    $display("deleted the completed array : %p",a);
    $display("++++++++++++++++++++++++++++++++++++++++++++++++++++");

  end
  
  initial begin
    
    string name;
    
      s["pavan"]=24;
    s["kumar"]=7;
    s["venkata"]=23;
   
  
    foreach(s[j])begin
      $display("s[%s]=%0d",j,s[j]);
    end
    
    $display("----------Exists method------------");
    if(s.exists("pavan")) begin
      $display("pavan exists s[%s] :%0d",name,s[name]);
     // $display("%p",s); 
//       else
//         $display("key is not exists");
    end
    
    $display("----------num()-----------");
    
    $display("Number of entries is: %0d",s.num());
    
    $display("------------Frist------------");
    
    s.first(name);
    $display("Frist key is s[%s] : %0d",name,s[name]);
    
    $display("------------Last------------");

    s.last(name);
    $display("last key is s[%s] : %0d",name,s[name]);
    
    $display("------------Next------------");

    
    name = "kumar";
    s.next(name);
    $display("next  key is s[%s] : %0d",name,s[name]);
    
    $display("------------Prev------------");

    s.prev(name);
    $display("prev key is s[%s] : %0d",name,s[name]);
    
    $display("------------Delete------------");

    
    s.delete("venkata");
    $display("deleted index is %s",name);
    $display("%p",s);
    
    s.delete();
    $display("deleted the completed array : %p",s);
  
  end */
  
  endmodule
