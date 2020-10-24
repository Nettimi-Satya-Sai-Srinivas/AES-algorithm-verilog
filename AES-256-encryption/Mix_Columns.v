module Mix_Columns(
    input CLK,
    input [0:127] INPUT,
    output [0:127] OUTPUT
    );

wire [0:31] Column_1, Column_2, Column_3, Column_4;

wire [0:7] C11, C12, C13, C14;
wire [0:7] S11, S12, S13, S14, S15, S16, S17, S18;

wire [0:7] C21, C22, C23, C24;
wire [0:7] S21, S22, S23, S24, S25, S26, S27, S28;

wire [0:7] C31, C32, C33, C34;
wire [0:7] S31, S32, S33, S34, S35, S36, S37, S38;

wire [0:7] C41, C42, C43, C44;
wire [0:7] S41, S42, S43, S44, S45, S46, S47, S48;

assign Column_1 = INPUT[0:31];
assign Column_2 = INPUT[32:63];
assign Column_3 = INPUT[64:95];
assign Column_4 = INPUT[96:127];

assign C11 = Column_1[0:7];
assign C12 = Column_1[8:15];
assign C13 = Column_1[16:23];
assign C14 = Column_1[24:31];

assign C21 = Column_2[0:7];
assign C22 = Column_2[8:15];
assign C23 = Column_2[16:23];
assign C24 = Column_2[24:31];

assign C31 = Column_3[0:7];
assign C32 = Column_3[8:15];
assign C33 = Column_3[16:23];
assign C34 = Column_3[24:31];

assign C41 = Column_4[0:7];
assign C42 = Column_4[8:15];
assign C43 = Column_4[16:23];
assign C44 = Column_4[24:31];

Multiply_By_2 K11(.CLK(CLK), .Read_Enable(1'b1), .Read_Address(C11), .Read_Data(S11));
Multiply_By_3 K12(.CLK(CLK), .Read_Enable(1'b1), .Read_Address(C12), .Read_Data(S12));

Multiply_By_2 K13(.CLK(CLK), .Read_Enable(1'b1), .Read_Address(C12), .Read_Data(S13));
Multiply_By_3 K14(.CLK(CLK), .Read_Enable(1'b1), .Read_Address(C13), .Read_Data(S14));

Multiply_By_2 K15(.CLK(CLK), .Read_Enable(1'b1), .Read_Address(C13), .Read_Data(S15));
Multiply_By_3 K16(.CLK(CLK), .Read_Enable(1'b1), .Read_Address(C14), .Read_Data(S16));

Multiply_By_2 K17(.CLK(CLK), .Read_Enable(1'b1), .Read_Address(C14), .Read_Data(S17));
Multiply_By_3 K18(.CLK(CLK), .Read_Enable(1'b1), .Read_Address(C11), .Read_Data(S18));

//

Multiply_By_2 K21(.CLK(CLK), .Read_Enable(1'b1), .Read_Address(C21), .Read_Data(S21));
Multiply_By_3 K22(.CLK(CLK), .Read_Enable(1'b1), .Read_Address(C22), .Read_Data(S22));

Multiply_By_2 K23(.CLK(CLK), .Read_Enable(1'b1), .Read_Address(C22), .Read_Data(S23));
Multiply_By_3 K24(.CLK(CLK), .Read_Enable(1'b1), .Read_Address(C23), .Read_Data(S24));

Multiply_By_2 K25(.CLK(CLK), .Read_Enable(1'b1), .Read_Address(C23), .Read_Data(S25));
Multiply_By_3 K26(.CLK(CLK), .Read_Enable(1'b1), .Read_Address(C24), .Read_Data(S26));

Multiply_By_2 K27(.CLK(CLK), .Read_Enable(1'b1), .Read_Address(C24), .Read_Data(S27));
Multiply_By_3 K28(.CLK(CLK), .Read_Enable(1'b1), .Read_Address(C21), .Read_Data(S28));

//

Multiply_By_2 K31(.CLK(CLK), .Read_Enable(1'b1), .Read_Address(C31), .Read_Data(S31));
Multiply_By_3 K32(.CLK(CLK), .Read_Enable(1'b1), .Read_Address(C32), .Read_Data(S32));

Multiply_By_2 K33(.CLK(CLK), .Read_Enable(1'b1), .Read_Address(C32), .Read_Data(S33));
Multiply_By_3 K34(.CLK(CLK), .Read_Enable(1'b1), .Read_Address(C33), .Read_Data(S34));

Multiply_By_2 K35(.CLK(CLK), .Read_Enable(1'b1), .Read_Address(C33), .Read_Data(S35));
Multiply_By_3 K36(.CLK(CLK), .Read_Enable(1'b1), .Read_Address(C34), .Read_Data(S36));

Multiply_By_2 K37(.CLK(CLK), .Read_Enable(1'b1), .Read_Address(C34), .Read_Data(S37));
Multiply_By_3 K38(.CLK(CLK), .Read_Enable(1'b1), .Read_Address(C31), .Read_Data(S38));

//

Multiply_By_2 K41(.CLK(CLK), .Read_Enable(1'b1), .Read_Address(C41), .Read_Data(S41));
Multiply_By_3 K42(.CLK(CLK), .Read_Enable(1'b1), .Read_Address(C42), .Read_Data(S42));

Multiply_By_2 K43(.CLK(CLK), .Read_Enable(1'b1), .Read_Address(C42), .Read_Data(S43));
Multiply_By_3 K44(.CLK(CLK), .Read_Enable(1'b1), .Read_Address(C43), .Read_Data(S44));

Multiply_By_2 K45(.CLK(CLK), .Read_Enable(1'b1), .Read_Address(C43), .Read_Data(S45));
Multiply_By_3 K46(.CLK(CLK), .Read_Enable(1'b1), .Read_Address(C44), .Read_Data(S46));

Multiply_By_2 K47(.CLK(CLK), .Read_Enable(1'b1), .Read_Address(C44), .Read_Data(S47));
Multiply_By_3 K48(.CLK(CLK), .Read_Enable(1'b1), .Read_Address(C41), .Read_Data(S48));

assign OUTPUT[0:7] = (S11 ^ S12 ^ C13 ^ C14);
assign OUTPUT[8:15] = (C11 ^ S13 ^ S14 ^ C14);
assign OUTPUT[16:23] = (C11 ^ C12 ^ S15 ^ S16);
assign OUTPUT[24:31] = (S18 ^ C12 ^ C13 ^ S17);

assign OUTPUT[32:39] = (S21 ^ S22 ^ C23 ^ C24);
assign OUTPUT[40:47] = (C21 ^ S23 ^ S24 ^ C24);
assign OUTPUT[48:55] = (C21 ^ C22 ^ S25 ^ S26);
assign OUTPUT[56:63] = (S28 ^ C22 ^ C23 ^ S27);

assign OUTPUT[64:71] = (S31 ^ S32 ^ C33 ^ C34);
assign OUTPUT[72:79] = (C31 ^ S33 ^ S34 ^ C34);
assign OUTPUT[80:87] = (C31 ^ C32 ^ S35 ^ S36);
assign OUTPUT[88:95] = (S38 ^ C32 ^ C33 ^ S37);

assign OUTPUT[96:103] = (S41 ^ S42 ^ C43 ^ C44);
assign OUTPUT[104:111] = (C41 ^ S43 ^ S44 ^ C44);
assign OUTPUT[112:119] = (C41 ^ C42 ^ S45 ^ S46);
assign OUTPUT[120:127] = (S48 ^ C42 ^ C43 ^ S47);


endmodule