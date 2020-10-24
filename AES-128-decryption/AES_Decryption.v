module AES_Decryption(
    input CLK,
    input [0:127] ENCRYPTED_DATA,
    input [0:127] CIPHER_KEY,
    output [0:127] ORIGINAL_DECRYPTED_DATA
    );

wire [0:31] RCON1, RCON2, RCON3, RCON4, RCON5, RCON6, RCON7, RCON8, RCON9, RCON10;

wire [0:127] KEY_1, KEY_2, KEY_3, KEY_4, KEY_5, KEY_6, KEY_7, KEY_8, KEY_9, KEY_10;

wire [0:127] U1, U2, U3, U4, U5;
wire [0:127] T1, T2, T3, T4;
wire [0:127] A1, A2, A3, A4;
wire [0:127] C1, C2, C3, C4;
wire [0:127] O1, O2, O3, O4;
wire [0:127] Y1, Y2, Y3, Y4;
wire [0:127] Z1, Z2, Z3, Z4; 
wire [0:127] G1, G2, G3, G4;
wire [0:127] H1, H2, H3, H4;
wire [0:127] S1, S2;

assign RCON1 = 32'h01_00_00_00;
assign RCON2 = 32'h02_00_00_00;
assign RCON3 = 32'h04_00_00_00;
assign RCON4 = 32'h08_00_00_00;
assign RCON5 = 32'h10_00_00_00;
assign RCON6 = 32'h20_00_00_00;
assign RCON7 = 32'h40_00_00_00;
assign RCON8 = 32'h80_00_00_00;
assign RCON9 = 32'h1B_00_00_00;
assign RCON10 = 32'h36_00_00_00;

// KEY GENERATION

Round_Key_Value K1(.CLK(CLK), .PREVIOUS_KEY(CIPHER_KEY), .Round_Constant(RCON1), .NEW_KEY(KEY_1));
Round_Key_Value K2(.CLK(CLK), .PREVIOUS_KEY(KEY_1), .Round_Constant(RCON2), .NEW_KEY(KEY_2));
Round_Key_Value K3(.CLK(CLK), .PREVIOUS_KEY(KEY_2), .Round_Constant(RCON3), .NEW_KEY(KEY_3));
Round_Key_Value K4(.CLK(CLK), .PREVIOUS_KEY(KEY_3), .Round_Constant(RCON4), .NEW_KEY(KEY_4));
Round_Key_Value K5(.CLK(CLK), .PREVIOUS_KEY(KEY_4), .Round_Constant(RCON5), .NEW_KEY(KEY_5));
Round_Key_Value K6(.CLK(CLK), .PREVIOUS_KEY(KEY_5), .Round_Constant(RCON6), .NEW_KEY(KEY_6));
Round_Key_Value K7(.CLK(CLK), .PREVIOUS_KEY(KEY_6), .Round_Constant(RCON7), .NEW_KEY(KEY_7));
Round_Key_Value K8(.CLK(CLK), .PREVIOUS_KEY(KEY_7), .Round_Constant(RCON8), .NEW_KEY(KEY_8));
Round_Key_Value K9(.CLK(CLK), .PREVIOUS_KEY(KEY_8), .Round_Constant(RCON9), .NEW_KEY(KEY_9));
Round_Key_Value K10(.CLK(CLK), .PREVIOUS_KEY(KEY_9), .Round_Constant(RCON10), .NEW_KEY(KEY_10));

// ROUND - 1

Input_Stage DEC11(.INPUT(ENCRYPTED_DATA), .CIPHER_KEY(KEY_10), .OUTPUT(U1));

Inverse_Shift_Rows DEC12(.INPUT(U1), .OUTPUT(U2));

Inverse_Sub_Bytes DEC13(.CLK(CLK), .INPUT(U2), .OUTPUT(U3));

Input_Stage DEC14(.INPUT(U3), .CIPHER_KEY(KEY_9), .OUTPUT(U4));

Inverse_Mix_Columns DEC15(.CLK(CLK), .INPUT(U4), .OUTPUT(U5));

// ROUND - 2

Inverse_Shift_Rows DEC21(.INPUT(U5), .OUTPUT(T1));

Inverse_Sub_Bytes DEC22(.CLK(CLK), .INPUT(T1), .OUTPUT(T2));

Input_Stage DEC23(.INPUT(T2), .CIPHER_KEY(KEY_8), .OUTPUT(T3));

Inverse_Mix_Columns DEC24(.CLK(CLK), .INPUT(T3), .OUTPUT(T4));

// ROUND - 3

Inverse_Shift_Rows DEC31(.INPUT(T4), .OUTPUT(A1));

Inverse_Sub_Bytes DEC32(.CLK(CLK), .INPUT(A1), .OUTPUT(A2));

Input_Stage DEC33(.INPUT(A2), .CIPHER_KEY(KEY_7), .OUTPUT(A3));

Inverse_Mix_Columns DEC34(.CLK(CLK), .INPUT(A3), .OUTPUT(A4));

// ROUND - 4

Inverse_Shift_Rows DEC41(.INPUT(A4), .OUTPUT(C1));

Inverse_Sub_Bytes DEC42(.CLK(CLK), .INPUT(C1), .OUTPUT(C2));

Input_Stage DEC43(.INPUT(C2), .CIPHER_KEY(KEY_6), .OUTPUT(C3));

Inverse_Mix_Columns DEC44(.CLK(CLK), .INPUT(C3), .OUTPUT(C4));

// ROUND - 5

Inverse_Shift_Rows DEC51(.INPUT(C4), .OUTPUT(O1));

Inverse_Sub_Bytes DEC52(.CLK(CLK), .INPUT(O1), .OUTPUT(O2));

Input_Stage DEC53(.INPUT(O2), .CIPHER_KEY(KEY_5), .OUTPUT(O3));

Inverse_Mix_Columns DEC54(.CLK(CLK), .INPUT(O3), .OUTPUT(O4));

// ROUND - 6

Inverse_Shift_Rows DEC61(.INPUT(O4), .OUTPUT(Y1));

Inverse_Sub_Bytes DEC62(.CLK(CLK), .INPUT(Y1), .OUTPUT(Y2));

Input_Stage DEC63(.INPUT(Y2), .CIPHER_KEY(KEY_4), .OUTPUT(Y3));

Inverse_Mix_Columns DEC64(.CLK(CLK), .INPUT(Y3), .OUTPUT(Y4));

// ROUND - 7

Inverse_Shift_Rows DEC71(.INPUT(Y4), .OUTPUT(Z1));

Inverse_Sub_Bytes DEC72(.CLK(CLK), .INPUT(Z1), .OUTPUT(Z2));

Input_Stage DEC73(.INPUT(Z2), .CIPHER_KEY(KEY_3), .OUTPUT(Z3));

Inverse_Mix_Columns DEC74(.CLK(CLK), .INPUT(Z3), .OUTPUT(Z4));

// ROUND - 8

Inverse_Shift_Rows DEC81(.INPUT(Z4), .OUTPUT(G1));

Inverse_Sub_Bytes DEC82(.CLK(CLK), .INPUT(G1), .OUTPUT(G2));

Input_Stage DEC83(.INPUT(G2), .CIPHER_KEY(KEY_2), .OUTPUT(G3));

Inverse_Mix_Columns DEC84(.CLK(CLK), .INPUT(G3), .OUTPUT(G4));

// ROUND - 9

Inverse_Shift_Rows DEC91(.INPUT(G4), .OUTPUT(H1));

Inverse_Sub_Bytes DEC92(.CLK(CLK), .INPUT(H1), .OUTPUT(H2));

Input_Stage DEC93(.INPUT(H2), .CIPHER_KEY(KEY_1), .OUTPUT(H3));

Inverse_Mix_Columns DEC94(.CLK(CLK), .INPUT(H3), .OUTPUT(H4));

// ROUND - 10

Inverse_Shift_Rows DEC101(.INPUT(H4), .OUTPUT(S1));

Inverse_Sub_Bytes DEC102(.CLK(CLK), .INPUT(S1), .OUTPUT(S2));

Input_Stage DEC103(.INPUT(S2), .CIPHER_KEY(CIPHER_KEY), .OUTPUT(ORIGINAL_DECRYPTED_DATA));


endmodule