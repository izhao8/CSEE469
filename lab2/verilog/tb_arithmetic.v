`include "arithmetic.v"

module tb_arithmetic();
	reg [63:0] A, B;
	reg sub;

	wire [63:0] out;
	wire of, C;
	wire [63:0] cout;

	arithmetic dut (A, B, out, of, C, sub);

	//initializes gtkwave file for viewing
	initial begin
		$dumpfile("arithmetic_wave.vcd");
		$dumpvars(1, dut);
	end

	integer i, j;
	integer seed = 2;
	initial begin
		//checking subtraction
		sub <= 1'b1;
		for (i = 0; i < 10; i = i + 1) begin
			A <= i * 64'd12353;
			B <= i * 64'd12353 + i;
			#5;
		end
		//checking overflow flag for subtraction
		A <= 64'h8000000000000000;
		B <= 64'd12353;
		#5;

		//checking addition
		sub <= 1'b0; 
		for (j = 0; j < 10; j = j + 1) begin
			A <= j * 64'd12353;
			B <= j * 64'd12353 + j;
			#5;
		end

		//checking overflow flag for addition
		A <= 64'h7FFFFFFFFFFFFFFF;
		B <= 64'h7FFFFFFFFFFFFFFF;
		#5;	

		//generates random values for subtraction
		sub <= 1'b1;
		repeat (10) begin
			A <= $random(seed);
			B <= $random(seed);
			#5;
		end

		//generates random numbers for addition
		sub <= 1'b0;
		repeat (10) begin
			A <= $random(seed);
			B <= $random(seed);
			#5;
		end

		$stop;
	end
endmodule