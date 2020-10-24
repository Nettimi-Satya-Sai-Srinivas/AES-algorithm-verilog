module AES_Encryption_192_TB;

	// Inputs
	reg CLK;
	reg [0:127] DATA;
	reg [0:191] CIPHER_KEY;

	// Outputs
	wire [0:127] ENCRYPTED_DATA;

	// Instantiate the Unit Under Test (UUT)
	AES_Encryption_192 uut (
		.CLK(CLK), 
		.DATA(DATA), 
		.CIPHER_KEY(CIPHER_KEY), 
		.ENCRYPTED_DATA(ENCRYPTED_DATA)
	);

	initial begin
		// Initialize Inputs
		CLK = 0;
		DATA = 0;
		CIPHER_KEY = 0;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here

	end
	
	always #10 CLK = ~CLK;
	
	initial begin
	
	@(negedge CLK) DATA = 128'h00_11_22_33_44_55_66_77_88_99_AA_BB_CC_DD_EE_FF;
		       CIPHER_KEY = 192'h00_01_02_03_04_05_06_07_08_09_0A_0B_0C_0D_0E_0F_10_11_12_13_14_15_16_17;
	
	end
      
endmodule