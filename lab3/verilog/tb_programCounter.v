`include "programCounter.v"

module tb_programCounter();
	wire [63:0] out;

	reg [63:0] in;
	reg clk, reset, PCsrc;

	parameter ClockDelay = 5000;

	programCounter dut (in, PCsrc, out, clk, reset);

	initial begin
		$dumpfile("programCounter_wave.vcd");
		$dumpvars(1, dut);
	end

	initial begin // Set up the clock
		clk <= 0;
		forever #(ClockDelay/2) clk <= ~clk;
	end

endmodule