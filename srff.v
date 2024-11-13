//SR Flip-Flop Module with Synchronous Reset

module sr_ff (q, qb, s, r, clk, rst);
    output reg q;
    output qb;
    input s, r, clk, rst;
    
    always @(posedge clk) begin
        if (rst)
            q = 0;
        else if (s == 0 && r == 0)
            q = q; // Hold state
        else if (s == 0 && r == 1)
            q = 0;
        else if (s == 1 && r == 0)
            q = 1;
        else if (s == 1 && r == 1)
            q = 1'bx; // Invalid state
    end
    
    assign qb = ~q;
endmodule

//Testbench for Synchronous Reset SR Flip-Flop

module sr_ff_test;
    reg s, r, clk, rst;
    wire q, qb;
    
    sr_ff uut (q, qb, s, r, clk, rst);
    
    initial begin
        $monitor("Time = %0d ns | s = %b | r = %b | rst = %b | q = %b | qb = %b", $time, s, r, rst, q, qb);
        #80 $finish;
    end
    
    initial begin
        clk = 1'b0;
        forever #5 clk = ~clk;
    end
    
    initial begin
        rst = 1; s = 1; r = 0;
        #10 rst = 0;
        #10 s = 0; r = 0;
        #10 s = 0; r = 1;
        #10 s = 1; r = 0;
        #10 s = 1; r = 1;
        #10 s = 1; r = 0;
        #10 rst = 1;
    end
endmodule
//SR Flip-Flop Module with Asynchronous Reset

module sr_ff_async (q, qb, s, r, clk, rst);
    output reg q;
    output qb;
    input s, r, clk, rst;
    
    always @(posedge clk or negedge rst) begin
        if (!rst)
            q = 0;
        else if (s == 0 && r == 0)
            q = q; // Hold state
        else if (s == 0 && r == 1)
            q = 0;
        else if (s == 1 && r == 0)
            q = 1;
        else if (s == 1 && r == 1)
            q = 1'bx; // Invalid state
    end
    
    assign qb = ~q;
endmodule

//Testbench for Asynchronous Reset SR Flip-Flop

module sr_ff_async_test;
    reg s, r, clk, rst;
    wire q, qb;
    
    sr_ff_async uut (q, qb, s, r, clk, rst);
    
    initial begin
        $monitor("Time = %0d ns | s = %b | r = %b | rst = %b | q = %b | qb = %b", $time, s, r, rst, q, qb);
        #80 $finish;
    end
    
    initial begin
        clk = 1'b0;
        forever #5 clk = ~clk;
    end
    
    initial begin
        rst = 0; s = 1; r = 0;
        #10 rst = 1;
        #10 s = 0; r = 0;
        #10 s = 0; r = 1;
        #10 s = 1; r = 0;
        #10 s = 1; r = 1;
        #10 s = 1; r = 0;
        #10 rst = 0;
    end
endmodule
