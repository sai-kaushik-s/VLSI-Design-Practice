module parityGen_8bit();

input in0, in1, in2, in3, in4, in5, in6, in7;

wire out0, out1, out2, out3, out4, out5;

output evenParity, oddParity;

xor xor0 (out0, in0, in1);

xor xor1 (out1, in2, in3);

xor xor2 (out2, in4, in5);

xor xor3 (out3, in6, in7);

xor xor4 (out4, out0, out1);

xor xor5 (out5, out2, out3);

xor xor6 (evenParity, out4, out5);

not not0 (oddParity, evenParity);

endmodule
