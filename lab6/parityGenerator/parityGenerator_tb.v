`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   18:01:11 10/07/2020
// Design Name:   parityGenerator
// Module Name:   /home/thegamingbot/Downloads/sem-5/VLSI/lab6/parityGenerator/parityGenerator_tb.v
// Project Name:  parityGenerator
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: parityGenerator
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module parityGenerator_tb;

	// Inputs
	reg [7:0] A;

	// Outputs
	wire [8:0] Even;
	wire [8:0] Odd;

	// Instantiate the Unit Under Test (UUT)
	parityGenerator uut (
		.A(A), 
		.Even(Even), 
		.Odd(Odd)
	);

	initial begin
		// Initialize Inputs
		A = 8'b0000_0000;

		// Wait 100 ns for global reset to finish
		#10;
        
		// Add stimulus here

	end
      
endmodule

