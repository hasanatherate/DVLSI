module srff_test;
reg s, r, clk, rst;
wire q, qb;
srff sl(q, qb, s, r, clk, rst);
initial
begin
$monitor("time = %0d ns, s = %b, r = %b, rst = %b, clk = %b, q = %b, qb = %b", $time, s, r, rst, clk, q, qb);
#80 $finish;
end
initial clk = 1'b0;
always #5 clk = ~clk;
initial
begin
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
