module array;

 /* bit[7:0] d[][];
  
  initial begin
    d=new[5];
    
    foreach(d[i])begin
      d[i]=new[4];
 	 end
    $display("%p",d);
    
   // d='{'{0,1,2,4},'{33,52,6,2},'{4,9,3,2},'{5,4,88,2},'{7,5,8,2}};
  
    foreach(d[i,j])begin
      d[i][j]=$urandom_range(1,25);
    end
    
    $display("%p",d);
    d[0][1]=1;
    $display("d[1][3]=%d",d[1][3]);
	$display("%p",d);

  end*/

  
  //============================[][int]==================================== 
  
  
  /*
 // bit[7:0] d_a[][int];
   bit[7:0] d_a[][string];
  
  initial begin
    d_a=new[5];
    
        // d_a='{'{1,2,3,4,5},'{1,2,3,4},'{1,2,3},'{1,2},'{1}};//method1 

//     d_a[0][3]=10;  ///method2
//     d_a[0][5]=20;
//     d_a[1][2]=11;
//     d_a[1][6]=44;
//     d_a[1][4]=33;
//     d_a[2][0]=2;
//     d_a[2][9]=5;
//     $display("%p",d_a);
    
    
    ////////////method3/////////////
    foreach(d_a[i]) begin
      //       d_a[i][4+i*2]=$urandom_range(1,20);
//       $display("d_a[%0d][%0d]=%0d",i,4+i,d_a[i][4+i]);
   
//       d_a[i][7]=$urandom_range(20,30);
//       $display("d_a[%0d][%0d]=%0d",i,7,d_a[i][7]);

      d_a[i][$urandom_range(65,80)]=$urandom_range(1,15);

    end
    
    $display("%p",d_a);
  end
  */
  
  
//==========================================================================  
  
  
////////////not workig with foreach loop///////////////
  //////////////bec i is not initializing///////////
/* int arr[$];
  initial begin
    
    for(int i=0;i<5;i++)begin
      arr[i]=i+1;
    end
    
//     foreach(arr[i])begin
//       arr.push_back(i+1); 
//       $display("");
//     end
    $display("%p",arr);
  end
  
  */
  
  //======================================[][$]============================= 
  
  
/* int d_q[][$];
  int r[][$];    

  
  initial begin
    d_q=new[3];
   // d_q[0]='{10,20,30,40,50};
    
    
    //d_q[0][0];
    //d_q[0][1];
    //------------------writing----------------------
    
    ///-----------1.its not working--------------------

//     foreach(d_q[i,j])begin
//      // if(j<5)begin
//         // $display("j =%0d",j);
//       d_q[i].push_front($urandom_range(1,20));
      
//     //  end
//     end
//     $display("%p",d_q); 
    
    
//     //--------------2.its working-----------------
     foreach(d_q[i])begin
       repeat(5)begin
      
         d_q[i].push_front($urandom_range(1,20));//method act like a "j"
      
       end  
    end
     $display("%p",d_q);
    
    //----------------3.its working-----------------
//     for (int i=0;i<3;i++)begin
//       for(int j=0;j<4;j++)begin
//         d_q[i].push_back($urandom_range(1,20));
//       end
//     end
  
//     $display("%p",d_q);
//     $display("d_q[1][2]=%0d",d_q[1][2]);
    
    
    //------------reading ------------------
   // int r[][$];
    foreach(d_q[i,j])begin
      $display("d_q[%0d][%0d]=%0d",i,j,d_q[i][j]);
               end
  //  r=new[3];  
//     r=d_q;
//     $display("r :%p",r);
//     d_q[0][0]=1;
//     $display("r :%p",r);
//     $display("d_q :%p",d_q);
  
  end
  */
  
  //===============================[*][*]===================================
  
 /* int aa[*][*];
  int kk;
  initial begin
    for(int i=0;i<5;i++)begin
      for(int j=0;j<5;j++)begin
        kk=$urandom_range(20,40);
        aa[i][kk]=$urandom_range(10,20);
        $display("aa[%0d][%0d]=%0d",i,kk,aa[i][kk]);
      //  aa[$urandom_range(1,10)][$urandom_range(2,20)]=$urandom_range(100,200);
        //aa[$urandom_range(200,300)]= $urandom_range(10,50);
      end
  end
    $display("aa:%p",aa);
  end*/
  
  //=====================================[*][string]========================
/*  
  int aa[*][string];
  string char;
  initial begin
    
    //------------------writing-------------------
    for(int i=0;i<5;i++)begin
      for(int j=0;j<5;j++)begin
        char=$urandom_range(70,90);
        aa[i][char]=$urandom_range(10,20);
        $display("aa[%0d][%0s]=%0d",i,char,aa[i][char]);
      //  aa[$urandom_range(1,10)][$urandom_range(2,20)]=$urandom_range(100,200);
        
  end
    end
    $display("aa:%p",aa);
    
    //----------------reading--------------------
    foreach(aa[i,j])begin
      $display("aa : a[%0d][%0s]=%0d",i,j,aa[i][j]);
    end
  end 
  */
  
  //========================[*][]=============================================
  
 /* int a_d[int][];
  
  initial begin
    for(int i =0;i<5;i++)begin
      
      a_d[$urandom_range(20,50)]=new[3];
    end
    
    
    
    foreach(a_d[i,j])begin
      a_d[i][j]=$urandom_range(40,90);
    end
    $display("%p",a_d);
  end
  */
  
  //=====================[*][$]============================= =====================
  
  /*
  int a_q[string][$];
  string idx;
  
  initial begin
    for(int i=0;i<3;i++)begin
      idx=$urandom_range(65,80);

      for(int j=0;j<5;j++)begin
     //   a_q[idx][j]=$urandom_range(1,50);
        a_q[idx].push_back($urandom_range(1,50));

        $display("a_q[%0s][%0d]=%0d",idx,j,a_q[idx][j]);
    end
    end
    $display("%p",a_q);
  end
 */
  
  //============================[$][$]=========================================
 /* 
  int q[$][$];
  
  
  initial begin
    for(int i=0;i<5;i++)begin
      for(int j=0;j<3;j++)begin
        q[i][j]=$urandom_range(10,40);
        $display("q[%0d][%0d]=%0d",i,j,q[i][j]);
      end
    end
    $display("%p",q);
  end
  */
 
  
  //=============================[$][]==============================
/* 
  int q_d[$][];
  
  initial begin 
    for(int i=0;i<5;i++)begin
      for(int j=0;j<3;j++)begin
        q_d[i]=new[j+1];
        q_d[i][j]=$urandom_range(1,30);
        $display("q_d[%0d][%0d]=%0d",i,j,q_d[i][j]);
    end
  end
    $display("%p",q_d);
  end*/
  
  //============================[$][int]==============================
  
/*  int q_a[$][int];
  int idx;
  
  initial begin
    for(int i=0;i<5;i++)begin
      for(int j=0;j<4;j++)begin
              idx=$urandom_range(10,300);
        q_a[i][idx]=$urandom_range(1,30); 
        $display("q_a[%0d][%0d]=%0d",i,idx,q_a[i][idx]);
      end
    end
    $display("%p",q_a);
    end
  
  */
  
  
  //========================[][][]================================================
  
 /* int ddd[][][];
  
  initial begin
    ddd=new[5];
   
    foreach(ddd[i])begin
      ddd[i]=new[4];
    end
      foreach(ddd[i,j])begin
        ddd[i][j]=new[3];  
      end
    foreach(ddd[i,j,k])begin
      ddd[i][j][k]=$urandom_range(10,100);
      $display("ddd[%0d][%0d][%0d]=%0d",i,j,k,ddd[i][j][k]);
    
    end
      
    
    $display("%p",ddd);
  end*/
  
  //==========================[$][$][]=======================================
  
/*  int qqd[$][$][];
  
  initial begin
    for(int i=0;i<5;i++)begin
      for(int j=0;j<4;j++)begin
        qqd[i][j]=new[2];
      end
    end
    
    foreach(qqd[i,j,k])begin
      // qqd[i][j].push_back($urandom_range(10,50));  //for dynamic array we cant use queue methods
      qqd[i][j][k]=$urandom_range(10,500);
      $display("ddd[%0d][%0d][%0d]=%0d",i,j,k,qqd[i][j][k]);

    end
    $display("%p",qqd);
  end
  */
  
  //=============================[][][$]=========================================
  
 /* int ddq[][][$];
  
  initial begin
    ddq=new[5];
    
    for(int i=0;i<5;i++)begin
      ddq[i]=new[4];
    end
    
    foreach(ddq[i,j])begin
      ddq[i][j].push_back($urandom_range(1,50));
     // $display("ddq[%0d][%0d][%0d]=%0d",i,j,k,ddq[i][j][k]);
    end
    
    foreach(ddq[i,j,k])begin
      $display("ddq[%0d][%0d][%0d]=%0d",i,j,k,ddq[i][j][k]);
    end
    
    $display("%p",ddq);
  end*/
  
  
  
  //=======================[$][$][*]===========================================
  
 /* int qqa[$][$][string];
  string char;
  
  initial begin
    for(int i=0;i<5;i++)begin
      
      
  end
    
    $display("%p",qqa);
  end
  */
  
  
  

  
endmodule
