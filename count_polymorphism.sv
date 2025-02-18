module count_polymorphism;
    initial begin
        counter c;
        upcounter u = new(9, 10, 0);
        downcounter d = new(1, 10, 0);
        upcounter u_new;

        $display("=== Testing Polymorphism ===");
        c = u;
        c.next();

        $display("=== Testing Type Casting ===");
        $cast(u_new, c);
        u_new.next();
    end
endmodule
