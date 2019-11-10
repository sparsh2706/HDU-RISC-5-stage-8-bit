module inp(num,instrMem);
	input [7:0] num;
	output [7:0] instrMem[7:0];

	wire but_inp;
	reg [7:0] instrMem[7:0];

	integer inp_num;
	assign inp_num = 0;
	always @(but_inp) begin
		assign num = instrMem[inp_num];
	end

endmodule
