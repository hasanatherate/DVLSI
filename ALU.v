// 1. 32-bit ALU using Case Statement
module alu_case (a, b, sel, alu_out);
    input [31:0] a, b;
    input [2:0] sel;
    output reg [63:0] alu_out;
    
    always @(*) begin
        case (sel)
            3'b000: alu_out = a + b;
            3'b001: alu_out = a - b;
            3'b010: alu_out = a * b;
            3'b011: alu_out = a / b;
            3'b100: alu_out = a & b;
            3'b101: alu_out = a | b;
            3'b110: alu_out = a ^ b;
            3'b111: alu_out = ~a;
            default: alu_out = 0;
        endcase
    end
endmodule

//Testbench for ALU using Case Statement

module alu_case_test;
    reg [31:0] a, b;
    reg [2:0] sel;
    wire [63:0] alu_out;
    
    alu_case uut (a, b, sel, alu_out);

    initial begin
        a = 32'hFEDCBA98;
        b = 32'h89ABCDEF;
        sel = 3'b000;
        
        $monitor("Time = %0d ns | a = 0x%0h | b = 0x%0h | sel = 0x%0h | alu_out = 0x%0h", 
                 $time, a, b, sel, alu_out);
        #80 $finish;
    end

    always #10 sel = sel + 3'b001;
endmodule
//2. 32-bit ALU using If Statement
module alu_if (a, b, sel, alu_out);
    input [31:0] a, b;
    input [2:0] sel;
    output reg [63:0] alu_out;
    
    always @(*) begin
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
            alu_out = ~a;
    end
endmodule
//Testbench for ALU using If Statement
module alu_if_test;
    reg [31:0] a, b;
    reg [2:0] sel;
    wire [63:0] alu_out;
    
    alu_if uut (a, b, sel, alu_out);

    initial begin
        a = 32'hFEDCBA98;
        b = 32'h89ABCDEF;
        sel = 3'b000;
        
        $monitor("Time = %0d ns | a = 0x%0h | b = 0x%0h | sel = 0x%0h | alu_out = 0x%0h", 
                 $time, a, b, sel, alu_out);
        #80 $finish;
    end

    always #10 sel = sel + 3'b001;
endmodule
