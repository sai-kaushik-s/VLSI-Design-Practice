`include "eightBitAdder.v"

module sixteenBitAdder(a, b, cin, sum, ca);
input [15:0] a, b;
input cin;

output [15:0] sum;
output ca;

wire c1;

eightBitAdder EBA_0(a[7:0], b[7:0], cin, sum[7:0], c1);
eightBitAdder EBA_1(a[15:8], b[15:8], c1, sum[15:8], ca);

endmodule
