`include "universalShiftRegister.v"

// 8-bit Universal Shift Register Test Bench 
module top8;

    reg [7:0] I;
    reg clk, SILS, SIRS, reset;
    wire [7:0] O;
    reg [1:0] s;

    eightBitShiftRegister EBSR(O, I, s, clk, reset, SIRS, SILS);

    initial
    begin
        
        $dumpfile("output.vcd");
        $dumpvars(0, top8);

        clk = 1'b1;
        reset = 1'b0;
        SIRS = 1'b1;
        SILS = 1'b0;
        s = 2'b00;

        #10;
        reset = 1'b1;

        #10;
        I = 8'b1011_1101;
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