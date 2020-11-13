`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    22:50:25 10/13/2020 
// Design Name: 
// Module Name:    arrayMultiplier 
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
module arrayMultiplier(
    input [15:0] A,
    input [15:0] B,
    input [31:0] C
);

    wire [15:0]q0,q1,q2,q3,q4,temp1;
    wire [31:0]c;
    wire [23:0]q5,q6,temp2,temp3,temp4;

    array8 z1(a[7:0],b[7:0],q0[15:0]);
    array8 z2(a[15:8],b[7:0],q1[15:0]);
    array8 z3(a[7:0],b[15:8],q2[15:0]);
    array8 z4(a[15:8],b[15:8],q3[15:0]);
    assign temp1 ={8'b0,q0[15:8]};
    assign q4 = q1[15:0]+temp1;
    assign temp2 ={8'b0,q2[15:0]};
    assign temp3 ={q3[15:0],8'b0};
    assign q5 = temp2+temp3;
    assign temp4={8'b0,q4[15:0]};

    assign q6 = temp4 + q5;

    assign c[7:0]=q0[7:0];
    assign c[31:8]=q6[23:0];

endmodule
