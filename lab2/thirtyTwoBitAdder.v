`include "sixteenBitAdder.v"

module thirtyTwoBitAdder(a, b, cin, sum, ca);
input [31:0] a, b;
input cin;

output [31:0] sum;
output ca;

wire c1;

sixteenBitAdder EBA_0(a[15:0], b[15:0], cin, sum[15:0], c1);
sixteenBitAdder EBA_1(a[31:16], b[31:16], c1, sum[31:16], ca);

endmodule
