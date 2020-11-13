`include "fourOneMux.v"
`include "dFlipFlop.v"

// 1-bit Universal Shift Register
module oneBitShiftRegister (O, I, s, clk, reset, SIRS, SILS);

    output O;
    input I, clk, SIRS, SILS, reset;
    input [1:0] s;
    wire w;

    fourOneMux MUX(w, s[1], s[0], I, SILS, SIRS, O);

    dFlipFlop DFF(O, w, clk, reset);
    
endmodule

// 2-bit Universal Shift Register
module twoBitShiftRegister (O, I, s, clk, reset, SIRS, SILS);

    output [1:0] O;
    input [1:0] I;
    input clk, SIRS, SILS, reset;
    input [1:0] s;

    oneBitShiftRegister OBSR_1(O[0], I[0], s, clk, reset, O[1], SILS);
    oneBitShiftRegister OBSR_2(O[1], I[1], s, clk, reset, SIRS, O[0]);
    
endmodule

// 4-bit Universal Shift Register
module fourBitShiftRegister (O, I, s, clk, reset, SIRS, SILS);

    output [3:0] O;
    input [3:0] I;
    input clk, SIRS, SILS, reset;
    input [1:0] s;

    twoBitShiftRegister TBSR_1(O[1:0], I[1:0], s, clk, reset, O[2], SILS);
    twoBitShiftRegister TBSR_2(O[3:2], I[3:2], s, clk, reset, SIRS, O[1 ]);
    
endmodule

// 8-bit Universal Shift Register
module eightBitShiftRegister (O, I, s, clk, reset, SIRS, SILS);

    output [7:0] O;
    input [7:0] I;
    input clk, SIRS, SILS, reset;
    input [1:0] s;

    fourBitShiftRegister FBSR_1(O[3:0], I[3:0], s, clk, reset, O[4], SILS);
    fourBitShiftRegister FBSR_2(O[7:4], I[7:4], s, clk, reset, SIRS, O[3]);
    
endmodule