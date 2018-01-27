`include "mux5to1.v"

module tb_mux5to1();
	wire [63:0] out;

	reg [63:0] ADD, AND, XOR, OR ,B;
	reg [2:0] sel;

	mux5to1 dut (ADD, AND, XOR, OR, B, out, sel);

	initial begin
		$dumpfile("mux5to1_wave.vcd");
		$dumpvars(1, dut);
	end

	integer i;
	initial begin
		AND <= 64'd1;
		ADD <= 64'd2;
		XOR <= 64'd3;
		OR <= 64'd4;
		B <= 64'd5;
		for (i = 0; i < 8; i = i + 1) begin
			sel <= i;
			#5;
		end
		$stop;
	end
endmodule