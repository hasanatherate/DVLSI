module cnt_updown (count, mode, clk, reset);
output reg [3:0] count;
input mode;
input clk, reset;
always @ (posedge clk, posedge reset)
if (reset)
count = 4'b0;
else
if (mode)
count = count + 1;
else
count = count - 1;
endmodule
