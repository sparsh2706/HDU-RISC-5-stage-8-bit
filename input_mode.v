module inp(input_val,instrMem);
	input [7:0] input_val;
	output [7:0] instrMem[7:0];

	wire but_inp;
	reg [7:0] instrMem[7:0];

	integer inp_num;
	assign inp_num = 0;
	always @(but_inp) begin
		assign instrMem[inp_num] = input_val;
		assign inp_num = inp_num + 1;
	end

endmodule
