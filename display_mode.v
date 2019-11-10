module disp(hazardMem,clk,size);

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

	input size
	input hazardMem[size][1:0];
	integer size;

	for(i=0;i<$size(hazardMem);i++)
	begin
		$display("%b %b -- RAW",hazardMem[i][0],hazardMem[i][1]);
	end

endmodule
