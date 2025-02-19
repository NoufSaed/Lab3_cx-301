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

class upcounter extends counter;
    function new(int initial_value = 0);
        super.new(initial_value);
    endfunction
    
    function void next();
        count++;
        $display("upcounter value: %0d", count);
    endfunction
endclass

class downcounter extends counter;
    function new(int initial_value = 0);
        super.new(initial_value);
    endfunction
    
    function void next();
        count--;
        $display("downcounter value: %0d", count);
    endfunction
endclass

module test;
    initial begin
        upcounter up1;
        downcounter down1;
        
        up1 = new(5);
        down1 = new(10);
        
        repeat(3) up1.next();
        
        repeat(3) down1.next();
    end
endmodule
