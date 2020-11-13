module parallelPrefixCircuit(a, b, c);

    input [1:0] a,b;
	output reg [1:0] c;

	always@(a, b)
	begin
		if(a == 2'b00 || a == 2'b11)
			assign c = a;
		else
			assign c = b;
	end
	
endmodule
