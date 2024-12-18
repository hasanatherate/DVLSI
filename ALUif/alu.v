module alu (a, b, sel, alu_out);
input [31:0] a, b;
input [2:0] sel;
output reg [63:0] alu_out;
always @ (*)
begin
if (sel == 3'b000)
alu_out = a + b;
else if (sel == 3'b001)
alu_out = a - b;
else if (sel == 3'b010)
alu_out = a * b;
else if (sel == 3'b011)
alu_out = a / b;
else if (sel == 3'b100)
alu_out = a & b;
else if (sel == 3'b101)
alu_out = a | b;
else if (sel == 3'b110)
alu_out = a ^ b;
else
alu_out = ~(a & b);
end
endmodule
