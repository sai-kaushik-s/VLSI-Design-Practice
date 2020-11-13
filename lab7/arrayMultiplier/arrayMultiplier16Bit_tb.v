`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   14:48:24 10/14/2020
// Design Name:   arrayMultiplier16Bit
// Module Name:   /home/thegamingbot/Downloads/sem-5/VLSI/lab7/arrayMultiplier/arrayMultiplier16Bit_tb.v
// Project Name:  arrayMultiplier
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: arrayMultiplier16Bit
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module arrayMultiplier16Bit_tb;

	// Inputs
	reg [15:0] A;
	reg [15:0] B;

	// Outputs
	wire [31:0] C;

	// Instantiate the Unit Under Test (UUT)
	arrayMultiplier16Bit uut (
		.A(A), 
		.B(B), 
		.C(C)
	);

	initial begin
		// Initialize Inputs
		A = 16'b0000_0000_0000_0000;
		B = 16'b0000_0000_0000_0000;

		// Add stimulus here
		A = 16'b1111_1111_1111_1111;
		B = 16'b1111_1111_1111_1111;
		
		A = 16'b0011_0100_1100_1001;
		B = 16'b0100_0011_0010_0010;
		
		A = 16'b0100_1010_1100_0101;
		B = 16'b0010_0101_0110_0010;
		
		A = 16'b1000_1010_0100_0100;
		B = 16'b0010_0010_0101_0110;
		
		A = 16'b0010_0101_0010_0101;
		B = 16'b1100_0011_0010_0100;
		
		A = 16'b0101_1000_1100_0010;
		B = 16'b0010_0011_0010_1010;

	end
      
endmodule

