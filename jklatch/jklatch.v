module jklatch(q, qb, j, k, en, rst);
output reg q;
output qb;
input j, k, en, rst;
always @(j, k, en, rst)
begin
if (rst)
q = 0;
else if (en)
begin
if (j == 0 && k == 0)
q = q;
else if (j == 0 && k == 1)
q = 0;
else if (j == 1 && k == 0)
q = 1;
else
q = 1'bx;
end
end
assign qb = ~q;
endmodule
