`include "multiplier.v"
`include "carrySaveAdder.v"
`include "recursiveDoubling.v"

module wallaceTreeMultiplier (A, B, C);
    
    input [31:0] A, B;
    output [63:0] C;

    wire [63:0] AB [31:0], temp1 [31:0];
    wire [31:0] temp [31:0];
    wire [63:0] s [30:0];
    wire [63:0] c [30:0];
    wire K;
    genvar i;
    
    generate
        for(i = 0; i < 32; i = i + 1)
        begin : and_loop
            multiplier mul(A, B[i], temp[i]);
            assign temp1[i] = {{32{1'b0}}, temp[i]};
            assign AB[i] = temp1[i] << i;
        end
    endgenerate

    carrySaveAdder ca01(AB[0], AB[1], AB[2], s[0], c[0]);
    carrySaveAdder ca02(AB[3], AB[4], AB[5], s[1], c[1]);
    carrySaveAdder ca03(AB[6], AB[7], AB[8], s[2], c[2]);
    carrySaveAdder ca04(AB[9], AB[10], AB[11], s[3], c[3]);
    carrySaveAdder ca05(AB[12], AB[13], AB[14], s[4], c[4]);
    carrySaveAdder ca06(AB[15], AB[16], AB[17], s[5], c[5]);
    carrySaveAdder ca07(AB[18], AB[19], AB[20], s[6], c[6]);
    carrySaveAdder ca08(AB[21], AB[22], AB[23], s[7], c[7]);
    carrySaveAdder ca09(AB[24], AB[25], AB[26], s[8], c[8]);
    carrySaveAdder ca10(AB[27], AB[28], AB[29], s[9], c[9]);
    carrySaveAdder ca11(s[0], c[0], s[1], s[10], c[10]);
    carrySaveAdder ca12(c[1], s[2], c[2], s[11], c[11]);
    carrySaveAdder ca13(c[3], s[3], s[4], s[12], c[12]);
    carrySaveAdder ca14(c[4], s[5], c[5], s[13], c[13]);
    carrySaveAdder ca15(s[6], c[6], s[7], s[14], c[14]);
    carrySaveAdder ca16(c[7], c[8], s[8], s[15], c[15]);
    carrySaveAdder ca17(s[9], c[9], AB[30], s[16], c[16]);
    carrySaveAdder ca18(s[10], c[10], s[11], s[17], c[17]);
    carrySaveAdder ca19(c[11], s[12], c[12], s[18], c[18]);
    carrySaveAdder ca20(c[13], s[13], s[14], s[19], c[19]);
    carrySaveAdder ca21(c[14], c[15], s[15], s[20], c[20]);
    carrySaveAdder ca22(s[16], c[16], AB[31], s[21], c[21]);
    carrySaveAdder ca23(s[17], c[17], s[18], s[22], c[22]);
    carrySaveAdder ca24(c[18], s[19], c[19], s[23], c[23]);
    carrySaveAdder ca25(c[20], s[20], s[21], s[24], c[24]);
    carrySaveAdder ca26(s[22], c[22], s[23], s[25], c[25]);
    carrySaveAdder ca27(c[23], s[24], c[24], s[26], c[26]);
    carrySaveAdder ca28(c[25], s[25], s[26], s[27], c[27]);
    carrySaveAdder ca29(c[26], c[21], {64{1'b0}}, s[28], c[28]);
    carrySaveAdder ca30(s[27], c[27], s[28], s[29], c[29]);
    carrySaveAdder ca31(c[28], s[29], c[29], s[30], c[30]);

    RecursiveDoubling RD64(s[30], c[30], C, K);

endmodule