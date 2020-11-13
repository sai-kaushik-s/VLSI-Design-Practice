`include "parallelPrefixCircuit.v"

module RecursiveDoubling(A, B, S, Ca);

	input [31:0] A, B;
	output [31:0] S;
	output Ca;
	
	wire [63:0] kgp;
	wire [63:0] temp1;
	wire [63:0] temp2;
	wire [63:0] temp3;
	wire [63:0] temp4;
	wire [63:0] temp5;
	
	wire[31:0] cin;
	
	genvar i;
	
	//kgp -- 00 -> kill
	//kgp -- 01 -> generate
	//kgp -- 11 -> propogate
	
	for(i = 0; i < 32; i = i + 1)
	begin
		assign kgp[2 * i] = A[i];
		assign kgp[2 * i + 1] = B[i];
	end
	
	//kgp reduction
	// 31 30 29 28 27 26 25 24 23 22 21 20 19 18 17 16 15 14 13 12 11 10 9 8 7 6 5 4 3 2 1 0
	// 1 - 31.30  30.29  29.28  28.27  27.26  26.25  25.24  24.23  23.22  22.21  21.20  20.19  19.18  18.17  17.16  16.15  15.14  14.13  13.12  12.11  11.10  10.9  9.8  8.7  7.6  6.5  5.4  4.3  3.2  2.1  1.0  0
	parallelPrefixCircuit PPC0(kgp[1:0], 2'b00, temp1[1:0]);
   	parallelPrefixCircuit PPC1(kgp[3:2], temp1[1:0], temp1[3:2]);
	parallelPrefixCircuit PPC2(kgp[5:4], temp1[3:2], temp1[5:4]);
	parallelPrefixCircuit PPC3(kgp[7:6], temp1[5:4], temp1[7:6]);
	parallelPrefixCircuit PPC4(kgp[9:8], temp1[7:6], temp1[9:8]);
	parallelPrefixCircuit PPC5(kgp[11:10], temp1[9:8], temp1[11:10]);
	parallelPrefixCircuit PPC6(kgp[13:12], temp1[11:10], temp1[13:12]);
	parallelPrefixCircuit PPC7(kgp[15:14], temp1[13:12], temp1[15:14]);
	parallelPrefixCircuit PPC8(kgp[17:16], temp1[15:14], temp1[17:16]);
	parallelPrefixCircuit PPC9(kgp[19:18], temp1[17:16], temp1[19:18]);
	parallelPrefixCircuit PPC10(kgp[21:20], temp1[19:18], temp1[21:20]);
	parallelPrefixCircuit PPC11(kgp[23:22], temp1[21:20], temp1[23:22]);
	parallelPrefixCircuit PPC12(kgp[25:24], temp1[23:22], temp1[25:24]);
	parallelPrefixCircuit PPC13(kgp[27:26], temp1[25:24], temp1[27:26]);
	parallelPrefixCircuit PPC14(kgp[29:28], temp1[27:26], temp1[29:28]);
	parallelPrefixCircuit PPC15(kgp[31:30], temp1[29:28], temp1[31:30]);
	parallelPrefixCircuit PPC16(kgp[33:32], temp1[31:30], temp1[33:32]);
	parallelPrefixCircuit PPC17(kgp[35:34], temp1[33:32], temp1[35:34]);
	parallelPrefixCircuit PPC18(kgp[37:36], temp1[35:34], temp1[37:36]);
	parallelPrefixCircuit PPC19(kgp[39:38], temp1[37:36], temp1[39:38]);
	parallelPrefixCircuit PPC20(kgp[41:40], temp1[39:38], temp1[41:40]);
	parallelPrefixCircuit PPC21(kgp[43:42], temp1[41:40], temp1[43:42]);
	parallelPrefixCircuit PPC22(kgp[45:44], temp1[43:42], temp1[45:44]);
	parallelPrefixCircuit PPC23(kgp[47:46], temp1[45:44], temp1[47:46]);
	parallelPrefixCircuit PPC24(kgp[49:48], temp1[47:46], temp1[49:48]);
	parallelPrefixCircuit PPC25(kgp[51:50], temp1[49:48], temp1[51:50]);
	parallelPrefixCircuit PPC26(kgp[53:52], temp1[51:50], temp1[53:52]);
	parallelPrefixCircuit PPC27(kgp[55:54], temp1[53:52], temp1[55:54]);
	parallelPrefixCircuit PPC28(kgp[57:56], temp1[55:54], temp1[57:56]);
	parallelPrefixCircuit PPC29(kgp[59:58], temp1[57:56], temp1[59:58]);
	parallelPrefixCircuit PPC30(kgp[61:60], temp1[59:58], temp1[61:60]);
	parallelPrefixCircuit PPC31(kgp[63:62], temp1[61:60], temp1[63:62]);

	// 2 - 31.29  30.28  29.27  28.26  27.25  26.24  25.23  24.22  23.21  22.20  21.19  20.18  19.17  18.16  17.15  16.14  15.13  14.12  13.11  12.10  11.9  10.8  9.7  8.6  7.5  6.4  5.3  4.2  3.1  2.0  1  0
	parallelPrefixCircuit PPC32(temp1[1:0], 2'b00, temp2[1:0]);
	parallelPrefixCircuit PPC33(temp1[3:2], 2'b00, temp2[3:2]);
   	parallelPrefixCircuit PPC34(temp1[5:4], temp2[3:2], temp2[5:4]);
	parallelPrefixCircuit PPC35(temp1[7:6], temp2[5:4], temp2[7:6]);
	parallelPrefixCircuit PPC36(temp1[9:8], temp2[7:6], temp2[9:8]);
	parallelPrefixCircuit PPC37(temp1[11:10], temp2[9:8], temp2[11:10]);
	parallelPrefixCircuit PPC38(temp1[13:12], temp2[11:10], temp2[13:12]);
	parallelPrefixCircuit PPC39(temp1[15:14], temp2[13:12], temp2[15:14]);
	parallelPrefixCircuit PPC40(temp1[17:16], temp2[15:14], temp2[17:16]);
	parallelPrefixCircuit PPC41(temp1[19:18], temp2[17:16], temp2[19:18]);
	parallelPrefixCircuit PPC42(temp1[21:20], temp2[19:18], temp2[21:20]);
	parallelPrefixCircuit PPC43(temp1[23:22], temp2[21:20], temp2[23:22]);
	parallelPrefixCircuit PPC44(temp1[25:24], temp2[23:22], temp2[25:24]);
	parallelPrefixCircuit PPC45(temp1[27:26], temp2[25:24], temp2[27:26]);
	parallelPrefixCircuit PPC46(temp1[29:28], temp2[27:26], temp2[29:28]);
	parallelPrefixCircuit PPC47(temp1[31:30], temp2[29:28], temp2[31:30]);
	parallelPrefixCircuit PPC48(temp1[33:32], temp2[31:30], temp2[33:32]);
	parallelPrefixCircuit PPC49(temp1[35:34], temp2[33:32], temp2[35:34]);
	parallelPrefixCircuit PPC50(temp1[37:36], temp2[35:34], temp2[37:36]);
	parallelPrefixCircuit PPC51(temp1[39:38], temp2[37:36], temp2[39:38]);
	parallelPrefixCircuit PPC52(temp1[41:40], temp2[39:38], temp2[41:40]);
	parallelPrefixCircuit PPC53(temp1[43:42], temp2[41:40], temp2[43:42]);
	parallelPrefixCircuit PPC54(temp1[45:44], temp2[43:42], temp2[45:44]);
	parallelPrefixCircuit PPC55(temp1[47:46], temp2[45:44], temp2[47:46]);
	parallelPrefixCircuit PPC56(temp1[49:48], temp2[47:46], temp2[49:48]);
	parallelPrefixCircuit PPC57(temp1[51:50], temp2[49:48], temp2[51:50]);
	parallelPrefixCircuit PPC58(temp1[53:52], temp2[51:50], temp2[53:52]);
	parallelPrefixCircuit PPC59(temp1[55:54], temp2[53:52], temp2[55:54]);
	parallelPrefixCircuit PPC60(temp1[57:56], temp2[55:54], temp2[57:56]);
	parallelPrefixCircuit PPC61(temp1[59:58], temp2[57:56], temp2[59:58]);
	parallelPrefixCircuit PPC62(temp1[61:60], temp2[59:58], temp2[61:60]);
	parallelPrefixCircuit PPC63(temp1[63:62], temp2[61:60], temp2[63:62]);
    	
    // 4 - 31.27  30.26  29.25  28.24  27.23  26.22  25.21  24.20  23.19  22.18  21.17  20.16  19.15  18.14  17.13  16.12  15.11  14.10  13.9  12.8  11.7  10.6  9.5  8.4  7.3  6.2  5.1  4.0  3  2  1  0
	parallelPrefixCircuit PPC64(temp2[1:0], 2'b00, temp3[1:0]);
   	parallelPrefixCircuit PPC65(temp2[3:2], 2'b00, temp3[3:2]);
	parallelPrefixCircuit PPC66(temp2[5:4], 2'b00, temp3[5:4]);
	parallelPrefixCircuit PPC67(temp2[7:6], 2'b00, temp3[7:6]);
	parallelPrefixCircuit PPC68(temp2[9:8], temp3[7:6], temp3[9:8]);
	parallelPrefixCircuit PPC69(temp2[11:10], temp3[9:8], temp3[11:10]);
	parallelPrefixCircuit PPC70(temp2[13:12], temp3[11:10], temp3[13:12]);
	parallelPrefixCircuit PPC71(temp2[15:14], temp3[13:12], temp3[15:14]);
	parallelPrefixCircuit PPC72(temp2[17:16], temp3[15:14], temp3[17:16]);
	parallelPrefixCircuit PPC73(temp2[19:18], temp3[17:16], temp3[19:18]);
	parallelPrefixCircuit PPC74(temp2[21:20], temp3[19:18], temp3[21:20]);
	parallelPrefixCircuit PPC75(temp2[23:22], temp3[21:20], temp3[23:22]);
	parallelPrefixCircuit PPC76(temp2[25:24], temp3[23:22], temp3[25:24]);
	parallelPrefixCircuit PPC77(temp2[27:26], temp3[25:24], temp3[27:26]);
	parallelPrefixCircuit PPC78(temp2[29:28], temp3[27:26], temp3[29:28]);
	parallelPrefixCircuit PPC79(temp2[31:30], temp3[29:28], temp3[31:30]);
	parallelPrefixCircuit PPC80(temp2[33:32], temp3[31:30], temp3[33:32]);
	parallelPrefixCircuit PPC81(temp2[35:34], temp3[33:32], temp3[35:34]);
	parallelPrefixCircuit PPC82(temp2[37:36], temp3[35:34], temp3[37:36]);
	parallelPrefixCircuit PPC83(temp2[39:38], temp3[37:36], temp3[39:38]);
	parallelPrefixCircuit PPC84(temp2[41:40], temp3[39:38], temp3[41:40]);
	parallelPrefixCircuit PPC85(temp2[43:42], temp3[41:40], temp3[43:42]);
	parallelPrefixCircuit PPC86(temp2[45:44], temp3[43:42], temp3[45:44]);
	parallelPrefixCircuit PPC87(temp2[47:46], temp3[45:44], temp3[47:46]);
	parallelPrefixCircuit PPC88(temp2[49:48], temp3[47:46], temp3[49:48]);
	parallelPrefixCircuit PPC89(temp2[51:50], temp3[49:48], temp3[51:50]);
	parallelPrefixCircuit PPC90(temp2[53:52], temp3[51:50], temp3[53:52]);
	parallelPrefixCircuit PPC91(temp2[55:54], temp3[53:52], temp3[55:54]);
	parallelPrefixCircuit PPC92(temp2[57:56], temp3[55:54], temp3[57:56]);
	parallelPrefixCircuit PPC93(temp2[59:58], temp3[57:56], temp3[59:58]);
	parallelPrefixCircuit PPC94(temp2[61:60], temp3[59:58], temp3[61:60]);
	parallelPrefixCircuit PPC95(temp2[63:62], temp3[61:60], temp3[63:62]);
    	
    // 8 - 31.23  30.22  29.21  28.20  27.19  26.18  25.17  24.16  23.15  22.14  21.13  20.12  19.11  18.10  17.9  16.8  15.7  14.6  13.5  12.5  11.3  10.2  9.1  8.0  7  6  5  4  3  2  1  0
	parallelPrefixCircuit PPC96(temp3[1:0], 2'b00, temp4[3:2]);
	parallelPrefixCircuit PPC97(temp3[3:2], 2'b00, temp4[3:2]);
	parallelPrefixCircuit PPC98(temp3[5:4], 2'b00, temp4[5:4]);
	parallelPrefixCircuit PPC99(temp3[7:6], 2'b00, temp4[7:6]);
	parallelPrefixCircuit PPC100(temp3[9:8], 2'b00, temp4[9:8]);
	parallelPrefixCircuit PPC101(temp3[11:10], 2'b00, temp4[11:10]);
	parallelPrefixCircuit PPC102(temp3[13:12], 2'b00, temp4[13:12]);
	parallelPrefixCircuit PPC103(temp3[15:14], 2'b00, temp4[15:14]);
	parallelPrefixCircuit PPC104(temp3[17:16], temp4[15:14], temp4[17:16]);
	parallelPrefixCircuit PPC105(temp3[19:18], temp4[17:16], temp4[19:18]);
	parallelPrefixCircuit PPC106(temp3[21:20], temp4[19:18], temp4[21:20]);
	parallelPrefixCircuit PPC107(temp3[23:22], temp4[21:20], temp4[23:22]);
	parallelPrefixCircuit PPC108(temp3[25:24], temp4[23:22], temp4[25:24]);
	parallelPrefixCircuit PPC109(temp3[27:26], temp4[25:24], temp4[27:26]);
	parallelPrefixCircuit PPC110(temp3[29:28], temp4[27:26], temp4[29:28]);
	parallelPrefixCircuit PPC111(temp3[31:30], temp4[29:28], temp4[31:30]);
	parallelPrefixCircuit PPC112(temp3[33:32], temp4[31:30], temp4[33:32]);
	parallelPrefixCircuit PPC113(temp3[35:34], temp4[33:32], temp4[35:34]);
	parallelPrefixCircuit PPC114(temp3[37:36], temp4[35:34], temp4[37:36]);
	parallelPrefixCircuit PPC115(temp3[39:38], temp4[37:36], temp4[39:38]);
	parallelPrefixCircuit PPC116(temp3[41:40], temp4[39:38], temp4[41:40]);
	parallelPrefixCircuit PPC117(temp3[43:42], temp4[41:40], temp4[43:42]);
	parallelPrefixCircuit PPC118(temp3[45:44], temp4[43:42], temp4[45:44]);
	parallelPrefixCircuit PPC119(temp3[47:46], temp4[45:44], temp4[47:46]);
	parallelPrefixCircuit PPC120(temp3[49:48], temp4[47:46], temp4[49:48]);
	parallelPrefixCircuit PPC121(temp3[51:50], temp4[49:48], temp4[51:50]);
	parallelPrefixCircuit PPC122(temp3[53:52], temp4[51:50], temp4[53:52]);
	parallelPrefixCircuit PPC123(temp3[55:54], temp4[53:52], temp4[55:54]);
	parallelPrefixCircuit PPC124(temp3[57:56], temp4[55:54], temp4[57:56]);
	parallelPrefixCircuit PPC125(temp3[59:58], temp4[57:56], temp4[59:58]);
	parallelPrefixCircuit PPC126(temp3[61:60], temp4[59:58], temp4[61:60]);
	parallelPrefixCircuit PPC127(temp3[63:62], temp4[61:60], temp4[63:62]);
	
	// 16 - 31.15  30.14  29.13  28.12  27.11  26.10  25.9  24.8  23.7  22.6  21.5  20.4  19.3  18.2  17.1  16.0  15  14  13  12  11  10  9  8  7  6  5  4  3  2  1  0
	parallelPrefixCircuit PPC128(temp4[1:0], 2'b00, temp5[1:0]);
	parallelPrefixCircuit PPC129(temp4[3:2], 2'b00, temp5[3:2]);
	parallelPrefixCircuit PPC130(temp4[5:4], 2'b00, temp5[5:4]);
	parallelPrefixCircuit PPC131(temp4[7:6], 2'b00, temp5[7:6]);
	parallelPrefixCircuit PPC132(temp4[9:8], 2'b00, temp5[9:8]);
	parallelPrefixCircuit PPC133(temp4[11:10], 2'b00, temp5[11:10]);
	parallelPrefixCircuit PPC134(temp4[13:12], 2'b00, temp5[13:12]);
	parallelPrefixCircuit PPC135(temp4[15:14], 2'b00, temp5[15:14]);
	parallelPrefixCircuit PPC136(temp4[17:16], 2'b00, temp5[17:16]);
	parallelPrefixCircuit PPC137(temp4[19:18], 2'b00, temp5[19:18]);
	parallelPrefixCircuit PPC138(temp4[21:20], 2'b00, temp5[21:20]);
	parallelPrefixCircuit PPC139(temp4[23:22], 2'b00, temp5[23:22]);
	parallelPrefixCircuit PPC140(temp4[25:24], 2'b00, temp5[25:24]);
	parallelPrefixCircuit PPC141(temp4[27:26], 2'b00, temp5[27:26]);
	parallelPrefixCircuit PPC142(temp4[29:28], 2'b00, temp5[29:28]);
	parallelPrefixCircuit PPC143(temp4[31:30], 2'b00, temp5[31:30]);
	parallelPrefixCircuit PPC144(temp4[33:32], temp5[31:30], temp5[33:32]);
	parallelPrefixCircuit PPC145(temp4[35:34], temp5[33:32], temp5[35:34]);
	parallelPrefixCircuit PPC146(temp4[37:36], temp5[35:34], temp5[37:36]);
	parallelPrefixCircuit PPC147(temp4[39:38], temp5[37:36], temp5[39:38]);
	parallelPrefixCircuit PPC148(temp4[41:40], temp5[39:38], temp5[41:40]);
	parallelPrefixCircuit PPC149(temp4[43:42], temp5[41:40], temp5[43:42]);
	parallelPrefixCircuit PPC150(temp4[45:44], temp5[43:42], temp5[45:44]);
	parallelPrefixCircuit PPC151(temp4[47:46], temp5[45:44], temp5[47:46]);
	parallelPrefixCircuit PPC152(temp4[49:48], temp5[47:46], temp5[49:48]);
	parallelPrefixCircuit PPC153(temp4[51:50], temp5[49:48], temp5[51:50]);
	parallelPrefixCircuit PPC154(temp4[53:52], temp5[51:50], temp5[53:52]);
	parallelPrefixCircuit PPC155(temp4[55:54], temp5[53:52], temp5[55:54]);
	parallelPrefixCircuit PPC156(temp4[57:56], temp5[55:54], temp5[57:56]);
	parallelPrefixCircuit PPC157(temp4[59:58], temp5[57:56], temp5[59:58]);
	parallelPrefixCircuit PPC158(temp4[61:60], temp5[59:58], temp5[61:60]);
	parallelPrefixCircuit PPC159(temp4[63:62], temp5[61:60], temp5[63:62]);

	//32 - NIL
	
	//final input carry calculation
	for(i = 0; i < 32; i = i + 1)
	begin
		assign cin[i] = temp5[2 * i + 1];
	end
	
	//calculating S
	assign S[0] = A[0] ^ B[0];
	for(i = 1; i < 32; i = i + 1)
	begin
		assign S[i] = A[i] ^ B[i] ^ cin[i - 1];
	end
	
	assign Ca = cin[31];
	
endmodule
