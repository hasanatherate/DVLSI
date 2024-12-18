module d_ff (q, qb, d, clk, rst);
output reg q;
output qb;
input d, clk, rst;

always @(posedge clk) begin
if (rst)
q = 0; 
else
q = d; 
end

assign qb = ~q; 
endmodule
