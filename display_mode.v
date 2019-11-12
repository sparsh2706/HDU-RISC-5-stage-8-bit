module disp(hazardMem);

	// input clk;
	// input hazardMem[1:0][7:0];
	// output avail;
	// integer avail;
	// integer r1,r2;
	// integer clk_num;
	// clk_num = 0;
	// always @(posedge clk) begin
	// 	$display("%b %b",hazardMem[0][clk_num],hazardMem[1][clk_num]);
	// 	assign clk_num = clk_num+1;
	// end

	input wire [63:0] hazardMem; //64 bit all error codes ----- to be flattened

	//wire hazardMem;

	reg [2:0] ob[1:0];	//flattening
	reg [1:0] sh;
	wire i;
	always @(*) begin
//**********************************error decode**************************
	
		ob[1] =  hazardMem[103:101];
		ob[0] =  hazardMem[100:98];
		if(ob[1] != ob[0]) begin
			$display("%b %b RAW",ob[0],ob[1]);
		end

		ob[1] =  hazardMem[95:93];
		ob[0] =  hazardMem[92:90];
		if(ob[1] != ob[0]) begin
			$display("%b %b RAW",ob[0],ob[1]);
		end

		ob[1] =  hazardMem[87:85];
		ob[0] =  hazardMem[84:82];
		if(ob[1] != ob[0]) begin
			$display("%b %b RAW",ob[0],ob[1]);
		end

		ob[1] =  hazardMem[79:77];
		ob[0] =  hazardMem[76:74];
		if(ob[1] != ob[0]) begin
			$display("%b %b RAW",ob[0],ob[1]);
		end

		ob[1] =  hazardMem[71:69];
		ob[0] =  hazardMem[68:66];
		if(ob[1] != ob[0]) begin
			$display("%b %b RAW",ob[0],ob[1]);
		end
		
		ob[1] =  hazardMem[63:61];
		ob[0] =  hazardMem[60:58];
		if(ob[1] != ob[0]) begin
			$display("%b %b RAW",ob[0],ob[1]);
		end
			
		ob[1] =  hazardMem[55:53];
		ob[0] =  hazardMem[52:50];
		if(ob[1] != ob[0]) begin
			$display("%d %d RAW",ob[0],ob[1]);
		end

		ob[1] =  hazardMem[47:45];
		ob[0] =  hazardMem[44:42];
		if(ob[1] != ob[0]) begin
			$display("%d %d RAW",ob[0],ob[1]);
		end

		ob[1] =  hazardMem[39:37];
		ob[0] =  hazardMem[36:34];
		if(ob[1] != ob[0]) begin
			$display("%d %d RAW",ob[0],ob[1]);
		end

		ob[1] =  hazardMem[31:29];
		ob[0] =  hazardMem[29:27];
		if(ob[1] != ob[0]) begin
			$display("%d %d RAW",ob[0],ob[1]);
		end

		ob[1] =  hazardMem[23:21];
		ob[0] =  hazardMem[20:18];
		if(ob[1] != ob[0]) begin
			$display("%d %d RAW",ob[0],ob[1]);
		end

		ob[1] =  hazardMem[15:13];
		ob[0] =  hazardMem[12:10];
		if(ob[1] != ob[0]) begin
			$display("%d %d RAW",ob[0],ob[1]);
		end

		ob[1] =  hazardMem[7:5];
		ob[0] =  hazardMem[4:2];
		if(ob[1] != ob[0]) begin
			$display("%d %d RAW",ob[0],ob[1]);
		end

		// poss[4] =  hazardMem[39:32];
		// poss[3] =  hazardMem[31:24];
		// poss[2] =  hazardMem[23:16];
		// poss[1] =  hazardMem[15:8];
		// poss[0] =  hazardMem[7:0];	
	end

	// integer i;
	// initial begin
	// 	i = pos[0][63:61];
	// 	$display("%b RAW", i);	
	// end
	
	


endmodule