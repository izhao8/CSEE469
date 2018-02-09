`timescale 1ns/10ps
module control (instruct, Reg2Loc, Branch, MemRead, 
				MemtoReg, ALUOp, MemWrite, ALUSrc, RegWrite);

	input [10:0] instruct;

	output RegWrite, Reg2Loc, Branch, MemWrite, 
			MemtoReg, ALUSrc, MemRead;
	output [1:0] ALUOp;

	wire [5:0] temp;
	wire[7:0] tin0;
	wire [5:0] ninst;
	wire [3:0] format;

	//B, B.LT, ADDI, ADDS, CBZ, LDUR, STUR, SUBS, LSL, LSR, MUL

	always @(*) begin
		
	end
endmodule