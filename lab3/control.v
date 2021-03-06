`timescale 1ns/10ps
module control (instruct, Reg2Loc, Branch, MemRead, 
				MemtoReg, ALUOp, MemWrite, ALUSrc, RegWrite, UncondB, B);

	input [10:0] instruct;

	output reg RegWrite, Reg2Loc, Branch, MemWrite, 
				MemtoReg, MemRead, UncondB, B;
	output reg [1:0] ALUOp;
	output reg  [2:0] ALUSrc;

	wire [5:0] temp;
	wire[7:0] tin0;
	wire [5:0] ninst;
	wire [3:0] format;

	//B, B.LT, ADDI, ADDS, CBZ, LDUR, STUR, SUBS, LSL, LSR, MUL
	//I-format: ADDI
	//R-format: ADDS, SUBS, MUL, LSL, LSR
	//D-foramt: STUR, LDUR, 
	//CB-format: CBZ
	//B-format: B, B.LT

	always @(*) begin
		if (instruct >= 160 && instruct <= 191) begin //B
			Reg2Loc = 1'bx;
			ALUSrc = 3'b001;
			MemtoReg = 1'bx;
			RegWrite = 0;
			MemRead = 1'bx;
			MemWrite = 0;
			Branch = 1;
			ALUOp = 2'b00;
			UncondB = 1;
			B = 0;
		end
		else if (instruct >= 672 && instruct <= 679) begin //B.LT
			Reg2Loc = 1'bx;
			ALUSrc = 3'b000;
			MemtoReg = 1'bx;
			RegWrite = 0;
			MemRead = 1'bx;
			MemWrite = 0;
			Branch = 1;
			ALUOp = 2'b00;
			UncondB = 0;
			B = 1;
		end
		else if (instruct == 1984) begin //STUR
			Reg2Loc = 1;
			ALUSrc = 3'b100; // 100 --> 010
			MemtoReg = 0;
			RegWrite = 0;
			MemRead = 0;
			MemWrite = 1;
			Branch = 0;
			ALUOp = 2'b10;
			UncondB = 1'bx;
		end
		else if (instruct == 1986) begin //LDUR
			Reg2Loc = 1'b0;
			ALUSrc = 3'b100; //100 --> 010
			MemtoReg = 1;
			RegWrite = 1;
			MemRead = 1;
			MemWrite = 0;
			Branch = 0;
			ALUOp = 2'b10;
			UncondB = 1'bx;
		end
		else if (instruct >= 1440 && instruct <= 1447) begin //CBZ
			Reg2Loc = 1;
			ALUSrc = 3'b000;
			MemtoReg = 1'bx;
			RegWrite = 0;
			MemRead = 0;
			MemWrite = 0;
			Branch = 1;
			ALUOp = 2'b00;
			UncondB = 0;
			B = 0;
		end
		else if (instruct >= 1160 && instruct <= 1161) begin // ADDI
			Reg2Loc = 1'b1;
			ALUSrc = 3'b010;
			MemtoReg = 0;
			RegWrite = 1;
			MemRead = 0;
			MemWrite = 0;
			Branch = 0;
			ALUOp = 2'b10;
			UncondB = 1'bx;
		end
		else if (instruct == 1690) begin //LSR
			Reg2Loc = 1;
			ALUSrc = 3'b000;
			MemtoReg = 0;
			RegWrite = 1;
			MemRead = 0;
			MemWrite = 0;
			Branch = 0;
			ALUOp = 2'b10;
			UncondB = 1'bx;
		end
		else if (instruct == 1691) begin //LSL
			Reg2Loc = 1;
			ALUSrc = 3'b000;
			MemtoReg = 0;
			RegWrite = 1;
			MemRead = 0;
			MemWrite = 0;
			Branch = 0;
			ALUOp = 2'b10;
			UncondB = 1'bx;
		end
		else if (instruct == 1880) begin //SUBS
			Reg2Loc = 0;
			ALUSrc = 0;
			MemtoReg = 0;
			RegWrite = 1;
			MemRead = 0;
			MemWrite = 0;
			Branch = 0;
			ALUOp = 2'b10;
			UncondB = 1'bx;
		end
		else if (instruct == 1368) begin //ADDS
			Reg2Loc = 0;
			ALUSrc = 0;
			MemtoReg = 0;
			RegWrite = 1;
			MemRead = 0;
			MemWrite = 0;
			Branch = 0;
			ALUOp = 2'b10;
			UncondB = 1'bx;
		end
		else begin //MUL
			Reg2Loc = 0;
			ALUSrc = 0;
			MemtoReg = 0;
			RegWrite = 1;
			MemRead = 0;
			MemWrite = 0;
			Branch = 0;
			ALUOp = 2'b11;
			UncondB = 1'bx;
		end
	end
endmodule