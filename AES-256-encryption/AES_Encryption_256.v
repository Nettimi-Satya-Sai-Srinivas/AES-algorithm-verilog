module AES_Encryption_256(
    input CLK,
    input [0:127] DATA,
	 input [0:255] CIPHER_KEY,
	 output [0:127] ENCRYPTED_DATA
    );
	 
wire [0:127] Y1, Y2, Y3, Y4, Y5;
wire [0:127] E1, E2, E3, E4;
wire [0:127] F1, F2, F3, F4;
wire [0:127] G1, G2, G3, G4;
wire [0:127] H1, H2, H3, H4;
wire [0:127] I1, I2, I3, I4;
wire [0:127] L1, L2, L3, L4;
wire [0:127] V1, V2, V3, V4;
wire [0:127] J1, J2, J3, J4;
wire [0:127] X1, X2, X3, X4;
wire [0:127] S1, S2, S3, S4;
wire [0:127] A1, A2, A3, A4;
wire [0:127] C1, C2, C3, C4;
wire [0:127] Z1, Z2;

wire [0:255] Key_1, Key_2, Key_3, Key_4, Key_5, Key_6;
wire [0:127] Key_7;

wire [0:31] RCON1, RCON2, RCON3, RCON4, RCON5, RCON6, RCON7;

assign RCON1 = 32'h01_00_00_00;
assign RCON2 = 32'h02_00_00_00;
assign RCON3 = 32'h04_00_00_00;
assign RCON4 = 32'h08_00_00_00;
assign RCON5 = 32'h10_00_00_00;
assign RCON6 = 32'h20_00_00_00;
assign RCON7 = 32'h40_00_00_00;

// KEY GENERATION 

Round_Key_Value_256_BIT KeyGen1(.CLK(CLK), .PREVIOUS_KEY(CIPHER_KEY), .Round_Constant(RCON1), .NEW_KEY(Key_1));
Round_Key_Value_256_BIT KeyGen2(.CLK(CLK), .PREVIOUS_KEY(Key_1), .Round_Constant(RCON2), .NEW_KEY(Key_2));
Round_Key_Value_256_BIT KeyGen3(.CLK(CLK), .PREVIOUS_KEY(Key_2), .Round_Constant(RCON3), .NEW_KEY(Key_3));
Round_Key_Value_256_BIT KeyGen4(.CLK(CLK), .PREVIOUS_KEY(Key_3), .Round_Constant(RCON4), .NEW_KEY(Key_4));
Round_Key_Value_256_BIT KeyGen5(.CLK(CLK), .PREVIOUS_KEY(Key_4), .Round_Constant(RCON5), .NEW_KEY(Key_5));
Round_Key_Value_256_BIT KeyGen6(.CLK(CLK), .PREVIOUS_KEY(Key_5), .Round_Constant(RCON6), .NEW_KEY(Key_6));

Round_Key_Value KeyGen7(.CLK(CLK), .PK(Key_6), .RC(RCON7), .NK(Key_7));

// INPUT STAGE (ROUND - 0)

Input_Stage TM3_1(.INPUT(DATA), .CIPHER_KEY({CIPHER_KEY[0:127]}), .OUTPUT(Y1));

// ROUND - 1

Sub_Bytes TM3_2(.CLK(CLK), .INPUT(Y1), .OUTPUT(Y2));

Shift_Rows TM3_3(.INPUT(Y2), .OUTPUT(Y3));

Mix_Columns TM3_4(.CLK(CLK), .INPUT(Y3), .OUTPUT(Y4));

Input_Stage TM3_5(.INPUT(Y4), .CIPHER_KEY({CIPHER_KEY[128:255]}), .OUTPUT(Y5));

// ROUND - 2

Sub_Bytes TM3_6(.CLK(CLK), .INPUT(Y5), .OUTPUT(E1));

Shift_Rows TM3_7(.INPUT(E1), .OUTPUT(E2));

Mix_Columns TM3_8(.CLK(CLK), .INPUT(E2), .OUTPUT(E3));

Input_Stage TM3_9(.INPUT(E3), .CIPHER_KEY({Key_1[0:127]}), .OUTPUT(E4));

// ROUND - 3

Sub_Bytes TM3_10(.CLK(CLK), .INPUT(E4), .OUTPUT(F1));

Shift_Rows TM3_11(.INPUT(F1), .OUTPUT(F2));

Mix_Columns TM3_12(.CLK(CLK), .INPUT(F2), .OUTPUT(F3));

Input_Stage TM3_13(.INPUT(F3), .CIPHER_KEY({Key_1[128:255]}), .OUTPUT(F4));

// ROUND - 4

Sub_Bytes TM3_14(.CLK(CLK), .INPUT(F4), .OUTPUT(G1));

Shift_Rows TM3_15(.INPUT(G1), .OUTPUT(G2));

Mix_Columns TM3_16(.CLK(CLK), .INPUT(G2), .OUTPUT(G3));

Input_Stage TM3_17(.INPUT(G3), .CIPHER_KEY({Key_2[0:127]}), .OUTPUT(G4));

// ROUND - 5

Sub_Bytes TM3_18(.CLK(CLK), .INPUT(G4), .OUTPUT(H1));

Shift_Rows TM3_19(.INPUT(H1), .OUTPUT(H2));

Mix_Columns TM3_20(.CLK(CLK), .INPUT(H2), .OUTPUT(H3));

Input_Stage TM3_21(.INPUT(H3), .CIPHER_KEY({Key_2[128:255]}), .OUTPUT(H4));

// ROUND - 6

Sub_Bytes TM3_22(.CLK(CLK), .INPUT(H4), .OUTPUT(I1));

Shift_Rows TM3_23(.INPUT(I1), .OUTPUT(I2));

Mix_Columns TM3_24(.CLK(CLK), .INPUT(I2), .OUTPUT(I3));

Input_Stage TM3_25(.INPUT(I3), .CIPHER_KEY({Key_3[0:127]}), .OUTPUT(I4));

// ROUND - 7

Sub_Bytes TM3_26(.CLK(CLK), .INPUT(I4), .OUTPUT(L1));

Shift_Rows TM3_27(.INPUT(L1), .OUTPUT(L2));

Mix_Columns TM3_28(.CLK(CLK), .INPUT(L2), .OUTPUT(L3));

Input_Stage TM3_29(.INPUT(L3), .CIPHER_KEY({Key_3[128:255]}), .OUTPUT(L4));

// ROUND - 8

Sub_Bytes TM3_30(.CLK(CLK), .INPUT(L4), .OUTPUT(V1));

Shift_Rows TM3_31(.INPUT(V1), .OUTPUT(V2));

Mix_Columns TM3_32(.CLK(CLK), .INPUT(V2), .OUTPUT(V3));

Input_Stage TM3_33(.INPUT(V3), .CIPHER_KEY({Key_4[0:127]}), .OUTPUT(V4));

// ROUND - 9

Sub_Bytes TM3_34(.CLK(CLK), .INPUT(V4), .OUTPUT(J1));

Shift_Rows TM3_35(.INPUT(J1), .OUTPUT(J2));

Mix_Columns TM3_36(.CLK(CLK), .INPUT(J2), .OUTPUT(J3));

Input_Stage TM3_37(.INPUT(J3), .CIPHER_KEY({Key_4[128:255]}), .OUTPUT(J4));

// ROUND - 10

Sub_Bytes TM3_38(.CLK(CLK), .INPUT(J4), .OUTPUT(X1));

Shift_Rows TM3_39(.INPUT(X1), .OUTPUT(X2));

Mix_Columns TM3_40(.CLK(CLK), .INPUT(X2), .OUTPUT(X3));

Input_Stage TM3_41(.INPUT(X3), .CIPHER_KEY({Key_5[0:127]}), .OUTPUT(X4));

// ROUND - 11

Sub_Bytes TM3_42(.CLK(CLK), .INPUT(X4), .OUTPUT(S1));

Shift_Rows TM3_43(.INPUT(S1), .OUTPUT(S2));

Mix_Columns TM3_44(.CLK(CLK), .INPUT(S2), .OUTPUT(S3));

Input_Stage TM3_45(.INPUT(S3), .CIPHER_KEY({Key_5[128:255]}), .OUTPUT(S4));

// ROUND - 12

Sub_Bytes TM3_46(.CLK(CLK), .INPUT(S4), .OUTPUT(A1));

Shift_Rows TM3_47(.INPUT(A1), .OUTPUT(A2));

Mix_Columns TM3_48(.CLK(CLK), .INPUT(A2), .OUTPUT(A3));

Input_Stage TM3_49(.INPUT(A3), .CIPHER_KEY({Key_6[0:127]}), .OUTPUT(A4));

// ROUND - 13

Sub_Bytes TM3_50(.CLK(CLK), .INPUT(A4), .OUTPUT(C1));

Shift_Rows TM3_51(.INPUT(C1), .OUTPUT(C2));

Mix_Columns TM3_52(.CLK(CLK), .INPUT(C2), .OUTPUT(C3));

Input_Stage TM3_53(.INPUT(C3), .CIPHER_KEY({Key_6[128:255]}), .OUTPUT(C4));

// ROUND - 14

Sub_Bytes TM3_54(.CLK(CLK), .INPUT(C4), .OUTPUT(Z1));

Shift_Rows TM3_55(.INPUT(Z1), .OUTPUT(Z2));

Input_Stage TM3_56(.INPUT(Z2), .CIPHER_KEY({Key_7[0:127]}), .OUTPUT(ENCRYPTED_DATA));


endmodule