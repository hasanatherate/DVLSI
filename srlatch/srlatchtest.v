module srlatch_test;
reg s, r, en, rst;
wire q, qb;
srlatch sl(q, qb, s, r, en, rst);
initial begin
$monitor("time = %0d ns, s = %b, r = %b, en = %b, rst = %b, q = %b, qb = %b", $time, s, r, en, rst, q, qb);
#70 $finish;
end
initial begin
rst = 1; en = 0; s = 1; r = 0;
#10 rst = 0;
#10 en = 1;
#10 s = 0; r = 0;
#10 s = 0; r = 1;
#10 s = 1; r = 0;
#10 s = 1; r = 1;
end
endmodule
