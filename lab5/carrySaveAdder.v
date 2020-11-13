module fullAdder (a, b, cin, sum, ca);

    input a, b, cin;
    output sum, ca;

    wire w1, w2, w3, w4, w5;

    xor xor_0 (w1, a, b);
    xor xor_1 (sum, w1, cin);

    and and_0 (w2, a, b);
    and and_1 (w3, a, cin);
    and and_2 (w4, b, cin);
    or  or_0 (w5, w2, w3);
    or  or_1 (ca, w4, w5);

endmodule

module carrySaveAdder (X, Y, Z, S, C);
    input [63:0] X, Y, Z;
    output [63:0] S, C;

    assign C[0] = 1'b0;

    genvar i;

    generate
        for(i = 0; i < 63; i = i + 1)
        begin: full_adder
            fullAdder fa(X[i], Y[i], Z[i], S[i], C[i + 1]);
        end
    endgenerate

    assign S[63] = 1'b0;

endmodule