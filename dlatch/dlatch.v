module dlatch (q, qb, d, en, rst);
output reg q; 
output qb; 
input d, en, rst;

always @(d, en, rst)
begin
if (rst)
q = 0; // Reset q to 0 when reset is active
else if (en)
q = d; // Update q to the value of d when enable is active
end

assign qb = ~q; // Complement of q
endmodule
