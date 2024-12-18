module jk_ff_test;
reg j, k, clk, rst;
wire q, qb;
jk_ff jl(q, qb, j, k, clk, rst);
initial
begin
$monitor("time = %0d, j = %b, k = %b, rst = %b, q = %b, qb = %b", $time, j, k, rst, q, qb);
#80 $finish;
end
initial
clk = 1'b0;
always #5 clk = ~clk;
initial
begin
rst = 1;
j = 1;
k = 0;
#10 rst = 0;
#10 j = 0;
k = 0;
#10 j = 0;
k = 1;
#10 j = 1;
k = 0;
#10 j = 1;
k = 1;
#10 j = 1;
k = 0;
#10 rst = 1;
end
endmodule
