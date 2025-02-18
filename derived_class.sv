class upcounter extends counter;
    bit carry;
    function new(int value = 0, int max_val = 10, int min_val = 0);
        super.new(value, max_val, min_val);
        carry = 0;
    endfunction

    function void next();
        if (count == max) begin
            count = min;
            carry = 1;
        end else begin
            count++;
            carry = 0;
        end
        $display("UpCounter: %0d (Carry: %b)", count, carry);
    endfunction
endclass

class downcounter extends counter;
    bit borrow;
    function new(int value = 0, int max_val = 10, int min_val = 0);
        super.new(value, max_val, min_val);
        borrow = 0;
    endfunction

    function void next();
        if (count == min) begin
            count = max;
            borrow = 1;
        end else begin
            count--;
            borrow = 0;
        end
        $display("DownCounter: %0d (Borrow: %b)", count, borrow);
    endfunction
endclass
