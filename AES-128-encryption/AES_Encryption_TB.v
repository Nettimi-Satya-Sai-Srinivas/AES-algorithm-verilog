module AES_Encryption_TB;

	// Inputs
	reg CLK;
	reg [0:127] DATA;
	reg [0:127] CIPHER_KEY;

	// Outputs
	wire [0:127] ENCRYPTED_DATA;

	// Instantiate the Unit Under Test (UUT)
	AES_Encryption uut (
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
	
	@(negedge CLK) DATA = 128'h32_43_F6_A8_88_5A_30_8D_31_31_98_A2_E0_37_07_34;
		       CIPHER_KEY = 128'h2B_7E_15_16_28_AE_D2_A6_AB_F7_15_88_09_CF_4F_3C;
	
	end
      
endmodule