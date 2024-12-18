module alu (a, b, sel, alu_out);
input [31:0] a, b;
input [2:0] sel;
output reg [63:0] alu_out;
always @ (*)
begin
case (sel)
3'b000: alu_out = a + b;
3'b001: alu_out = a - b;
3'b010: alu_out = a * b;
3'b011: alu_out = a / b;
3'b100: alu_out = a & b;
3'b101: alu_out = a | b;
3'b110: alu_out = a ^ b;
3'b111: alu_out = ~(a & b);
default: alu_out = 64'b0;
endcase
end
endmodule
