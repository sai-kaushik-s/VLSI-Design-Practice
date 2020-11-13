`include "RecursiveDoubling.v"

module top;

reg [31:0] A, B;
reg Ci;
wire [31:0] S;
wire Ca;

RecursiveDoubling rd(A, B, S, Ca);

initial
begin
	A = 32'b1111_0110_1011_1001_1110_1100_0010_1001;
	B = 32'b1111_0000_1111_1111_1111_0000_0000_1111;
	
	#10;
	A = 32'b0011_0100_1100_1111_0011_0110_1100_1101;
	B = 32'b1001_1100_1000_1111_0000_1100_0110_1011;
end


initial
begin
	$monitor($time, "\t A = %b, B = %b, Ca = %b, S = %b", A, B, Ca, S);
end

endmodule
