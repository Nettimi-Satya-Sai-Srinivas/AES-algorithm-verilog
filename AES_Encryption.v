module AES_Encryption(
	 input CLK,
    input [0:127] DATA,
	 input [0:127] CIPHER_KEY,
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
wire [0:127] X1, X2;

wire [0:127] K1, K2, K3, K4, K5, K6, K7, K8, K9, K10;

wire [0:31] RCON1, RCON2, RCON3, RCON4, RCON5, RCON6, RCON7, RCON8, RCON9, RCON10;

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

// INPUT STAGE

Input_Stage TM1(.INPUT(DATA), .CIPHER_KEY(CIPHER_KEY), .OUTPUT(Y1));

// ROUND - 1

Sub_Bytes TM2(.CLK(CLK), .INPUT(Y1), .OUTPUT(Y2));

Shift_Rows TM3(.INPUT(Y2), .OUTPUT(Y3));

Mix_Columns TM4(.CLK(CLK), .INPUT(Y3), .OUTPUT(Y4));

Round_Key_Value TM5(.CLK(CLK), .PREVIOUS_KEY(CIPHER_KEY), .Round_Constant(RCON1), .NEW_KEY(K1));

Input_Stage TM6(.INPUT(Y4), .CIPHER_KEY(K1), .OUTPUT(Y5));

// ROUND - 2

Sub_Bytes TM7(.CLK(CLK), .INPUT(Y5), .OUTPUT(E1));

Shift_Rows TM8(.INPUT(E1), .OUTPUT(E2));

Mix_Columns TM9(.CLK(CLK), .INPUT(E2), .OUTPUT(E3));

Round_Key_Value TM10(.CLK(CLK), .PREVIOUS_KEY(K1), .Round_Constant(RCON2), .NEW_KEY(K2));

Input_Stage TM11(.INPUT(E3), .CIPHER_KEY(K2), .OUTPUT(E4));

// ROUND - 3

Sub_Bytes TM12(.CLK(CLK), .INPUT(E4), .OUTPUT(F1));

Shift_Rows TM13(.INPUT(F1), .OUTPUT(F2));

Mix_Columns TM14(.CLK(CLK), .INPUT(F2), .OUTPUT(F3));

Round_Key_Value TM15(.CLK(CLK), .PREVIOUS_KEY(K2), .Round_Constant(RCON3), .NEW_KEY(K3));

Input_Stage TM16(.INPUT(F3), .CIPHER_KEY(K3), .OUTPUT(F4));

// ROUND - 4

Sub_Bytes TM17(.CLK(CLK), .INPUT(F4), .OUTPUT(G1));

Shift_Rows TM18(.INPUT(G1), .OUTPUT(G2));

Mix_Columns TM19(.CLK(CLK), .INPUT(G2), .OUTPUT(G3));

Round_Key_Value TM20(.CLK(CLK), .PREVIOUS_KEY(K3), .Round_Constant(RCON4), .NEW_KEY(K4));

Input_Stage TM21(.INPUT(G3), .CIPHER_KEY(K4), .OUTPUT(G4));

// ROUND - 5

Sub_Bytes TM22(.CLK(CLK), .INPUT(G4), .OUTPUT(H1));

Shift_Rows TM23(.INPUT(H1), .OUTPUT(H2));

Mix_Columns TM24(.CLK(CLK), .INPUT(H2), .OUTPUT(H3));

Round_Key_Value TM25(.CLK(CLK), .PREVIOUS_KEY(K4), .Round_Constant(RCON5), .NEW_KEY(K5));

Input_Stage TM26(.INPUT(H3), .CIPHER_KEY(K5), .OUTPUT(H4));

// ROUND - 6

Sub_Bytes TM27(.CLK(CLK), .INPUT(H4), .OUTPUT(I1));

Shift_Rows TM28(.INPUT(I1), .OUTPUT(I2));

Mix_Columns TM29(.CLK(CLK), .INPUT(I2), .OUTPUT(I3));

Round_Key_Value TM30(.CLK(CLK), .PREVIOUS_KEY(K5), .Round_Constant(RCON6), .NEW_KEY(K6));

Input_Stage TM31(.INPUT(I3), .CIPHER_KEY(K6), .OUTPUT(I4));

// ROUND - 7

Sub_Bytes TM32(.CLK(CLK), .INPUT(I4), .OUTPUT(L1));

Shift_Rows TM33(.INPUT(L1), .OUTPUT(L2));

Mix_Columns TM34(.CLK(CLK), .INPUT(L2), .OUTPUT(L3));

Round_Key_Value TM35(.CLK(CLK), .PREVIOUS_KEY(K6), .Round_Constant(RCON7), .NEW_KEY(K7));

Input_Stage TM36(.INPUT(L3), .CIPHER_KEY(K7), .OUTPUT(L4));

// ROUND - 8

Sub_Bytes TM37(.CLK(CLK), .INPUT(L4), .OUTPUT(V1));

Shift_Rows TM38(.INPUT(V1), .OUTPUT(V2));

Mix_Columns TM39(.CLK(CLK), .INPUT(V2), .OUTPUT(V3));

Round_Key_Value TM40(.CLK(CLK), .PREVIOUS_KEY(K7), .Round_Constant(RCON8), .NEW_KEY(K8));

Input_Stage TM41(.INPUT(V3), .CIPHER_KEY(K8), .OUTPUT(V4));

// ROUND - 9

Sub_Bytes TM42(.CLK(CLK), .INPUT(V4), .OUTPUT(J1));

Shift_Rows TM43(.INPUT(J1), .OUTPUT(J2));

Mix_Columns TM44(.CLK(CLK), .INPUT(J2), .OUTPUT(J3));

Round_Key_Value TM45(.CLK(CLK), .PREVIOUS_KEY(K8), .Round_Constant(RCON9), .NEW_KEY(K9));

Input_Stage TM46(.INPUT(J3), .CIPHER_KEY(K9), .OUTPUT(J4));

// ROUND - 10

Sub_Bytes TM47(.CLK(CLK), .INPUT(J4), .OUTPUT(X1));

Shift_Rows TM48(.INPUT(X1), .OUTPUT(X2));

Round_Key_Value TM49(.CLK(CLK), .PREVIOUS_KEY(K9), .Round_Constant(RCON10), .NEW_KEY(K10));

Input_Stage TM50(.INPUT(X2), .CIPHER_KEY(K10), .OUTPUT(ENCRYPTED_DATA));


endmodule