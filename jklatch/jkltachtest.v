module jklatch_test;
reg j, k, en, rst;
wire q, qb;
jklatch jl(q, qb, j, k, en, rst);
initial
begin
$monitor("time = %0d, j = %b, k = %b, en = %b, rst = %b, q = %b, qb = %b", $time, j, k, en, rst, q, qb);
#70 $finish;
end
initial
begin
rst = 1;
en = 0;
j = 1;
k = 0;
#10 rst = 0;
#10 en = 1;
#10 j = 0;
k = 0;
#10 j = 0;
k = 1;
#10 j = 1;
k = 0;
#10 j = 1;
k = 1;
end
endmodule
