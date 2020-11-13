`timescale 1ns / 1ps
`include "halfAdder.v"
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    10:46:52 10/14/2020 
// Design Name: 
// Module Name:    arrayMultiplier2Bit 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module arrayMultiplier2Bit(
    input [1:0] A,
    input [1:0] B,
    output wire [3:0] C
);

wire [3:0] temp;

assign C[0] = A[0] & B[0];
assign temp[0] = A[1] & B[0];
assign temp[1] = A[0] & B[1];
assign temp[2] = A[1] & B[1];

halfAdder HA1(temp[0], temp[1], C[1], temp[3]);
halfAdder HA2(temp[2], temp[3], C[2], C[3]);

endmodule
