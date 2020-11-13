`include "universalShiftRegister.v"

// 1-bit Universal Shift Register Test Bench
module top1;

    reg I, clk, SILS, SIRS, reset;
    wire O;
    reg [1:0] s;

    oneBitShiftRegister OBSR(O, I, s, clk, reset, SIRS, SILS);

    initial
    begin
        clk = 1'b1;
        reset = 1'b0;
        SIRS = 1'b1;
        SILS = 1'b0;
        s = 2'b00;
    end

    always #5 clk=~clk;

    initial
        #100 $finish;

    initial
        $monitor ($time, "  s = %b; I = %b; O = %b SIRS = %b; SILS = %b", s, I, O, SIRS, SILS);
    
endmodule