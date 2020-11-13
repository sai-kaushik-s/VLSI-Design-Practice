`timescale 1ns / 1ps
`include "arrayMultiplier8Bit.v"
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    10:44:18 10/14/2020 
// Design Name: 
// Module Name:    arrayMultiplier16Bit 
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
module arrayMultiplier16Bit(
    input [15:0] A,
    input [15:0] B,
    output wire [31:0] C
);

wire [15:0] temp0, temp1, temp2, temp3, temp4, temp11;
wire [23:0] temp5, temp6, temp12, temp13, temp14;

arrayMultiplier8Bit AM8B1(A[7:0], B[7:0], temp0);
arrayMultiplier8Bit AM8B2(A[15:8], B[7:0], temp1);
arrayMultiplier8Bit AM8B3(A[7:0], B[15:8], temp2);
arrayMultiplier8Bit AM8B4(A[15:8], B[15:8], temp3);

assign temp11 = {8'b0, temp0[15:8]};
assign temp4 = temp1 + temp11;

assign temp12 = {8'b0, temp2};
assign temp13 = {temp3, 8'b0};
assign temp5 = temp12 + temp13;

assign temp14 = {8'b0, temp4};
assign temp6 = temp14 + temp5;

assign C[7:0] = temp0[7:0];
assign C[31:8] = temp6[23:0];

endmodule
