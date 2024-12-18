module dff_test;
reg d, rst, clk;
wire q, qb;

dff dl (q, qb, d, clk, rst);

initial begin
$monitor("time = %0d ns, rst = %b, d = %b, clk = %b, q = %b, qb = %b", $time, rst, d, clk, q, qb);
#40 $finish; 
end

initial begin
d = 0;
clk = 0;
end

always #5 clk = ~clk; 

initial begin
rst = 0; 
#10 rst = 1; 
#10 d = 1;  
#10 rst = 0; 
end
endmodule
