`timescale 1ns / 1ps
`include "arrayMultiplier4Bit.v"
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    10:45:13 10/14/2020 
// Design Name: 
// Module Name:    arrayMultiplier8Bit 
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
module arrayMultiplier8Bit(
    input [7:0] A,
    input [7:0] B,
    output wire [15:0] C
);

wire [7:0] temp0, temp1, temp2, temp3, temp4, temp11;
wire [11:0] temp5, temp6, temp12, temp13, temp14;

arrayMultiplier4Bit AM4B1(A[3:0], B[3:0], temp0);
arrayMultiplier4Bit AM4B2(A[7:4], B[3:0], temp1);
arrayMultiplier4Bit AM4B3(A[3:0], B[7:4], temp2);
arrayMultiplier4Bit AM4B4(A[7:4], B[7:4], temp3);

assign temp11 = {4'b0, temp0[7:4]};
assign temp4 = temp1 + temp11;

assign temp12 = {4'b0, temp2};
assign temp13 = {temp3, 4'b0};
assign temp5 = temp12 + temp13;

assign temp14 = {4'b0, temp4};
assign temp6 = temp14 + temp5;

assign C[3:0] = temp0[3:0];
assign C[15:4] = temp6[11:0];

endmodule
