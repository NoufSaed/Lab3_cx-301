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

module test;
    initial begin
        counter c1, c2;
      
        c1 = new();
        $display("Default counter value: %0d", c1.getcount());
        
        c2 = new(100);
        $display("Counter value with initial value 100: %0d", c2.getcount());
    end
endmodule

