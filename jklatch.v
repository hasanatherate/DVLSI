//JK Latch Module

module jklatch (q, qb, j, k, en, rst);
    output reg q;
    output qb;
    input j, k, en, rst;

    always @(posedge en or posedge rst) begin
        if (rst)
            q = 0;
        else if (en) begin
            if (j == 0 && k == 0)
                q = q; // Hold state
            else if (j == 0 && k == 1)
                q = 0; // Reset
            else if (j == 1 && k == 0)
                q = 1; // Set
            else if (j == 1 && k == 1)
                q = ~q; // Toggle
        end
    end

    assign qb = ~q;
endmodule

//Testbench for JK Latch

module jklatch_test;
    reg j, k, en, rst;
    wire q, qb;

    jklatch jl (q, qb, j, k, en, rst);

    initial begin
        $monitor("Time = %0d ns | j = %b | k = %b | en = %b | rst = %b | q = %b | qb = %b", 
                 $time, j, k, en, rst, q, qb);
        #70 $finish;
    end

    initial begin
        en = 1'b0; rst = 1; j = 0; k = 0; #5;
        rst = 0; en = 1; j = 0; k = 0; #10;
        j = 0; k = 1; #10;
        j = 1; k = 0; #10;
        j = 1; k = 1; #10;
        j = 0; k = 0; #10;
        en = 0; #10;
        rst = 1; #10;
    end
endmodule
