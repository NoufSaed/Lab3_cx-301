class timer;
    upcounter hours, minutes, seconds;
    
    function new(int initial_hour = 0, int initial_minute = 0, int initial_second = 0);
        hours = new(initial_hour, 23, 0);    
        minutes = new(initial_minute, 59, 0);  
        seconds = new(initial_second, 59, 0);   
    endfunction
    
    function void load(int hour, int minute, int second);
        hours.load(hour);
        minutes.load(minute);
        seconds.load(second);
        showval();
    endfunction
    
    function void showval();
        $display("Time: %02d:%02d:%02d", 
                 hours.getcount(), 
                 minutes.getcount(), 
                 seconds.getcount());
    endfunction
    
    function void next();
        seconds.next();
        if (seconds.carry) begin
            minutes.next();
            if (minutes.carry) begin
                hours.next();
            end
        end
        showval();
    endfunction
endclass

module test;
    initial begin
        timer t1;
        
        $display("\nTesting midnight rollover:");
        t1 = new(23, 59, 58);
        repeat(4) begin
            t1.next();
            #10;
        end
        
        $display("\nTesting specific time:");
        t1.load(0, 0, 58);
        repeat(3) begin
            t1.next();
            #10;
        end
    end
endmodule
