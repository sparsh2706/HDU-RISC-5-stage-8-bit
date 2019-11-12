`timescale 1 ps / 100 fs

// **************** This is Not Connected right now ****************************************

module hazard(btn1,btn2,btn3,btn4);
	
	input btn1,btn2,btn3,btn4;

	always @(*)
	begin
		case ({btn1,btn2,btn3,btn4})
		btn1: 
			inputMode I_Fetch (instr,instrMem);
		btn2:
			checkMode I_check (instrMem,hazardMem);
		btn3:
			displayMode I_display (hazardMem);
		btn4:
			resetMode I_reset (instrMem,hazardMem);
	end
	
endmodule