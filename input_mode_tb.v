module inp_tb();

	 reg [7:0] input_val;
	 reg but_inp;
	 reg but_check;
	 wire [63:0] instrMemBits;
	 wire [103:0] hazardMemBits;
	 integer i;

	// inp testing (.input_val(input_val),.instrMemBits(instrMemBits),.but_inp(but_inp));
	check Checking (.instrMemBits(instrMemBits),.hazardMemBits(hazardMemBits),.input_val(input_val),.but_inp(but_inp));

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
	 	input_val = 8'b00000000;
	 	but_inp = 0;
	 	#1000
	 	input_val = 8'b00000000;
	 	but_inp = 1;
	 	#1000
	 	input_val = 8'b00000000;
	 	but_inp = 0;
	 	#1000
	 	input_val = 8'b00000000;
	 	but_inp = 1;
	 	#1000
		// $display("Instruction bits Finally are : %b",(instrMemBits));	
		// but_check = 1;

		// $display("Hazard bits is: %b",hazardMemBits);	

	 	$finish;
	 end

endmodule