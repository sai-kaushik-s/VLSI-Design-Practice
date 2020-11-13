`include "thirtyTwoBitAdder.v"

module top;
reg [31:0] a, b;
reg cin;
wire [31:0] sum;
wire ca;

thirtyTwoBitAdder FullAdd_0 (a, b, cin, sum, ca);

initial
begin
	$dumpfile("output.vcd");
	$dumpvars(0, top);
	#1 a = 32'b0000_0000_0000_0000_0000_0000_0000_0000;
	#1 b = 32'b0000_0000_0000_0000_0000_0000_0000_0000;
	#1 cin = 1'b0;
	#1 a = 32'b1111_1111_1111_1111_1111_1111_1111_1111;
	#1 b = 32'b1111_1111_1111_1111_1111_1111_1111_1111;
	#1 cin = 1'b1;
	#1 b = 32'b1010_1010_1010_1010_1010_1010_1010_1010;
end

initial
	$monitor ($time, "  a = %b; b = %b; cin = %b; sum = %b; ca = %b", a, b, cin, sum, ca);

endmodule

