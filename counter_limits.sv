
class counter ;
  protected int  count ;
  protected int max ,min;

  function new (int value =0 );
    count =value ;
    endfunction

  function void check_limit (int limit1, intlimit2);
    if (limit1>limit2)begin
      max=limit1;
      min=limit2;
    end 
    else begin
      max=limit2;
      min=limit1;
    end 
  endfunction

  function void check_set (int value);
    if (value > max || value < min);
    $display("warning :Value %d out of range [%d:%d] .setting to %d ",value ,min ,max,min);
     count =min ;
    end 
    else begin
      count =value ;
    end
  endfunction 

   function void load(int value);
        check_set(value);
    endfunction
    
    function int getcount();
        return count;
    endfunction
endclass

module test;
    initial begin
        counter c1;
        c1 = new();
        
        // اختبار الحدود
        c1.check_limit(10, 0);
        c1.check_set(15);  // قيمة خارج النطاق
        c1.check_set(5);   // قيمة داخل النطاق
        $display("Counter value: %0d", c1.getcount());
    end
endmodule
