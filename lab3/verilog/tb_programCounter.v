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

	integer i;
	initial begin
		reset <=1; PCsrc <= 0; @(posedge clk);
		reset <=0;
		for (i = 0; i < 11; i++) begin
			in <= i*64'h12FF3CA146;
			@(posedge clk);
		end
		PCsrc <= 1;
		repeat(10) begin
			@(posedge clk);
		end
		$stop;
	end

endmodule