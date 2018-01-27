`include "gateLogic.v"

module tb_gateLogic();
	wire NORout;
	wire [63:0] out;

	reg [63:0] A, B;

	initial begin
		$dumpfile("gateLogic_wave.vcd");
		$dumpvars(1, dut0);
		$dumpvars(1, dut1);
		$dumpvars(1, dut2);
		$dumpvars(1, dut3);
	end

	zero dut0 (A, NORout);
	bitAND dut1 (A, B, out);
	bitOR dut2 (A, B, out);
	bitXOR dut3 (A, B, out);

	integer i, j;
	integer seed = 1;
	initial begin
		for (i = 0; i < 32; i = i + 1) begin
			A <= i * 64'd12353;
			B <= i * 64'd12353 + i;
			#5;
		end
		A <= 64'b0;
		#5;
		repeat (10) begin
			A <= $random(seed); B <= $random(seed);
			#5;
		end
		$stop;
	end

endmodule