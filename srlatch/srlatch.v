module srlatch (q, qb, s, r, en, rst);
output reg q;
output qb;
input s, r, en, rst;
always @(s, r, en, rst)
begin
if (rst)
q = 0;
else
if (en)
begin
if (s == 0 && r == 0)
q = q;
else if (s == 0 && r == 1)
q = 0;
else if (s == 1 && r == 0)
q = 1;
else if (s == 1 && r == 1)
q = 1'bx;
end
end
assign qb = ~q;
endmodule
