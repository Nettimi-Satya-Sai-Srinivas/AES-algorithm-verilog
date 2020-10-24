module Sub_Word(
	 input CLK,
    input [0:31] INPUT,
    output [0:31] OUTPUT
    );

ROM_S_BOX SW1(.CLK(CLK), .Read_Enable(1'b1), .Read_Address({INPUT[0:7]}), .Read_Data({OUTPUT[0:7]}));
ROM_S_BOX SW2(.CLK(CLK), .Read_Enable(1'b1), .Read_Address({INPUT[8:15]}), .Read_Data({OUTPUT[8:15]}));
ROM_S_BOX SW3(.CLK(CLK), .Read_Enable(1'b1), .Read_Address({INPUT[16:23]}), .Read_Data({OUTPUT[16:23]}));
ROM_S_BOX SW4(.CLK(CLK), .Read_Enable(1'b1), .Read_Address({INPUT[24:31]}), .Read_Data({OUTPUT[24:31]}));

endmodule