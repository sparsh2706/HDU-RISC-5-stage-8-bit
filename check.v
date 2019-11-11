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
 
module check(instrMemBits,hazardMem,size)
	
	input instrMemBits;
	output hazardMem,size;

	reg [7:0] instrMem[7:0];
	integer [7:0] hazardMem[];	//integer-------2bitx8
	wire [1:0] opc[7:0]; 		//reg0
	wire [2:0] rs[7:0];			//reg1
	wire [2:0] rd[7:0];			//reg2

	integer k = 63;
	integer i;
	for(i = 0;i<$bits(instrMemBits);i = i + 1)
	begin
		instrMem[i] <= instrMemBits[k:k-7];
		k <= k - 8;	
	end

	for(i=0;i<$size(instrMem);i = i + 1) 
	begin
		opc[i] = instrMem[7:6];		
	end

	for(i=0;i<$size(instrMem);i = i + 1) 
	begin
		if(opc[i] == sw)
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
	wire assigned;
	for(i=0;i<$size(instrMem) - 2;i = i + 1) 
	begin
		
		if(rd[i] == rs[i+1])
		begin
			assign assigned = i;
			hazardMem.push_back({assigned,assigned+1,3'b01});
		end

		if(rd[i] == rs[i+2] && opc[i] == add)
		begin
			assign assigned = i;
			hazardMem.push_back({assigned,assigned+2,3'b01});
		end

	end

	if(rd[instrMem[$size(instrMem) - 2] == instrMem[$size(instrMem)])
	begin
		assign assigned = $size(instrMem);
		hazardMem.push_back({assigned-1,assigned,3'b01});
	end

	integer size = $size(hazardMem);

endmodule