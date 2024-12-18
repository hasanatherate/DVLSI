module dlatch_test;
reg d, en, rst;
wire q, qb;

dlatch dl (q, qb, d, en, rst);

initial begin
$monitor("time = %0d ns, d = %b, en = %b, rst = %b, q = %b, qb = %b", $time, d, en, rst, q, qb);
$finish;
end

initial begin
en = 0; d = 0;
end

always begin
#10 d = ~d; 
#20 en = ~en; 
end

initial begin
rst = 1;
#10 rst = 0; 
#90 rst = 1; 
#30 rst = 0; 
end
endmodule
