// D-Flip Flop
module dFlipFlop(q, d, clk, reset);

	output reg q;
	input d, clk, reset;

	always@(negedge clk)
	if(reset == 1'b1)
		q <= 1'b0;
	else
		q <= d;

endmodule