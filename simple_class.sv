virtual class counter;
    protected int count;
    protected int max, min;

    function new(int value = 0, int max_val = 10, int min_val = 0);
        count = value;
        max = max_val;
        min = min_val;
    endfunction

    function void load(int value);
        if (value > max) count = max;
        else if (value < min) count = min;
        else count = value;
    endfunction

    function int getcount();
        return count;
    endfunction

    virtual function void next();
        $display("Counter: next() called from base class");
    endfunction
endclass
