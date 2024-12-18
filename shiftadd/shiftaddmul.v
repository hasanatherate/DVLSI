module shiftaddmul (
input [3:0] multiplicand,
input [3:0] multiplier,
output reg [7:0] product
);
reg [3:0] temp_multiplicand;
reg [7:0] temp_product;
integer i;

always @(*) begin
temp_multiplicand = multiplicand;
temp_product = 8'b0;

for(i = 0; i < 4; i = i + 1) begin
if (multiplier[i]) begin
temp_product = temp_product + (temp_multiplicand << i);
end
end

product = temp_product;
end
endmodule
