`timescale 1ns / 1ps
`include "arrayMultiplier2Bit.v"
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    10:46:05 10/14/2020 
// Design Name: 
// Module Name:    arrayMultiplier4Bit 
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
module arrayMultiplier4Bit(
    input [3:0] A,
    input [3:0] B,
    output wire [7:0] C
);

wire [3:0] temp0, temp1, temp2, temp3, temp4, temp11;
wire [5:0] temp5, temp6, temp12, temp13, temp14;

arrayMultiplier2Bit AM2B1(A[1:0], B[1:0], temp0);
arrayMultiplier2Bit AM2B2(A[3:2], B[1:0], temp1);
arrayMultiplier2Bit AM2B3(A[1:0], B[3:2], temp2);
arrayMultiplier2Bit AM2B4(A[3:2], B[3:2], temp3);

assign temp11 = {2'b0, temp0[3:2]};
assign temp4 = temp1 + temp11;

assign temp12 = {2'b0, temp2};
assign temp13 = {temp3, 2'b0};
assign temp5 = temp12 + temp13;

assign temp14 = {2'b0, temp4};
assign temp6 = temp14 + temp5;

assign C[1:0] = temp0[1:0];
assign C[7:2] = temp6[5:0];

endmodule
