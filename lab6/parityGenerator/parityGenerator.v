`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    16:58:38 10/07/2020 
// Design Name: 
// Module Name:    parityGenerator 
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
module parityGenerator(
    input [7:0] A,
    output [8:0] Even,
    output [8:0] Odd
    );

wire p, q;

assign p = ^A;
assign q = ~(^A);

assign Even = {p, A};

assign Odd = {q, A};

endmodule
