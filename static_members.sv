// File: static_members.sv
class counter;
    protected int count;
    protected int max, min;
    
    function new(int initial_value = 0);
        count = initial_value;
    endfunction
    
endclass

class upcounter extends counter;
    static int instance_count = 0;  
    bit carry;
    
    function new(int initial_value = 0, int upper_limit = 100, int lower_limit = 0);
        super.new(initial_value);
        instance_count++;  
    endfunction
    
    static function int get_instance_count();
        return instance_count;
    endfunction
    
    function void next();
        if (count >= max) begin
            count = min;
            carry = 1;
        end else begin
            count++;
            carry = 0;
        end
    endfunction
endclass

class downcounter extends counter;
    static int instance_count = 0;
    bit borrow;
    
    function new(int initial_value = 0, int upper_limit = 100, int lower_limit = 0);
        super.new(initial_value);
        instance_count++;
    endfunction
    
    static function int get_instance_count();
        return instance_count;
    endfunction
    
    function void next();
        if (count <= min) begin
            count = max;
            borrow = 1;
        end else begin
            count--;
            borrow = 0;
        end
    endfunction
endclass

module test;
    initial begin
        upcounter up1, up2;
        downcounter down1, down2, down3;
        
        up1 = new();
        up2 = new();
        down1 = new();
        down2 = new();
        down3 = new();
        
        $display("Number of upcounter instances: %0d", upcounter::get_instance_count());
        $display("Number of downcounter instances: %0d", downcounter::get_instance_count());
    end
endmodule
