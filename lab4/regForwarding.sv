`timescale 1ns/10ps

module regIdIf(instruction, flush, write, PC, instruct, pc, clk);
	output reg [63:0] instruct;
	output reg [31:0] pc;
	
	input [63:0] instruction, PC;
	input flush, write, clk;
	
	always_ff @(posedge clk) begin
		if (flush)
			instruct <= 0;
		else	if (write) begin
			instruct <= instruction;
			pc <= PC;
		end
		else begin
			instruct <= instruct;
			pc <= pc;
		end
	end

endmodule


module regExId (WB, M, EX, A, B, ADDI,  Rd, Ao, Bo, 
					Rdout, addIO, clk, Rn, Rm, Rno, Rmo, wb, m, Reg2Loc,
					ALUOp, ALUSrc, OP, Opout);
	output [63:0] Ao, Bo, addIO; 
	output [4:0] Rdout, Rno, Rmo;
	output [1:0] wb;
	output [2:0] m;
	output [1:0] ALUOp;
	output [2:0] ALUSrc;
	output [10:0] Opout;
	output Reg2Loc;
	
	input [1:0] WB;
	input [2:0] M; 
	input [63:0] A, B, ADDI;
	input [10:0] OP; //instruction[31:21] --> Opout
	input [4:0] Rd, Rn, Rm; //instruction[4:0] --> Rdout
	input [5:0] EX; //[5:3] is ALUOp, [2:1] is ALUSrc, 0 is Reg2Loc
	input clk;
	
	assign ALUOp = EX[5:3];
	assign ALUSrc = EX[2:1];
	assign Reg2Loc = EX[0];
	assign m = M;
	assign wb = WB;
	assign Rdout = Rd;
	
	pipeFF set1 (Ao, A, clk, 0);
	pipeFF set2 (Bo, B, clk, 0);
	pipeFF #(.length(5)) set3 (Rdout, Rd, clk, 0);
	pipeFF set4 (addIO, ADDI, clk, 0);
	pipeFF #(.length(11)) set5 (Opout, OP, clk, 0);
	
	
endmodule

module regExMem (WB, M, zero, result, B, resultOut, Bo, 
						zout, Rd, Rdout, wb, MemWrite, MemRead, branch, clk);
	output [63:0] resultOut, Bo;
	output [4:0] Rdout;
	output zout, MemWrite, MemRead, branch; //lowercase branch is control signal
	output [1:0] wb;
	
	input zero;
	input [1:0] WB;
	input [2:0] M;
	input [63:0] result, B; //B is readdata2
	input [4:0] Rd;
	input clk;
	
	assign zout = zero;
	assign wb = WB;
	logic [63:0] w;
	assign MemWrite = M[2];
	assign MemRead = M[1];
	assign branch = M[0];
	
	pipeFF set0 (resultOut, result, clk, 0);
	pipeFF set1 (Bo, B, clk, 0);
//	pipeFF set2 (jump, w, clk, 0); //check this later
	pipeFF #(.length(5)) set3 (Rdout, Rd, clk, 0);
	
endmodule

module regMemWb(WB, data, addr, Rd, Rdout, RegWrite, MemtoReg, addrO, dataO, clk);
	output [63:0] dataO, addrO;
	output [4:0] Rdout;
	output RegWrite, MemtoReg;

	input [1:0] WB;
	input [63:0] data, addr;
	input [4:0] Rd;
	input clk;
	
	assign RegWrite = WB[1];
	assign MemtoReg = WB[0];
	
	pipeFF set0 (addrO, addr, clk, 0);
	pipeFF set1 (dataO, data, clk, 0);
	pipeFF #(.length(5)) set2 (Rdout, Rd, clk, 0);
endmodule

module pipeFF #(parameter length = 64) (q, d, reset, clk);
	output reg [length -1: 0] q;
	
	input [length -1: 0] d;
	input reset, clk;
	
	always_ff @(posedge clk) begin
		if (reset) q <= 0;
		else q <= d;
	end

endmodule 




