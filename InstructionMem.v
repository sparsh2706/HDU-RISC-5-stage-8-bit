`timescale 1 ps / 100 fs
module InstructionMem(instruction,address);

input [7:0] address;
output [7:0] instruction;
reg [7:0]instrmem[1023:0]
reg [7:0] temp;

buf #1000 buf0(instruction[0],temp[0]),
	buf1(instructionp[1],temp[1]),
	buf2(instruction[2],temp[2]),
	buf3(instruction[3],temp[3]),
	buf4(instruction[4],temp[4]),
	buf5(instruction[5],temp[5]),
	buf6(instruction[6],temp[6]),
	buf7(instruction[7],temp[7])

always @(address)
begin
	temp = instrmem[address/4]
end

initial
begin
	$readmemb("instr.txt",instrmem);
end

endmodule

module instrmemstimulous();

reg [7:0] addr;
wire [7:0] instr;

InstructionMem instructionmemory(instr,addr);

initial
begin
	$monitor("Memory Address = %h Instruction = %b",addr,instr);
	addr = 8'd0;
	#10000 addr = 8'd4;
	#10000
	$finish;
end

endmodule