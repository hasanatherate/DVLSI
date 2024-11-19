//4-bit up/down asynchronous reset counter

Verilog code for 4-bit up/down asynchronous reset counter:

module cnt_updown (count, mode, clk, reset); output reg [3:0] count;
input mode; input clk, reset;

always @ (posedge clk, posedge reset)


if (reset) count = 4'b0; else
if (mode)
count = count + 1; else
count = count - 1; endmodule
//Testbench for 4-bit up/down asynchronous reset counter:

module tb_cnt_updown; reg mode;
reg clk, reset; wire [3:0] count;

cnt_updown M1(count, mode, clk, reset);


initial begin
$monitor ("time = %0d", $time, "ns", "reset = 0x%0h", reset, " mode = 0x%0h", mode, " count
= 0x%0h", count); #320 $finish;
end


always
#5 clk = ~clk;


initial begin
mode = 1; clk=0; reset=1; #10; reset = 0;
#100; mode = 0;
#50; reset = 1;
#30; reset = 0;
#100; mode = 1;
#10; reset = 1; end

endmodule
Creating an SDC File:

	In terminal type “gedit counter_top.sdc” to create an SDC file.

create_clock -name clk -period 2 -waveform {0 1} [get_ports "clk"]


set_input_delay -max 0.8 -clock clk [all_inputs] set_output_delay -max 0.8 -clock clk [all_outputs]

set_input_transition 0.2 [all_inputs]
set_max_capacitance 30 [get_ports]


set_clock_transition -rise 0.1 [get_clocks “clk”] set_clock_transition -fall 0.1 [get_clocks “clk”]

set_clock_uncertainty 0.01 [get_ports “clk”]


set_input_transition 0.12 [all_inputs]
set_load 0.15 [all_outputs]
set_max_fanout 30.00 [current_design]

