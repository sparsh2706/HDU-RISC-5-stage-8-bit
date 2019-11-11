`define lw 2'b11
`define sw 2'b10
`define add 2'b01
`define noop 2'b00

`define r0 3'b000
`define r1 3'b001
`define r2 3'b010
`define r3 3'b011
`define r4 3'b100
`define r5 3'b101
`define r6 3'b110
`define r7 3'b111
module inp(input_val,instrMemBits,but_inp);
	input [7:0] input_val;
	input but_inp;
	output reg [63:0] instrMemBits;

	always @(but_inp) begin
		instrMemBits = {instrMemBits,input_val};
		$display("Instruction bits till now are : %b",instrMemBits);
	end

endmodule

module check(instrMemBits,hazardMemBits);
	
	input instrMemBits;
	output reg [63:0] hazardMemBits;

	reg slicedbits;
	reg [7:0] instrMem[7:0];
	reg [1:0] opc[7:0]; 		//reg0
	reg [2:0] rs[7:0];			//reg1
	reg [2:0] rd[7:0];			//reg2

	integer k = 63;
	integer i;
	reg assigned;

	initial
	begin
		// slicedbits = instrMemBits[63:56];
		instrMem[0] <= instrMemBits[63:56];
		instrMem[1] <= instrMemBits[55:48];
		instrMem[2] <= instrMemBits[47:40];
		instrMem[3] <= instrMemBits[39:32];
		instrMem[4] <= instrMemBits[31:24];
		instrMem[5] <= instrMemBits[23:16];
		instrMem[6] <= instrMemBits[15:8];
		instrMem[7] <= instrMemBits[7:0];
	end

	always @(*)
	begin
		for(i=0;i<$size(instrMem);i = i + 1) 
		begin
			opc[i] = instrMem[7:6];		
		end

		for(i=0;i<$size(instrMem);i = i + 1) 
		begin
			if(opc[i] == noop)
			begin
				rs[i] = r1;
			end
			else if(opc[i] == sw)
			begin
				rs[i] = instrMem[2:0];
			end
			else begin
				rs[i] = instrMem[5:3];
			end
		end

		for(i=0;i<$size(instrMem);i = i + 1) 
		begin
			if(opc[i] == sw)
			begin
				rd[i] = instrMem[2:0];
			end
			else begin
				rd[i] = instrMem[5:3];
			end
		end

		for(i=0;i<$size(instrMem) - 2;i = i + 1) 
		begin
			
			if(opc[i] != noop)
			begin		
				if(rd[i] == rs[i+1])
				begin
					assigned = i;
					hazardMemBits = {hazardMemBits,assigned,assigned+1,3'b01};
				end

				if(rd[i] == rs[i+2] && opc[i] == add)
				begin
					assigned = i;
					hazardMemBits = {hazardMemBits,assigned,assigned+2,3'b01};
				end
			end

		end

		if(opc[$size(instrMem)] !=  noop)
		begin
			if(rd[instrMem[$size(instrMem) - 2]] == rs[instrMem[$size(instrMem) - 1]])
			begin
				assigned = $size(instrMem);
				hazardMemBits = {hazardMemBits,assigned-2,assigned-1,3'b01};	
			end
		end
	end

	// integer size = $bits(hazardMem);

endmodule