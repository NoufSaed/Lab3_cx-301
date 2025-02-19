class counter;
    protected int count;
    protected int max, min;
    
    function new(int initial_value = 0);
        count = initial_value;
    endfunction
    
    function void check_limit(int limit1, int limit2);
        if (limit1 > limit2) begin
            max = limit1;
            min = limit2;
        end else begin
            max = limit2;
            min = limit1;
        end
    endfunction
    
    function void check_set(int value);
        if (value > max || value < min) begin
            count = min;
        end else begin
            count = value;
        end
    endfunction
    
    function void load(int value);
        check_set(value);
    endfunction
    
    function int getcount();
        return count;
    endfunction
endclass

class upcounter extends counter;
    bit carry; 
    
    function new(int initial_value = 0, int upper_limit = 100, int lower_limit = 0);
        super.new(initial_value);
        check_limit(upper_limit, lower_limit);
        check_set(initial_value);
        carry = 0;
    endfunction
    
    function void next();
        if (count >= max) begin
            count = min;
            carry = 1;
        end else begin
            count++;
            carry = 0;
        end
        $display("upcounter: %0d, carry: %0b", count, carry);
    endfunction
endclass

class downcounter extends counter;
    bit borrow;
    
    function new(int initial_value = 0, int upper_limit = 100, int lower_limit = 0);
        super.new(initial_value);
        check_limit(upper_limit, lower_limit);
        check_set(initial_value);
        borrow = 0;
    endfunction
    
    function void next();
        if (count <= min) begin
            count = max;
            borrow = 1;
        end else begin
            count--;
            borrow = 0;
        end
        $display("downcounter: %0d, borrow: %0b", count, borrow);
    endfunction
endclass

module test;
    initial begin
        upcounter up1;
        downcounter down1;
        
        up1 = new(8, 10, 0);
        down1 = new(2, 10, 0);
        
        repeat(4) up1.next();
        
        repeat(4) down1.next();
    end
