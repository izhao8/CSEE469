`include "control.v"

module tb_control();
	wire [1:0] ALUOp;
	wire RegWrite, Reg2Loc, Branch, MemWrite, 
		MemtoReg, ALUSrc, MemRead;

	reg [10:0] instruct;

	control dut (instruct, Reg2Loc, Branch, MemRead, 
				MemtoReg, ALUOp, MemWrite, ALUSrc, RegWrite);

	initial begin
		$dumpfile("control_wave.vcd");
		$dumpvars(1, dut);
	end

	

endmodule