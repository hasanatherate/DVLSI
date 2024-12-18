module d_ff_test;
reg clk, rst, d;
wire q, qb;

d_ff dff1(q, qb, d, clk, rst);

initial begin
$monitor("time = %0d ns, rst = %b, d = %b, q = %b, qb = %b", $time, rst, d, q, qb);
#40 $finish; 
end

initial clk = 0; 
always #5 clk = ~clk; 

initial begin
rst = 1; d = 0; 
#10 rst = 0; 
#10 d = 1;  
#10 rst = 1; 
end
endmodule
