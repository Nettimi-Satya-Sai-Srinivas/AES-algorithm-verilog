module Multiply_By_11(
    input CLK,
    input Read_Enable,
    input [7:0] Read_Address,
    output reg [7:0] Read_Data
    );

wire [7:0] ROM [0:15][0:15];
reg [3:0] A1, A2;

assign ROM[0][0]  = 8'h00;
assign ROM[0][1]  = 8'h0B;
assign ROM[0][2]  = 8'h16;
assign ROM[0][3]  = 8'h1D;
assign ROM[0][4]  = 8'h2C;
assign ROM[0][5]  = 8'h27;
assign ROM[0][6]  = 8'h3A;
assign ROM[0][7]  = 8'h31;
assign ROM[0][8]  = 8'h58;
assign ROM[0][9]  = 8'h53;
assign ROM[0][10] = 8'h4E;
assign ROM[0][11] = 8'h45;
assign ROM[0][12] = 8'h74;
assign ROM[0][13] = 8'h7F;
assign ROM[0][14] = 8'h62;
assign ROM[0][15] = 8'h69;

assign ROM[1][0]  = 8'hB0;
assign ROM[1][1]  = 8'hBB;
assign ROM[1][2]  = 8'hA6;
assign ROM[1][3]  = 8'hAD;
assign ROM[1][4]  = 8'h9C;
assign ROM[1][5]  = 8'h97;
assign ROM[1][6]  = 8'h8A;
assign ROM[1][7]  = 8'h81;
assign ROM[1][8]  = 8'hE8;
assign ROM[1][9]  = 8'hE3;
assign ROM[1][10] = 8'hFE;
assign ROM[1][11] = 8'hF5;
assign ROM[1][12] = 8'hC4;
assign ROM[1][13] = 8'hCF;
assign ROM[1][14] = 8'hD2;
assign ROM[1][15] = 8'hD9;

assign ROM[2][0]  = 8'h7B;
assign ROM[2][1]  = 8'h70;
assign ROM[2][2]  = 8'h6D;
assign ROM[2][3]  = 8'h66;
assign ROM[2][4]  = 8'h57;
assign ROM[2][5]  = 8'h5C;
assign ROM[2][6]  = 8'h41;
assign ROM[2][7]  = 8'h4A;
assign ROM[2][8]  = 8'h23;
assign ROM[2][9]  = 8'h28;
assign ROM[2][10] = 8'h35;
assign ROM[2][11] = 8'h3E;
assign ROM[2][12] = 8'h0F;
assign ROM[2][13] = 8'h04;
assign ROM[2][14] = 8'h19;
assign ROM[2][15] = 8'h12;

assign ROM[3][0]  = 8'hCB;
assign ROM[3][1]  = 8'hC0;
assign ROM[3][2]  = 8'hDD;
assign ROM[3][3]  = 8'hD6;
assign ROM[3][4]  = 8'hE7;
assign ROM[3][5]  = 8'hEC;
assign ROM[3][6]  = 8'hF1;
assign ROM[3][7]  = 8'hFA;
assign ROM[3][8]  = 8'h93;
assign ROM[3][9]  = 8'h98;
assign ROM[3][10] = 8'h85;
assign ROM[3][11] = 8'h8E;
assign ROM[3][12] = 8'hBF;
assign ROM[3][13] = 8'hB4;
assign ROM[3][14] = 8'hA9;
assign ROM[3][15] = 8'hA2;

assign ROM[4][0]  = 8'hF6;
assign ROM[4][1]  = 8'hFD;
assign ROM[4][2]  = 8'hE0;
assign ROM[4][3]  = 8'hEB;
assign ROM[4][4]  = 8'hDA;
assign ROM[4][5]  = 8'hD1;
assign ROM[4][6]  = 8'hCC;
assign ROM[4][7]  = 8'hC7;
assign ROM[4][8]  = 8'hAE;
assign ROM[4][9]  = 8'hA5;
assign ROM[4][10] = 8'hB8;
assign ROM[4][11] = 8'hB3;
assign ROM[4][12] = 8'h82;
assign ROM[4][13] = 8'h89;
assign ROM[4][14] = 8'h94;
assign ROM[4][15] = 8'h9F;

assign ROM[5][0]  = 8'h46;
assign ROM[5][1]  = 8'h4D;
assign ROM[5][2]  = 8'h50;
assign ROM[5][3]  = 8'h5B;
assign ROM[5][4]  = 8'h6A;
assign ROM[5][5]  = 8'h61;
assign ROM[5][6]  = 8'h7C;
assign ROM[5][7]  = 8'h77;
assign ROM[5][8]  = 8'h1E;
assign ROM[5][9]  = 8'h15;
assign ROM[5][10] = 8'h08;
assign ROM[5][11] = 8'h03;
assign ROM[5][12] = 8'h32;
assign ROM[5][13] = 8'h39;
assign ROM[5][14] = 8'h24;
assign ROM[5][15] = 8'h2F;

assign ROM[6][0]  = 8'h8D;
assign ROM[6][1]  = 8'h86;
assign ROM[6][2]  = 8'h9B;
assign ROM[6][3]  = 8'h90;
assign ROM[6][4]  = 8'hA1;
assign ROM[6][5]  = 8'hAA;
assign ROM[6][6]  = 8'hB7;
assign ROM[6][7]  = 8'hBC;
assign ROM[6][8]  = 8'hD5;
assign ROM[6][9]  = 8'hDE;
assign ROM[6][10] = 8'hC3;
assign ROM[6][11] = 8'hC8;
assign ROM[6][12] = 8'hF9;
assign ROM[6][13] = 8'hF2;
assign ROM[6][14] = 8'hEF;
assign ROM[6][15] = 8'hE4;

assign ROM[7][0]  = 8'h3D;
assign ROM[7][1]  = 8'h36;
assign ROM[7][2]  = 8'h2B;
assign ROM[7][3]  = 8'h20;
assign ROM[7][4]  = 8'h11;
assign ROM[7][5]  = 8'h1A;
assign ROM[7][6]  = 8'h07;
assign ROM[7][7]  = 8'h0C;
assign ROM[7][8]  = 8'h65;
assign ROM[7][9]  = 8'h6E;
assign ROM[7][10] = 8'h73;
assign ROM[7][11] = 8'h78;
assign ROM[7][12] = 8'h49;
assign ROM[7][13] = 8'h42;
assign ROM[7][14] = 8'h5F;
assign ROM[7][15] = 8'h54;

assign ROM[8][0]  = 8'hF7;
assign ROM[8][1]  = 8'hFC;
assign ROM[8][2]  = 8'hE1;
assign ROM[8][3]  = 8'hEA;
assign ROM[8][4]  = 8'hDB;
assign ROM[8][5]  = 8'hD0;
assign ROM[8][6]  = 8'hCD;
assign ROM[8][7]  = 8'hC6;
assign ROM[8][8]  = 8'hAF;
assign ROM[8][9]  = 8'hA4;
assign ROM[8][10] = 8'hB9;
assign ROM[8][11] = 8'hB2;
assign ROM[8][12] = 8'h83;
assign ROM[8][13] = 8'h88;
assign ROM[8][14] = 8'h95;
assign ROM[8][15] = 8'h9E;

assign ROM[9][0]  = 8'h47;
assign ROM[9][1]  = 8'h4C;
assign ROM[9][2]  = 8'h51;
assign ROM[9][3]  = 8'h5A;
assign ROM[9][4]  = 8'h6B;
assign ROM[9][5]  = 8'h60;
assign ROM[9][6]  = 8'h7D;
assign ROM[9][7]  = 8'h76;
assign ROM[9][8]  = 8'h1F;
assign ROM[9][9]  = 8'h14;
assign ROM[9][10] = 8'h09;
assign ROM[9][11] = 8'h02;
assign ROM[9][12] = 8'h33;
assign ROM[9][13] = 8'h38;
assign ROM[9][14] = 8'h25;
assign ROM[9][15] = 8'h2E;

assign ROM[10][0]  = 8'h8C;
assign ROM[10][1]  = 8'h87;
assign ROM[10][2]  = 8'h9A;
assign ROM[10][3]  = 8'h91;
assign ROM[10][4]  = 8'hA0;
assign ROM[10][5]  = 8'hAB;
assign ROM[10][6]  = 8'hB6;
assign ROM[10][7]  = 8'hBD;
assign ROM[10][8]  = 8'hD4;
assign ROM[10][9]  = 8'hDF;
assign ROM[10][10] = 8'hC2;
assign ROM[10][11] = 8'hC9;
assign ROM[10][12] = 8'hF8;
assign ROM[10][13] = 8'hF3;
assign ROM[10][14] = 8'hEE;
assign ROM[10][15] = 8'hE5;

assign ROM[11][0]  = 8'h3C;
assign ROM[11][1]  = 8'h37;
assign ROM[11][2]  = 8'h2A;
assign ROM[11][3]  = 8'h21;
assign ROM[11][4]  = 8'h10;
assign ROM[11][5]  = 8'h1B;
assign ROM[11][6]  = 8'h06;
assign ROM[11][7]  = 8'h0D;
assign ROM[11][8]  = 8'h64;
assign ROM[11][9]  = 8'h6F;
assign ROM[11][10] = 8'h72;
assign ROM[11][11] = 8'h79;
assign ROM[11][12] = 8'h48;
assign ROM[11][13] = 8'h43;
assign ROM[11][14] = 8'h5E;
assign ROM[11][15] = 8'h55;

assign ROM[12][0]  = 8'h01;
assign ROM[12][1]  = 8'h0A;
assign ROM[12][2]  = 8'h17;
assign ROM[12][3]  = 8'h1C;
assign ROM[12][4]  = 8'h2D;
assign ROM[12][5]  = 8'h26;
assign ROM[12][6]  = 8'h3B;
assign ROM[12][7]  = 8'h30;
assign ROM[12][8]  = 8'h59;
assign ROM[12][9]  = 8'h52;
assign ROM[12][10] = 8'h4F;
assign ROM[12][11] = 8'h44;
assign ROM[12][12] = 8'h75;
assign ROM[12][13] = 8'h7E;
assign ROM[12][14] = 8'h63;
assign ROM[12][15] = 8'h68;

assign ROM[13][0]  = 8'hB1;
assign ROM[13][1]  = 8'hBA;
assign ROM[13][2]  = 8'hA7;
assign ROM[13][3]  = 8'hAC;
assign ROM[13][4]  = 8'h9D;
assign ROM[13][5]  = 8'h96;
assign ROM[13][6]  = 8'h8B;
assign ROM[13][7]  = 8'h80;
assign ROM[13][8]  = 8'hE9;
assign ROM[13][9]  = 8'hE2;
assign ROM[13][10] = 8'hFF;
assign ROM[13][11] = 8'hF4;
assign ROM[13][12] = 8'hC5;
assign ROM[13][13] = 8'hCE;
assign ROM[13][14] = 8'hD3;
assign ROM[13][15] = 8'hD8;

assign ROM[14][0]  = 8'h7A;
assign ROM[14][1]  = 8'h71;
assign ROM[14][2]  = 8'h6C;
assign ROM[14][3]  = 8'h67;
assign ROM[14][4]  = 8'h56;
assign ROM[14][5]  = 8'h5D;
assign ROM[14][6]  = 8'h40;
assign ROM[14][7]  = 8'h4B;
assign ROM[14][8]  = 8'h22;
assign ROM[14][9]  = 8'h29;
assign ROM[14][10] = 8'h34;
assign ROM[14][11] = 8'h3F;
assign ROM[14][12] = 8'h0E;
assign ROM[14][13] = 8'h05;
assign ROM[14][14] = 8'h18;
assign ROM[14][15] = 8'h13;

assign ROM[15][0]  = 8'hCA;
assign ROM[15][1]  = 8'hC1;
assign ROM[15][2]  = 8'hDC;
assign ROM[15][3]  = 8'hD7;
assign ROM[15][4]  = 8'hE6;
assign ROM[15][5]  = 8'hED;
assign ROM[15][6]  = 8'hF0;
assign ROM[15][7]  = 8'hFB;
assign ROM[15][8]  = 8'h92;
assign ROM[15][9]  = 8'h99;
assign ROM[15][10] = 8'h84;
assign ROM[15][11] = 8'h8F;
assign ROM[15][12] = 8'hBE;
assign ROM[15][13] = 8'hB5;
assign ROM[15][14] = 8'hA8;
assign ROM[15][15] = 8'hA3;

always@(posedge CLK)

if(Read_Enable) 
begin
A1 = Read_Address[7:4];
A2 = Read_Address[3:0];
Read_Data <= ROM[A1][A2];
end

else
Read_Data <= 8'h00;

endmodule