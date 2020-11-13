`include "sixteenBitAdder.v"

module top;
reg [15:0] a, b;
reg cin;
wire [15:0] sum;
wire ca;

sixteenBitAdder FullAdd_0 (a, b, cin, sum, ca);

initial
begin
	a = 16'b0000_0000_0000_0000;
	#5 b = 16'b0000_0000_0000_0000;
	#5 cin = 1'b0;
	#5 a=16'b1111_1111_1111_1111;
	#5 b=16'b1111_1111_1111_1111;
	#5 cin=1'b1;
	#5 a=16'b1010_1010_1010_1010;
end

initial
	$monitor ($time, "  a = %b; b = %b; cin = %b; sum = %b; ca = %b", a, b, cin, sum, ca);

endmodule

