module inp_tb();

	 reg [7:0] input_val;
	 reg but_inp;
	 wire [63:0] instrMemBits;
	 wire [63:0] hazardMemBits;
	 integer i;

	 inp testing (.input_val(input_val),.instrMemBits(instrMemBits),.but_inp(but_inp));

	 initial begin
	 	but_inp = 1;
	 	input_val = 8'b10001000;
	 	but_inp = 0;
	 	#1000
	 	input_val = 8'b10001001;
	 	but_inp = 1;
	 	#1000
	 	input_val = 8'b10001010;
	 	but_inp = 0;
	 	#1000
	 	input_val = 8'b10001100;
	 	but_inp = 1;
	 	#1000
	 	input_val = 8'b10010000;
	 	but_inp = 0;
	 	#1000
	 	input_val = 8'b10101000;
	 	but_inp = 1;
	 	#1000
	 	input_val = 8'b10001001;
	 	but_inp = 0;
	 	#1000
	 	// input_val = 8'b11111111;
	 	// but_inp = 1;
	 	// #1000
		$display("Instruction bits Finally are : %d",$bits(instrMemBits));
		#1000
	 	$finish;
	 end

	 check Checking (.instrMemBits(instrMemBits),.hazardMemBits(hazardMemBits));

endmodule