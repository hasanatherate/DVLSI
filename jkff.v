//JK Flip-Flop Module with Synchronous Reset

module jk_ff (q, qb, j, k, clk, rst);
    output reg q;
    output qb;
    input j, k, clk, rst;
    
    always @(posedge clk) begin
        if (rst)
            q = 0;
        else if (j == 0 && k == 0)
            q = q; // Hold state
        else if (j == 0 && k == 1)
            q = 0; // Reset
        else if (j == 1 && k == 0)
            q = 1; // Set
        else if (j == 1 && k == 1)
            q = ~q; // Toggle
    end
    
    assign qb = ~q;
endmodule
//Testbench for JK Flip-Flop with Synchronous Reset

module jk_ff_test;
    reg j, k, clk, rst;
    wire q, qb;

    jk_ff uut (q, qb, j, k, clk, rst);

    initial begin
        $monitor("Time = %0d ns | j = %b | k = %b | rst = %b | q = %b | qb = %b", 
                 $time, j, k, rst, q, qb);
        #80 $finish;
    end

    initial begin
        clk = 1'b0;
        forever #5 clk = ~clk;
    end

    initial begin
        rst = 1; j = 1; k = 0;
        #10 rst = 0; j = 0; k = 0;
        #10 j = 0; k = 1;
        #10 j = 1; k = 0;
        #10 j = 1; k = 1;
        #10 j = 1; k = 0;
        #10 rst = 1;
    end
endmodule
// JK Flip-Flop Module with Asynchronous Reset

module jk_ff_async (q, qb, j, k, clk, rst);
    output reg q;
    output qb;
    input j, k, clk, rst;
    
    always @(posedge clk or negedge rst) begin
        if (!rst)
            q = 0;
        else if (j == 0 && k == 0)
            q = q; // Hold state
        else if (j == 0 && k == 1)
            q = 0; // Reset
        else if (j == 1 && k == 0)
            q = 1; // Set
        else if (j == 1 && k == 1)
            q = ~q; // Toggle
    end
    
    assign qb = ~q;
endmodule

//Testbench for JK Flip-Flop with Asynchronous Reset

module jk_ff_async_test;
    reg j, k, clk, rst;
    wire q, qb;

    jk_ff_async uut (q, qb, j, k, clk, rst);

    initial begin
        $monitor("Time = %0d ns | j = %b | k = %b | rst = %b | q = %b | qb = %b", 
                 $time, j, k, rst, q, qb);
        #80 $finish;
    end

    initial begin
        clk = 1'b0;
        forever #5 clk = ~clk;
    end

    initial begin
        rst = 0; j = 1; k = 0;
        #10 rst = 1; j = 0; k = 0;
        #10 j = 0; k = 1;
        #10 j = 1; k = 0;
        #10 j = 1; k = 1;
        #10 j = 1; k = 0;
        #10 rst = 0;
    end
endmodule
