module disp(hazardMem);

	input wire [104:0] hazardMem;

	reg [2:0] ob[1:0];	//flattening
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
	end
endmodule