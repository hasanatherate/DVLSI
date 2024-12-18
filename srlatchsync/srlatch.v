module sr_ff (q, qb, s, r, clk, rst);
output reg q;
output qb;
input s, r, clk, rst;
always @(posedge clk)
begin
if (rst)
q = 0;
else
if (s == 0 && r == 0)
q = q;
else if (s == 0 && r == 1)
q = 0;
else if (s == 1 && r == 0)
q = 1;
else if (s == 1 && r == 1)
q = 1'bx;
end
assign qb = ~q;
endmodule
