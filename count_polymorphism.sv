
`timescale 1ns / 1ps
virtual class counter;
    int count;
    int max;
    int min;
    
    virtual function  void next();
       $display("in counter class");
       endfunction
    // Explicit constructor with an int argument
    function new(int initial_count = 0, int max_limit , int min_limit);
        count = initial_count; // Initialize count to the provided value
        check_limit(max_limit,min_limit);
        check_set(initial_count);
    endfunction
    
    function int check_limit(int new_max ,int new_min );
    
    if (new_max > new_min) begin

        max = new_max;  
        min = new_min; 
          
    end else begin 
            max = new_max; 
            min =new_max;  
            end
        endfunction

    function int  check_set (set_count );
          if(set_count > max || set_count < min ) begin
            count = min; // assign the count to min  
            $display("the count assigned to min (%d) des to ;imit" ,min);
          end else begin
          count = set_count;
          end

     endfunction
    function void load(int value);
        count = value; 
        check_set(value); 
    endfunction 

    function int getcount();
        return count; 
    endfunction
endclass

class upcounter extends  counter;

function new(int initial_count, int max_limit , int min_limit);
super.new(initial_count , max_limit ,min_limit);

endfunction
// increment count overriden
function void next ();

 count +=1;
 if (count > max) begin
    count = min ; // roll over to min 
 end 
 $display("upcounter count %d",count);
endfunction
endclass


class downcounter extends counter;


function new (int initial_count, int max_limit , int min_limit) ;
super.new(initial_count, max_limit ,min_limit);
endfunction 

count -=1;
if(count < min )
 count = max ; // roll over to max 
$display("Downcounter count %d",count );

endfunction
endclass

//Test module
module test_counter_up;
    counter c_handle;       
    upcounter up_handle;    
    downcounter down_handle; 

    initial begin
        up_handle = new(3, 5, 1);   
        down_handle = new(5, 1, 0); 

        c_handle = up_handle;

        $display("Calling next from upcounter handle:");
        up_handle.next();

        $display("Calling next from counter handle:");
        c_handle.next(); 
        if (!$cast(up_handle, c_handle)) begin
            $display("Casting failed!");
        end else begin
            $display("Casting succeeded!");
          
            $display("Calling next from casted upcounter handle:");
            up_handle.next();
        end
   
        $display("Calling next from counter handle:");
        c_handle.next();
    end 
endmodule
