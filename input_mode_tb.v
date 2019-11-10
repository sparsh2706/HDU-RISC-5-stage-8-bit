module inp_tb()

	 reg [7:0] num;
	 reg [7:0] ret[7:0];

	 inp #(.WIDTH(8)) DUT (.num(num),.instrMem(instrMem));

	 initial begin
	 	num = 8'b10001000;
	 	#1000
	 	num = 8'b10001001;
	 	#1000
	 	num = 8'b10001010;
	 	#1000
	 	num = 8'b10001100;
	 	#1000
	 	num = 8'b10010000;
	 	#1000
	 	num = 8'b10101000;
	 	#1000
	 	num = 8'b10001001;
	 	#1000
	 	num = 8'b11111111;
	 	$finish;
	 end

endmodule