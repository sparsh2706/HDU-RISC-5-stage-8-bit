module inp(input_val,instrMem,but_inp);
	input [7:0] input_val;
	input but_inp;
	output reg [63:0] instrMem;

	always @(but_inp) begin
		instrMem = {instrMem,input_val};
		$display("Instruction bits till now are : %b",instrMem);
	end

endmodule


	// reg inp_num;
	
	// initial
	// begin
	// 	assign inp_num = 3'b000;
	// end
	
	// always @(but_inp) begin
	// 	assign instr[inp_num] = input_val;
	// 	$display("%b",instr[inp_num]);
	// 	assign inp_num = inp_num + 1;
	// end

	// integer i;
	// initial
	// begin
	// 	for(i=0;i<$size(instr);i = i + 1)
	// 	begin
	// 		assign instrMem = {instrMem,instr[i]};
	// 	end
	// end

