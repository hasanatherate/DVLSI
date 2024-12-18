module tb_cnt_updown;
reg mode;
reg clk, reset;
wire [3:0] count;
cnt_updown M1(count, mode, clk, reset);
initial
begin
$monitor("time = %0d ns, reset = 0x%0h, mode = 0x%0h, count = 0x%0h", $time, reset, mode, count);
#320 $finish;
end
always #5 clk = ~clk;
initial
begin
mode = 1; clk = 0; reset = 1; #10;
reset = 0;
#100; mode = 0;
#50; reset = 1;
#30; reset = 0;
#100; mode = 1;
#10; reset = 1;
end
endmodule
