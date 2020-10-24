module Shift_Rows(
    input [0:127] INPUT,
    output [0:127] OUTPUT
    );

wire [7:0] W0, W1, W2, W3, W4, W5, W6, W7, W8, W9, W10, W11, W12, W13, W14, W15;

assign W0 = INPUT[0:7];
assign W1 = INPUT[8:15];
assign W2 = INPUT[16:23];
assign W3 = INPUT[24:31];

assign W4 = INPUT[32:39];
assign W5 = INPUT[40:47];
assign W6 = INPUT[48:55];
assign W7 = INPUT[56:63];

assign W8 = INPUT[64:71];
assign W9 = INPUT[72:79];
assign W10 = INPUT[80:87];
assign W11 = INPUT[88:95];

assign W12 = INPUT[96:103];
assign W13 = INPUT[104:111];
assign W14 = INPUT[112:119];
assign W15 = INPUT[120:127];

assign OUTPUT = {W0,W5,W10,W15,W4,W9,W14,W3,W8,W13,W2,W7,W12,W1,W6,W11};

endmodule