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

	assign temp = instruct[10:5];

	not  (ninst[0], temp[0]);
	not (ninst[1], temp[1]);
	not (ninst[2], temp[2]);
	not   (ninst[3], temp[3]);
	not   (ninst[4], temp[4]);
	not   (ninst[5], temp[5]);

	//combining Op codes from instruction set
	and   (tin0[0], temp[0], temp[1], temp[2]);
	and   (tin0[1], temp[3], temp[4], temp[5]);
	and   (tin0[2], temp[5], temp[1], temp[0]);
	nand   (tin0[3], temp[4], temp[3], temp[2]);
	and   (tin0[4], temp[5], temp[3], temp[1], temp[0]);
	nand   (tin0[5], temp[4], temp[2]);
	nand   (tin0[6], temp[5], temp[4], temp[3]);
	nand   (tin0[7], temp[0], temp[1], ninst[2]);

	nand   (format[0], tin0[0], tin0[1]);
	and   (format[1], tin0[2], tin0[3]);
	and   (format[2], tin0[4], tin0[5]);	
	and   (format[3], tin0[6], tin0[7]);

	//assigning control paths
	assign Reg2Loc = format[0];
	or   (ALUSrc, format[1], format[2]);
	assign MemtoReg = format[1];
	or   (RegWrite, format[0], format[1]);
	assign MemRead = format[1];
	assign MemWrite = format[2];
	assign Branch = format[3];
	assign ALUOp = {format[1], format[0]};
endmodule