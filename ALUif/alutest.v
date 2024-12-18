module alu_test;
reg [31:0] a, b;
reg [2:0] sel;
wire [63:0] alu_out;
alu al (a, b, sel, alu_out);
initial
begin
a = 32'hFEDCBA98;
b = 32'h89ABCDEF;
sel = 3'b000;
$monitor("a = 0x%0h, b = 0x%0h, sel = 0x%0h, alu_out = 0x%0h", a, b, sel, alu_out);
#80 $finish;
end
always #10 sel = sel + 3'b001;
endmodule
