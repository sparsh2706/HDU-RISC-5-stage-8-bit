module inp_tb();

	 reg [7:0] input_val;
	 reg but_inp;
	 wire [63:0] instrMemBits;
	 wire [103:0] hazardMemBits;

	check Checking (.instrMemBits(instrMemBits),.hazardMemBits(hazardMemBits),.input_val(input_val),.but_inp(but_inp));

	// *************** Change the value of input_val to enter the Custom Input ******************************

	 initial begin

	 	but_inp = 1;

	 	input_val = 8'b11001010;
	 	
	 	but_inp = 0;
	 	#1000
	 	
	 	input_val = 8'b11011100;
	 	
	 	but_inp = 1;
	 	#1000
	 	
	 	input_val = 8'b01011001;
	 	
	 	but_inp = 0;
	 	#1000
	 	
	 	input_val = 8'b10011110;
	 	
	 	but_inp = 1;
	 	#1000
	 	
	 	input_val = 8'b01011110;
	 	
	 	but_inp = 0;
	 	#1000
	 	
	 	input_val = 8'b10111011;
	 	
	 	but_inp = 1;
	 	#1000
	 	
	 	input_val = 8'b11001011;
	 	
	 	but_inp = 0;
	 	#1000
	 	
	 	input_val = 8'b01011111;
	 	
	 	but_inp = 1;
	 	#1000

	 	$finish;
	 end

endmodule