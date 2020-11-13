`include "universalShiftRegister.v"

// 4-bit Universal Shift Register Test Bench 
module top4;

    reg [3:0] I;
    reg clk, SILS, SIRS, reset;
    wire [3:0] O;
    reg [1:0] s;

    fourBitShiftRegister FBSR(O, I, s, clk, reset, SIRS, SILS);

    initial
    begin
        clk = 1'b1;
        reset = 1'b0;
        SIRS = 1'b1;
        SILS = 1'b0;
        s = 2'b00;

        #10;
        reset = 1'b1;

        #10;
        I = 4'b1011;
        reset = 1'b0;

        #10;
        $display("\t\tParallel Load");
        s <= 2'b11;

        #10;
        $display("\t\tShift Right");
        s <= 2'b10;

        #10;
        s <= 2'b11;

        #10;
        $display("\t\tShift Left");
        s <= 2'b01;

        #10;
        s <= 2'b11;

        #10;
        $display("\t\tNo Change");
        s <= 2'b00;

        #10;
        s <= 2'b11;
    end

    always #5 clk <= ~clk;

    initial
        #150 $finish;

    initial
        $monitor ($time, "   s = %b; I = %b; O = %b SIRS = %b; SILS = %b", s, I, O, SIRS, SILS);
    
endmodule