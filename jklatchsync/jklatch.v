module jk_ff(q, qb, j, k, clk, rst);
output reg q;
output qb;
input j, k, clk, rst;
always @(posedge clk)
begin
if (rst)
q = 0;
else if (j == 0 && k == 0)
q = q;
else if (j == 0 && k == 1)
q = 0;
else if (j == 1 && k == 0)
q = 1;
else
q = ~q;
end
assign qb = ~q;
endmodule
