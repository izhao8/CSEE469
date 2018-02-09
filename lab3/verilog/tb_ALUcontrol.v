`include "ALUcontrol.v"

module tb_ALUcontrol();
	wire [2:0] out;

	reg [10:0] instruct;
	reg [1:0] Op;

	ALUcontrol dut (instruct, Op, out);

	initial begin
		$dumpfile("ALUcontrol_wave.vcd");
		$dumpvars(1, dut);
	end

endmodule