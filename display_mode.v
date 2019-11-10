module disp(hazardMem,clk,avail);

	input clk;
	input hazardMem[1:0][7:0];
	output avail;
	integer avail;
	integer r1,r2;
	integer clk_num;
	clk_num = 0;
	always @(posedge clk) begin
		$display("%b %b",hazardMem[0][clk_num],hazardMem[1][clk_num]);
		assign clk_num = clk_num+1;
	end

endmodule
