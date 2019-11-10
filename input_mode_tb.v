module inp_tb();

	 reg [7:0] input_val;
	 reg [7:0] instrMem[7:0];

	 inp testing (.input_val(input_val),.instrMem(instrMem));

	 initial begin
	 	input_val = 8'b10001000;
	 	#1000
	 	input_val = 8'b10001001;
	 	#1000
	 	input_val = 8'b10001010;
	 	#1000
	 	input_val = 8'b10001100;
	 	#1000
	 	input_val = 8'b10010000;
	 	#1000
	 	input_val = 8'b10101000;
	 	#1000
	 	input_val = 8'b10001001;
	 	#1000
	 	input_val = 8'b11111111;
	 	$finish;
	 end

endmodule