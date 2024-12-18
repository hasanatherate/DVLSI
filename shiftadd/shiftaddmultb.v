module shiftaddmultb;
reg [3:0] multiplicand;
reg [3:0] multiplier;
wire [7:0] product;

shiftaddmul uut (
.multiplicand(multiplicand),
.multiplier(multiplier),
.product(product)
);

initial begin
$monitor("Multiplicand: %b, Multiplier: %b, Product: %b", multiplicand, multiplier, product);

multiplicand = 4'b0011; multiplier = 4'b0010; #10;
multiplicand = 4'b0101; multiplier = 4'b0011; #10;
multiplicand = 4'b0111; multiplier = 4'b0101; #10;
multiplicand = 4'b1000; multiplier = 4'b0011; #10;
multiplicand = 4'b0101; multiplier = 4'b0001; #10;

$finish;
end
endmodule
