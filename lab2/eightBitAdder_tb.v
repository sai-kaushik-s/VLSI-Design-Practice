`include "eightBitAdder.v"

module top;
reg [7:0] a, b;
reg cin;
wire [7:0] sum;
wire ca;

eightBitAdder FullAdd_0 (a, b, cin, sum, ca);

initial
begin
	a = 8'b0000_0000;
	#5 b = 8'b0000_0000;
	#5 cin = 1'b0;
	#5 a=8'b1111_1111;
	#5 b=8'b1111_1111;
	#5 cin=1'b1;
	#5 a=8'b1010_1010;
end

initial
	$monitor ($time, "  a = %b; b = %b; cin = %b; sum = %b; ca = %b", a, b, cin, sum, ca);

endmodule

