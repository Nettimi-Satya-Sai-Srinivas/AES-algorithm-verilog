module Round_Key_Value_256_BIT(
    input CLK,
    input [0:255] PREVIOUS_KEY,
    input [0:31] Round_Constant,
    output [0:255] NEW_KEY
    );

wire [0:31] W0, W1, W2, W3, W4, W5, W6, W7;

wire [0:31] OUT_1, OUT_2, OUT_3, OUT_4;

assign W0 = PREVIOUS_KEY[0:31];
assign W1 = PREVIOUS_KEY[32:63];
assign W2 = PREVIOUS_KEY[64:95];
assign W3 = PREVIOUS_KEY[96:127];
assign W4 = PREVIOUS_KEY[128:159];
assign W5 = PREVIOUS_KEY[160:191];
assign W6 = PREVIOUS_KEY[192:223];
assign W7 = PREVIOUS_KEY[224:255];

Rot_Word RW2(.INPUT(W7), .OUTPUT(OUT_1));
Sub_Word SW2(.CLK(CLK), .INPUT(OUT_1), .OUTPUT(OUT_2));

assign OUT_3 = (OUT_2 ^ Round_Constant);

assign NEW_KEY[0:31] = (OUT_3 ^ W0);
assign NEW_KEY[32:63] = (NEW_KEY[0:31] ^ W1);
assign NEW_KEY[64:95] = (NEW_KEY[32:63] ^ W2);
assign NEW_KEY[96:127] = (NEW_KEY[64:95] ^ W3);

Sub_Word SW21(.CLK(CLK), .INPUT({NEW_KEY[96:127]}), .OUTPUT(OUT_4));

assign NEW_KEY[128:159] = (OUT_4 ^ W4);
assign NEW_KEY[160:191] = (NEW_KEY[128:159] ^ W5);
assign NEW_KEY[192:223] = (NEW_KEY[160:191] ^ W6);
assign NEW_KEY[224:255] = (NEW_KEY[192:223] ^ W7);

endmodule