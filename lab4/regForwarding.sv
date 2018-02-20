`timescale 1ns/10ps

module regExId (WB, M, EX, PC, A, B, Branch, OP, Rd, Ao, Bo, Opout, 
					Rdout, jump, pc, clk,);
	output [63:0] Ao, Bo, Opout, jump, pc;
	output [4:0] Rdout;
	output [10:0] Opout;
	output [1:0] wb;
	output [2:0] m;
	output [3:0] ALUOp;
	output [2:0] ALUSrc;
	
	input [1:0] WB;
	input [2:0] M; 
	input [63:0] A, B, Branch, PC; //Branch is SE input
	input [10:0] OP; //instruction[31:21] --> Opout
	input [4:0] Rd; //instruction[4:0] --> Rdout
	input [6:0] EX; //[6:3] is ALUOp; [2:0] is ALUSrc
	input clk;
	
	assign ALUOp = EX[6:3];
	assign ALUSrc = EX[2:0];
	assign m = M;
	assign wb = WB;
	assign Rdout = Rd;
	
	pipeFF set0 (pc, PC, clk, 0);
	pipeFF set1 (Ao, A, clk, 0);
	pipeFF set2 (Bo, B, clk, 0);
	pipeFF #(.length(5)) set3 (Rdout, Rd, clk, 0);
	pipeFF set4 (jump, Branch, clk, 0);
	pipeFF #(.length(11)) set5 (Opout, OP, clk, 0);
	
	
endmodule

module regExMem (WB, M, Branch, zero, result, B, resultOut, Bo, jump, 
						zout, Rd, Rdout, wb, MemWrite, MemRead, branch, clk);
	output [63:0] resultOut, Bo, jump;
	output [4:0] Rdout;
	output zout, MemWrite, MemRead, branch; //lowercase is branch is control signal
	output [1:0] wb;
	
	input zero;
	input [1:0] WB;
	input [2:0] M;
	input [63:0] result, B, Branch;
	input [4:0] Rdout;
	input clk;
	
	assign zout = zero;
	assign wb = WB;
	logic [63:0] w;
	assign MemWrite = M[2];
	assign MemRead = M[1];
	assign branch = M[0];
	
	pipeFF set0 (resultout, result, clk, 0);
	pipeFF set1 (Bo, B, clk, 0);
	mux2to1 sel0 (Branch, jump, w, !branch); 
	pipeFF set2 (jump, w, clk, 0); //check this later
	pipeFF @(.length(5)) set3 (Rdout, Rd, clk, 0);
	
endmodule

module regMemWb(WB, data, addr, Rd, Rdout, RegWrite, MemtoReg, addrO, dataO, clk);
	output [63:0] result, dataO;
	output [4:0] Rdout;
	output regWrite, MemtoReg;

	input [1:0] WB;
	input [63:0] data, addr;
	input [4:0] Rd;
	input clk;
	
	assign regWrite = WB[1];
	assign MemtoReg = WB[0];
	
	pipeFF set0 (result, addr, clk, 0);
	pipeFF set1 (dataO, data, clk, 0);
	pipeFF @(.length(5)) set2 (Rdout, Rd, clk, 0);
endmodule

module pipeFF #(parameter length = 64) (q, d, reset, clk)
	output [length -1: 0] q;
	
	input [length -1: 0] d;
	input reset, clk;
	
	always_f 2(posedge clk) begin
		if (reset) q <= 0;
		else q <= d;
	end

endmodule 




