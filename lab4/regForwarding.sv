`timescale 1ns/10ps

module regIdIf(instruction, flush, write, PC, instruct, pc, clk);
	output reg [31:0] instruct;
	output reg [63:0] pc;
	
	input [63:0] PC;
	input [31:0] instruction;
	input flush, write, clk;
	
	// always_ff @(posedge clk) begin
	// 	if (flush)
	// 		instruct <= 0;
	// 	else	if (write) begin
	// 		instruct <= instruction;
	// 		pc <= PC;
	// 	end
	// 	else begin
	// 		instruct <= instruct;
	// 		pc <= pc;
	// 	end
	// end
	logic [31:0] temp;
	logic [63:0] p;
	always_comb begin
		if (flush) temp = 0;
		else if (write) begin
			temp = instruction;
			p = PC;
		end
		else begin
			temp = temp;
			p = p;
		end
	end
	// assign instruct = temp;
	// assign pc = p;
	pipeFF #(.length(32)) set0 (instruct, temp, clk, 1'b0);
	pipeFF set1 (pc, p, clk, 1'b0);
endmodule


module regExId (WB, M, EX, A, B, ADDI,  Rd, Ao, Bo, 
					Rdout, addIO, clk, Rn, Rm, Rno, Rmo, wb, m, Reg2Loc,
					ALUOp, ALUSrc, OP, Opout, shift, shifto);
	output [63:0] Ao, Bo, addIO; 
	output [4:0] Rdout, Rno, Rmo;
	output [1:0] wb;
	output [3:0] m;
	output [1:0] ALUOp;
	output [2:0] ALUSrc;
	output [10:0] Opout;
	output Reg2Loc;
	output [5:0] shifto;
	
	input [1:0] WB;
	input [3:0] M; 
	input [63:0] A, B, ADDI;
	input [10:0] OP; //instruction[31:21] --> Opout
	input [4:0] Rd, Rn, Rm; //instruction[4:0] --> Rdout
	input [5:0] EX, shift; //[5:4] is ALUOp, [3:1] is ALUSrc, 0 is Reg2Loc
	input clk;
	
	// assign Rno = Rn;
	// assign Ao = A;
	// assign Bo = B;
	// assign Rdout = Rd;
	// assign addIO = ADDI;
	// assign Opout = OP;
	// assign Rmo = Rm;
	// assign ALUOp = EX[5:4];
	// assign ALUSrc = EX[3:1];
	// assign Reg2Loc = EX[0];
	// assign m = M;
	// assign wb = WB;

	pipeFF #(.length(5)) set0 (Rno, Rn, clk, 1'b0);
	pipeFF set1 (Ao, A, clk, 1'b0);
	pipeFF set2 (Bo, B, clk, 1'b0);
	pipeFF #(.length(5)) set3 (Rdout, Rd, clk, 1'b0);
	pipeFF set4 (addIO, ADDI, clk, 1'b0);
	pipeFF #(.length(11)) set5 (Opout, OP, clk, 1'b0);
	pipeFF #(.length(5)) set6 (Rmo, Rm, clk, 1'b0);
	pipeFF #(.length(2)) set8 (ALUOp, EX[5:4], clk, 1'b0);
	pipeFF #(.length(3)) set9 (ALUSrc, EX[3:1], clk, 1'b0);
	pipeFF #(.length(1)) set10 (Reg2Loc, EX[0], clk, 1'b0);
	pipeFF #(.length(4)) set11 (m, M, clk, 1'b0);
	pipeFF #(.length(2)) set12 (wb, WB, clk, 1'b0);
	pipeFF #(.length(6)) set13 (shifto, shift, clk, 1'b0);
endmodule

module regExMem (WB, M, zero, result, B, resultOut, Bo, 
						zout, Rd, Rdout, wb, MemWrite, MemRead, branch, clk, b);
	output [63:0] resultOut, Bo;
	output [4:0] Rdout;
	output zout, MemWrite, MemRead, branch, b; //lowercase branch is control signal
	output [1:0] wb;
	
	input zero;
	input [1:0] WB;
	input [3:0] M;
	input [63:0] result, B; //B is readdata2
	input [4:0] Rd;
	input clk;
	
	// assign zout = zero;
	// assign wb = WB;
	// assign MemWrite = M[3];
	// assign MemRead = M[2];
	// assign branch = M[1];
	// assign b = M[0];
	// assign resultOut = result;
	// assign Bo = B;
	// assign Rdout = Rd;
	
	pipeFF set0 (resultOut, result, clk, 1'b0);
	pipeFF set1 (Bo, B, clk, 1'b0);
	pipeFF #(.length(5)) set3 (Rdout, Rd, clk, 1'b0);
	pipeFF #(.length(1)) set4 (zout, zero, clk, 1'b0);
	pipeFF #(.length(2)) set5 (wb, WB, clk, 1'b0);
	pipeFF #(.length(1)) set6 (MemWrite, M[3], clk, 1'b0);
	pipeFF #(.length(1)) set7 (MemRead, M[2], clk, 1'b0);
	pipeFF #(.length(1)) set8 (branch, M[1], clk, 1'b0);
	pipeFF #(.length(1)) set9 (b, M[0], clk, 1'b0);
	
	
endmodule

module regMemWb(WB, data, addr, Rd, Rdout, RegWrite, MemtoReg, addrO, dataO, clk);
	output [63:0] dataO, addrO;
	output [4:0] Rdout;
	output RegWrite, MemtoReg;

	input [1:0] WB;
	input [63:0] data, addr;
	input [4:0] Rd;
	input clk;
	
	// assign RegWrite = WB[1];
	// assign MemtoReg = WB[0];
	// assign addrO = addr;
	// assign dataO = data;
	// assign Rdout= Rd;
	pipeFF set0 (addrO, addr, clk, 1'b0);
	pipeFF set1 (dataO, data, clk, 1'b0);
	pipeFF #(.length(5)) set2 (Rdout, Rd, clk, 1'b0);
	pipeFF #(.length(1)) set8 (RegWrite, WB[1], clk, 1'b0);
	pipeFF #(.length(1)) set9 (MemtoReg, WB[0], clk, 1'b0);
endmodule

module pipeFF #(parameter length = 64) (q, d, clk, reset);
	output reg [length -1: 0] q;
	
	input [length -1: 0] d;
	input reset, clk;
	
	always_ff @(posedge clk) begin
		if (reset) q <= 0;
		else q <= d;
	end

endmodule 




