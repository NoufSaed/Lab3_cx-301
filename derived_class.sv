class counter;
    protected int count;
    
    function new(int initial_value = 0);
        count = initial_value;
    endfunction
    
    function void load(int value);
        count = value;
    endfunction
    
    function int getcount();
        return count;
    endfunction
endclass
// ..Upcounter .. 
class upcounter extends counter ;
// pass the value to counter class 
  function new (int value =0);
    super.new(value);
  endfunction 
// to count
  function void next();
    count ++;
    $display("Upcounter :%d",count);
  endfunction

endclass 
//..downcounter ..
class downcounter extends counter ;

  function new (int value = 0);
    super.new (value) 
  endfunction

  function void  next();
    count--;
    $display("Downcounter :%d",count)  ;
    endfunction
endclass 

module test ;
initial begin
        upcounter up1;
        downcounter down1;
        
        up1 = new(5);
        down1 = new(10);
        repeat(3) up1.next();
        repeat(3) down1.next();
end 
endmodule
