module test();

	reg [63:0]hazardMem;

	disp UUT (.hazardMem(hazardMem));

	initial
		begin
			hazardMem = 64'b0000000000000000000000000000000000000000000010010010100101001101  ;
		end
endmodule

