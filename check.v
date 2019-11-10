`define lw 2'b11
`define sw 2'b10
`define add 2'b01
`define noop 2'b00

`define r1 3'b001
`define r2 3'b010
`define r3 3'b011
`define r4 3'b100
`define r5 3'b101
`define r6 3'b110
`define r7 3'b111
 
module check(clk,instrMem,hazardMem,size)
	
	input clk,instrMem;
	output hazardMem,size;

	reg [7:0] instrMem[7:0];
	integer [5:0] hazardMem[7:0];	//integer-------2bitx8
	wire [1:0] opc[7:0]; 		//reg0
	wire [2:0] rs[7:0];			//reg1
	wire [2:0] rd[7:0];			//reg2

	integer size = $size(hazardMem);

	for(i=0;i<$size(instrMem);i++) 
	begin
		opc[i] = instrMem[7:6];		
	end

	for(i=0;i<$size(instrMem);i++) 
	begin
		if(opc[i] == sw)
		begin
			rs[i] = instrMem[2:0];
		end
		else begin
			rs[i] = instrMem[5:3];
		end
	end

	for(i=0;i<$size(instrMem);i++) 
	begin
		if(opc[i] == sw)
		begin
			rd[i] = instrMem[2:0];
		end
		else begin
			rd[i] = instrMem[5:3];
		end
	end

	for(i=0;i<$size(instrMem) - 2;i++) 
	begin
		
		if(rd[i] == rs[i+1])
		begin
			hazardMem.push_back({i,i+1});
		end

		if(rd[i] == rs[i+2] && opc[i] == add)
		begin
			hazardMem.push_back({i,i+2});
		end

	end

	if(rd[instrMem[$size(instrMem) - 2] == instrMem[$size(instrMem)])
	begin
		hazardMem.push_back({$size(instrMem)-1,$size(instrMem)});
	end


endmodule