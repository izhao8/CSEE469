//`include "register.v"

module tb_register();
	reg [63:0] in;
	wire [63:0] out;
	reg en, clk;

	parameter ClockDelay = 5000;

	register dut (in, out, en, clk);

	initial begin
		$dumpfile("tb_register.vcd");
		$dumpvars(1, dut);
	end

	initial begin // Set up the clock
		clk <= 0;
		forever #(ClockDelay/2) clk <= ~clk;
	end


	integer i;
	initial begin
		en <= 1;
		for (i = 0; i < 10; i = i + 1) begin
			in <= i*64'h0000010204080001;
			@(posedge clk);
		end
		en <= 0;
		for (i = 0; i < 10; i = i + 1) begin
			in <= i*64'h0000010204080001;
			@(posedge clk);
		end
		$stop;
	end
endmodule