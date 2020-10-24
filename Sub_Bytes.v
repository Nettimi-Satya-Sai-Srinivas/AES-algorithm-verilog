module Sub_Bytes(
	 input CLK,
    input [0:127] INPUT,
    output [0:127] OUTPUT
    );

ROM_S_BOX R0C0(.CLK(CLK), .Read_Enable(1'b1), .Read_Address({INPUT[0:7]}), .Read_Data({OUTPUT[0:7]}));
ROM_S_BOX R1C0(.CLK(CLK), .Read_Enable(1'b1), .Read_Address({INPUT[8:15]}), .Read_Data({OUTPUT[8:15]}));
ROM_S_BOX R2C0(.CLK(CLK), .Read_Enable(1'b1), .Read_Address({INPUT[16:23]}), .Read_Data({OUTPUT[16:23]}));
ROM_S_BOX R3C0(.CLK(CLK), .Read_Enable(1'b1), .Read_Address({INPUT[24:31]}), .Read_Data({OUTPUT[24:31]}));

ROM_S_BOX R0C1(.CLK(CLK), .Read_Enable(1'b1), .Read_Address({INPUT[32:39]}), .Read_Data({OUTPUT[32:39]}));
ROM_S_BOX R1C1(.CLK(CLK), .Read_Enable(1'b1), .Read_Address({INPUT[40:47]}), .Read_Data({OUTPUT[40:47]}));
ROM_S_BOX R2C1(.CLK(CLK), .Read_Enable(1'b1), .Read_Address({INPUT[48:55]}), .Read_Data({OUTPUT[48:55]}));
ROM_S_BOX R3C1(.CLK(CLK), .Read_Enable(1'b1), .Read_Address({INPUT[56:63]}), .Read_Data({OUTPUT[56:63]}));

ROM_S_BOX R0C2(.CLK(CLK), .Read_Enable(1'b1), .Read_Address({INPUT[64:71]}), .Read_Data({OUTPUT[64:71]}));
ROM_S_BOX R1C2(.CLK(CLK), .Read_Enable(1'b1), .Read_Address({INPUT[72:79]}), .Read_Data({OUTPUT[72:79]}));
ROM_S_BOX R2C2(.CLK(CLK), .Read_Enable(1'b1), .Read_Address({INPUT[80:87]}), .Read_Data({OUTPUT[80:87]}));
ROM_S_BOX R3C2(.CLK(CLK), .Read_Enable(1'b1), .Read_Address({INPUT[88:95]}), .Read_Data({OUTPUT[88:95]}));

ROM_S_BOX R0C3(.CLK(CLK), .Read_Enable(1'b1), .Read_Address({INPUT[96:103]}), .Read_Data({OUTPUT[96:103]}));
ROM_S_BOX R1C3(.CLK(CLK), .Read_Enable(1'b1), .Read_Address({INPUT[104:111]}), .Read_Data({OUTPUT[104:111]}));
ROM_S_BOX R2C3(.CLK(CLK), .Read_Enable(1'b1), .Read_Address({INPUT[112:119]}), .Read_Data({OUTPUT[112:119]}));
ROM_S_BOX R3C3(.CLK(CLK), .Read_Enable(1'b1), .Read_Address({INPUT[120:127]}), .Read_Data({OUTPUT[120:127]}));

endmodule