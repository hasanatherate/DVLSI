module dff (q, qb, d, clk, rst);
output reg q;
output qb;
input d, clk, rst;

always @(posedge clk or negedge rst) begin
if (!rst)
q = 0; // Reset q to 0 asynchronously when rst is active (low)
else
q = d; // Update q to d on the rising edge of clk
end

assign qb = ~q; // Complement of q
endmodule
