module AES_Decryption_192(
    input CLK,
    input [0:127] ENCRYPTED_DATA,
    input [0:191] CIPHER_KEY,
    output [0:127] ORIGINAL_DECRYPTED_DATA
    );

wire [0:127] U1, U2, U3, U4, U5;
wire [0:127] T1, T2, T3, T4;
wire [0:127] A1, A2, A3, A4;
wire [0:127] C1, C2, C3, C4;
wire [0:127] O1, O2, O3, O4;
wire [0:127] Y1, Y2, Y3, Y4;
wire [0:127] Z1, Z2, Z3, Z4; 
wire [0:127] G1, G2, G3, G4;
wire [0:127] H1, H2, H3, H4;
wire [0:127] S1, S2, S3, S4;
wire [0:127] V1, V2, V3, V4;
wire [0:127] M1, M2;

wire [0:31] RCON1, RCON2, RCON3, RCON4, RCON5, RCON6, RCON7, RCON8;

wire [0:191] Key_1, Key_2, Key_3, Key_4, Key_5, Key_6, Key_7, Key_8;

assign RCON1 = 32'h01_00_00_00;
assign RCON2 = 32'h02_00_00_00;
assign RCON3 = 32'h04_00_00_00;
assign RCON4 = 32'h08_00_00_00;
assign RCON5 = 32'h10_00_00_00;
assign RCON6 = 32'h20_00_00_00;
assign RCON7 = 32'h40_00_00_00;
assign RCON8 = 32'h80_00_00_00;

// KEY GENERATION

Round_Key_Value_192_BIT KEY1(.CLK(CLK), .PREVIOUS_KEY(CIPHER_KEY), .Round_Constant(RCON1), .NEW_KEY(Key_1));
Round_Key_Value_192_BIT KEY2(.CLK(CLK), .PREVIOUS_KEY(Key_1), .Round_Constant(RCON2), .NEW_KEY(Key_2));
Round_Key_Value_192_BIT KEY3(.CLK(CLK), .PREVIOUS_KEY(Key_2), .Round_Constant(RCON3), .NEW_KEY(Key_3));
Round_Key_Value_192_BIT KEY4(.CLK(CLK), .PREVIOUS_KEY(Key_3), .Round_Constant(RCON4), .NEW_KEY(Key_4));
Round_Key_Value_192_BIT KEY5(.CLK(CLK), .PREVIOUS_KEY(Key_4), .Round_Constant(RCON5), .NEW_KEY(Key_5));
Round_Key_Value_192_BIT KEY6(.CLK(CLK), .PREVIOUS_KEY(Key_5), .Round_Constant(RCON6), .NEW_KEY(Key_6));
Round_Key_Value_192_BIT KEY7(.CLK(CLK), .PREVIOUS_KEY(Key_6), .Round_Constant(RCON7), .NEW_KEY(Key_7));
Round_Key_Value_192_BIT KEY8(.CLK(CLK), .PREVIOUS_KEY(Key_7), .Round_Constant(RCON8), .NEW_KEY(Key_8));

// ROUND - 1

Input_Stage DEC_192_11(.INPUT(ENCRYPTED_DATA), .CIPHER_KEY({Key_8[0:127]}), .OUTPUT(U1));

Inverse_Shift_Rows DEC_192_12(.INPUT(U1), .OUTPUT(U2));

Inverse_Sub_Bytes DEC_192_13(.CLK(CLK), .INPUT(U2), .OUTPUT(U3));

Input_Stage DEC_192_14(.INPUT(U3), .CIPHER_KEY({Key_7[64:191]}), .OUTPUT(U4));

Inverse_Mix_Columns DEC_192_15(.CLK(CLK), .INPUT(U4), .OUTPUT(U5));

// ROUND - 2

Inverse_Shift_Rows DEC_192_21(.INPUT(U5), .OUTPUT(T1));

Inverse_Sub_Bytes DEC_192_22(.CLK(CLK), .INPUT(T1), .OUTPUT(T2));

Input_Stage DEC_192_23(.INPUT(T2), .CIPHER_KEY({Key_6[128:191], Key_7[0:63]}), .OUTPUT(T3));

Inverse_Mix_Columns DEC_192_24(.CLK(CLK), .INPUT(T3), .OUTPUT(T4));

// ROUND - 3

Inverse_Shift_Rows DEC_192_31(.INPUT(T4), .OUTPUT(A1));

Inverse_Sub_Bytes DEC_192_32(.CLK(CLK), .INPUT(A1), .OUTPUT(A2));

Input_Stage DEC_192_33(.INPUT(A2), .CIPHER_KEY({Key_6[0:127]}), .OUTPUT(A3));

Inverse_Mix_Columns DEC_192_34(.CLK(CLK), .INPUT(A3), .OUTPUT(A4));

// ROUND - 4

Inverse_Shift_Rows DEC_192_41(.INPUT(A4), .OUTPUT(C1));

Inverse_Sub_Bytes DEC_192_42(.CLK(CLK), .INPUT(C1), .OUTPUT(C2));

Input_Stage DEC_192_43(.INPUT(C2), .CIPHER_KEY({Key_5[64:191]}), .OUTPUT(C3));

Inverse_Mix_Columns DEC_192_44(.CLK(CLK), .INPUT(C3), .OUTPUT(C4));

// ROUND - 5

Inverse_Shift_Rows DEC_192_51(.INPUT(C4), .OUTPUT(O1));

Inverse_Sub_Bytes DEC_192_52(.CLK(CLK), .INPUT(O1), .OUTPUT(O2));

Input_Stage DEC_192_53(.INPUT(O2), .CIPHER_KEY({Key_4[128:191], Key_5[0:63]}), .OUTPUT(O3));

Inverse_Mix_Columns DEC_192_54(.CLK(CLK), .INPUT(O3), .OUTPUT(O4));

// ROUND - 6

Inverse_Shift_Rows DEC_192_61(.INPUT(O4), .OUTPUT(Y1));

Inverse_Sub_Bytes DEC_192_62(.CLK(CLK), .INPUT(Y1), .OUTPUT(Y2));

Input_Stage DEC_192_63(.INPUT(Y2), .CIPHER_KEY({Key_4[0:127]}), .OUTPUT(Y3));

Inverse_Mix_Columns DEC_192_64(.CLK(CLK), .INPUT(Y3), .OUTPUT(Y4));

// ROUND - 7

Inverse_Shift_Rows DEC_192_71(.INPUT(Y4), .OUTPUT(Z1));

Inverse_Sub_Bytes DEC_192_72(.CLK(CLK), .INPUT(Z1), .OUTPUT(Z2));

Input_Stage DEC_192_73(.INPUT(Z2), .CIPHER_KEY({Key_3[64:191]}), .OUTPUT(Z3));

Inverse_Mix_Columns DEC_192_74(.CLK(CLK), .INPUT(Z3), .OUTPUT(Z4));

// ROUND - 8

Inverse_Shift_Rows DEC_192_81(.INPUT(Z4), .OUTPUT(G1));

Inverse_Sub_Bytes DEC_192_82(.CLK(CLK), .INPUT(G1), .OUTPUT(G2));

Input_Stage DEC_192_83(.INPUT(G2), .CIPHER_KEY({Key_2[128:191], Key_3[0:63]}), .OUTPUT(G3));

Inverse_Mix_Columns DEC_192_84(.CLK(CLK), .INPUT(G3), .OUTPUT(G4));

// ROUND - 9

Inverse_Shift_Rows DEC_192_91(.INPUT(G4), .OUTPUT(H1));

Inverse_Sub_Bytes DEC_192_92(.CLK(CLK), .INPUT(H1), .OUTPUT(H2));

Input_Stage DEC_192_93(.INPUT(H2), .CIPHER_KEY({Key_2[0:127]}), .OUTPUT(H3));

Inverse_Mix_Columns DEC_192_94(.CLK(CLK), .INPUT(H3), .OUTPUT(H4));

// ROUND - 10

Inverse_Shift_Rows DEC_192_101(.INPUT(H4), .OUTPUT(S1));

Inverse_Sub_Bytes DEC_192_102(.CLK(CLK), .INPUT(S1), .OUTPUT(S2));

Input_Stage DEC_192_103(.INPUT(S2), .CIPHER_KEY({Key_1[64:191]}), .OUTPUT(S3));

Inverse_Mix_Columns DEC_192_104(.CLK(CLK), .INPUT(S3), .OUTPUT(S4));

// ROUND - 11

Inverse_Shift_Rows DEC_192_111(.INPUT(S4), .OUTPUT(V1));

Inverse_Sub_Bytes DEC_192_112(.CLK(CLK), .INPUT(V1), .OUTPUT(V2));

Input_Stage DEC_192_113(.INPUT(V2), .CIPHER_KEY({CIPHER_KEY[128:191], Key_1[0:63]}), .OUTPUT(V3));

Inverse_Mix_Columns DEC_192_114(.CLK(CLK), .INPUT(V3), .OUTPUT(V4));

// ROUND - 12

Inverse_Shift_Rows DEC_191_121(.INPUT(V4), .OUTPUT(M1));

Inverse_Sub_Bytes DEC_191_122(.CLK(CLK), .INPUT(M1), .OUTPUT(M2));

Input_Stage DEC_191_123(.INPUT(M2), .CIPHER_KEY({CIPHER_KEY[0:127]}), .OUTPUT(ORIGINAL_DECRYPTED_DATA));

endmodule
