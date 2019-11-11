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
	
	input wire [63:0] instrMemBits;
	output reg [63:0] hazardMemBits;

	reg [7:0] instrMem[7:0];
	reg [1:0] opc[7:0]; 		//reg0
	reg [2:0] rs[7:0];			//reg1
	reg [2:0] rd[7:0];			//reg2

	integer k = 63;
	integer i;
	reg assigned;

	// initial
	// begin
	// 	instrMem[0][7:0] = instrMemBits[63:56];
	// 	instrMem[1][7:0] = instrMemBits[55:48];
	// 	instrMem[2][7:0] = instrMemBits[47:40];
	// 	instrMem[3][7:0] = instrMemBits[39:32];
	// 	instrMem[4][7:0] = instrMemBits[31:24];
	// 	instrMem[5][7:0] = instrMemBits[23:16];
	// 	instrMem[6][7:0] = instrMemBits[15:8];
	// 	instrMem[7][7:0] = instrMemBits[7:0];
	// end

	always @(*)
	begin
// ************************************************ Defining the OpCodes ***************************************************
		
		opc[0] = instrMemBits[63:62];
		opc[1] = instrMemBits[55:54];
		opc[2] = instrMemBits[47:46];
		opc[3] = instrMemBits[39:38];
		opc[4] = instrMemBits[31:30];
		opc[5] = instrMemBits[23:22];
		opc[6] = instrMemBits[15:14];
		opc[7] = instrMemBits[7:6];

// ********************************************** Source Register ***********************************************************

		if(opc[0] != 2'b10)
		begin
			rs[0] = instrMemBits[61:59];
		end
		else begin
			rs[0] = instrMemBits[58:56];
		end

		if(opc[1] != 2'b10)
		begin
			rs[1] = instrMemBits[53:51];
		end
		else begin
			rs[1] = instrMemBits[50:48];
		end

		if(opc[2] != 2'b10)
		begin
			rs[2] = instrMemBits[45:43];
		end
		else begin
			rs[2] = instrMemBits[42:40];
		end

		if(opc[3] != 2'b10)
		begin
			rs[3] = instrMemBits[37:35];
		end
		else begin
			rs[3] = instrMemBits[34:32];
		end

		if(opc[4] != 2'b10)
		begin
			rs[4] = instrMemBits[29:27];
		end
		else begin
			rs[4] = instrMemBits[26:24];
		end

		if(opc[5] != 2'b10)
		begin
			rs[5] = instrMemBits[21:19];
		end
		else begin
			rs[5] = instrMemBits[18:16];
		end

		if(opc[6] != 2'b10)
		begin
			rs[6] = instrMemBits[13:11];
		end
		else begin
			rs[6] = instrMemBits[10:8];
		end

		if(opc[7] != 2'b10)
		begin
			rs[7] = instrMemBits[5:3];
		end
		else begin
			rs[7] = instrMemBits[2:0];
		end

// ********************************************** Destination Register *****************************************************

		if(opc[0] == 2'b10)
		begin
			rd[0] = instrMemBits[61:59];
		end
		else begin
			rd[0] = instrMemBits[58:56];
		end

		if(opc[1] == 2'b10)
		begin
			rd[1] = instrMemBits[53:51];
		end
		else begin
			rd[1] = instrMemBits[50:48];
		end

		if(opc[2] == 2'b10)
		begin
			rd[2] = instrMemBits[45:43];
		end
		else begin
			rd[2] = instrMemBits[42:40];
		end

		if(opc[3] == 2'b10)
		begin
			rd[3] = instrMemBits[37:35];
		end
		else begin
			rd[3] = instrMemBits[34:32];
		end

		if(opc[4] == 2'b10)
		begin
			rd[4] = instrMemBits[29:27];
		end
		else begin
			rd[4] = instrMemBits[26:24];
		end

		if(opc[5] == 2'b10)
		begin
			rd[5] = instrMemBits[21:19];
		end
		else begin
			rd[5] = instrMemBits[18:16];
		end

		if(opc[6] == 2'b10)
		begin
			rd[6] = instrMemBits[13:11];
		end
		else begin
			rd[6] = instrMemBits[10:8];
		end

		if(opc[7] == 2'b10)
		begin
			rd[7] = instrMemBits[5:3];
		end
		else begin
			rd[7] = instrMemBits[2:0];
		end

// ********************************************************************************************************************


		for(i = 3'b000;i < 3'b110;i = i + 1) 
		begin
			
			if(opc[i] != 2'b00)
			begin		
				if(rd[i] == rs[i+1])
				begin
					// assigned = 3'b000 + i;
					hazardMemBits = {hazardMemBits,i,i+3'b001,2'b01};
				end

				if(rd[i] == rs[i+2] && opc[i] == 2'b01)
				begin
					// assigned = 3'b000 + i;
					hazardMemBits = {hazardMemBits,i,i+3'b010,2'b01};
				end
			end

		end

		if(opc[6] !=  2'b00)
		begin
			if(rd[instrMem[6]] == rs[instrMem[7]])
			begin
				hazardMemBits = {hazardMemBits,3'b110,3'b111,2'b01};	
			end
		end
	end

endmodule


		// for(i=0;i<$size(instrMem);i = i + 1) 
		// begin
		// 	opc[i] = instrMem[i][7:6];		
		// end

		// for(i=0;i<$size(instrMem);i = i + 1) 
		// begin
		// 	if(opc[i] == noop)
		// 	begin
		// 		rs[i] = r1;
		// 	end
		// 	else if(opc[i] == sw)
		// 	begin
		// 		rs[i] = instrMem[i][2:0];
		// 	end
		// 	else begin
		// 		rs[i] = instrMem[i][5:3];
		// 	end
		// end

		// for(i=0;i<$size(instrMem);i = i + 1) 
		// begin
		// 	if(opc[i] == sw)
		// 	begin
		// 		rd[i] = instrMem[i][2:0];
		// 	end
		// 	else begin
		// 		rd[i] = instrMem[i][5:3];
		// 	end
		// end