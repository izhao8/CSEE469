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

	not #50 (ninst[0], temp[0]);
	not #50 (ninst[1], temp[1]);
	not #50 (ninst[2], temp[2]);
	not #50 (ninst[3], temp[3]);
	not #50 (ninst[4], temp[4]);
	not #50 (ninst[5], temp[5]);

	//combining Op codes from instruction set
	nand #50 (tin0[0], temp[0], temp[1], temp[2]);
	nand #50 (tin0[1], temp[3], temp[4], temp[5]);
	and #50 (tin0[2], temp[5], temp[1], temp[0]);
	nand #50 (tin0[3], temp[4], temp[3], temp[2]);
	and #50 (tin0[4], temp[5], temp[3], temp[1], temp[0]);
	nand #50 (tin0[5], temp[4], temp[2]);
	nand #50 (tin0[6], temp[5], temp[4], temp[3]);
	nand #50 (tin0[7], temp[0], temp[1], ninst[2]);

	and #50 (format[0], tin0[0], tin0[1]);
	and #50 (format[1], tin0[2], tin0[3]);
	and #50 (format[2], tin0[4], tin0[5]);	
	and #50 (format[3], tin0[6], tin0[7]);

	//assigning control paths
	assign Reg2Loc = format[0];
	or #50 (ALUSrc, format[1], format[2]);
	assign MemtoReg = format[1];
	or #50 (RegWrite, format[0], format[1]);
	assign MemRead = format[1];
	assign MemWrite = format[2];
	assign Branch = format[3];
	assign ALUOp = {format[1], format[0]};
endmodule