module Round_Key_Value_192_BIT(
    input CLK,
    input [0:191] PREVIOUS_KEY,
    input [0:31] Round_Constant,
    output [0:191] NEW_KEY
    );

wire [0:31] W0, W1, W2, W3, W4, W5;

wire [0:31] OUT_1, OUT_2, OUT_3;

assign W0 = PREVIOUS_KEY[0:31];
assign W1 = PREVIOUS_KEY[32:63];
assign W2 = PREVIOUS_KEY[64:95];
assign W3 = PREVIOUS_KEY[96:127];
assign W4 = PREVIOUS_KEY[128:159];
assign W5 = PREVIOUS_KEY[160:191];

Rot_Word RW1(.INPUT(W5), .OUTPUT(OUT_1));
Sub_Word SW1(.CLK(CLK), .INPUT(OUT_1), .OUTPUT(OUT_2));

assign OUT_3 = (OUT_2 ^ Round_Constant);

assign NEW_KEY[0:31] = (OUT_3 ^ W0);
assign NEW_KEY[32:63] = (NEW_KEY[0:31] ^ W1);
assign NEW_KEY[64:95] = (NEW_KEY[32:63] ^ W2);
assign NEW_KEY[96:127] = (NEW_KEY[64:95] ^ W3);
assign NEW_KEY[128:159] = (NEW_KEY[96:127] ^ W4);
assign NEW_KEY[160:191] = (NEW_KEY[128:159] ^ W5);

endmodule