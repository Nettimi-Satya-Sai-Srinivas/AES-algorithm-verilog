module Round_Key_Value(
    input CLK,
    input [0:255] PK,
    input [0:31] RC,
    output [0:127] NK
    );

wire [0:31] W_0, W_1, W_2, W_3, W_7;

wire [0:31] OUT1, OUT2, OUT3, OUT4;

assign W_0 = PK[0:31];
assign W_1 = PK[32:63];
assign W_2 = PK[64:95];
assign W_3 = PK[96:127];
assign W_7 = PK[224:255];

Rot_Word RW_A(.INPUT(W_7), .OUTPUT(OUT1));
Sub_Word SW_B(.CLK(CLK), .INPUT(OUT1), .OUTPUT(OUT2));

assign OUT3 = (OUT2 ^ RC);

assign NK[0:31] = (OUT3 ^ W_0);
assign NK[32:63] = (NK[0:31] ^ W_1);
assign NK[64:95] = (NK[32:63] ^ W_2);
assign NK[96:127] = (NK[64:95] ^ W_3);

endmodule