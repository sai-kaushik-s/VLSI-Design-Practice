`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    15:07:34 10/29/2020 
// Design Name: 
// Module Name:    imageadd 
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
module imageadd(
	input clk,
	input rst, 
	output [7:0] out
);

wire [7:0] out1, out2;
reg [5:0] addr;

blk_mem b1(clk, 1'b0, addr, 8'b0000_0000, out1); 
blk_mem b2(clk, 1'b0, addr, 8'b0000_0000, out2);

blk_mem b3(clk, 1'b1, addr, out1 + out2, out);
  
always@(posedge clk)
begin
	if(rst == 0)
		addr = 6'b0;
	else
		addr = addr + 1;
end

endmodule
