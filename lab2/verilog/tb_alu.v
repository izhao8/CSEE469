`include "alu.v"

module tb_alu();
	reg [63:0] A, B;
	reg [2:0] cntrol;

	wire negative, zero, overflo, carry_out;
	wire [63:0] result;

	alu dut (A, B, cntrol, result, negative, zero, overflow, carry_out);

	initial begin
		$dumpfile("alu_wave.vcd");
		$dumpvars(1, dut);
	end

	integer i;
	integer seed = 1;

	initial begin
		cntrol <= 3'b000; //outputs B

		repeat(10) begin
			A <= $random(seed);
			B <= $random(seed);
			#5;
		end

		cntrol <= 3'b010; //outputs addition

		repeat(10) begin
			A <= $random(seed);
			B <= $random(seed);
			#5;
		end		

		cntrol <= 3'b011; //outputs subtraction

		repeat(10) begin
			A <= $random(seed);
			B <= $random(seed);
			#5;
		end		

		cntrol <= 3'b100; //outputs bitwise AND

		repeat(10) begin
			A <= $random(seed);
			B <= $random(seed);
			#5;
		end		

		cntrol <= 3'b101; //outputs bitwise OR

		repeat(10) begin
			A <= $random(seed);
			B <= $random(seed);
			#5;
		end		

		cntrol <= 3'b110; //outputs bitwise XOR

		repeat(10) begin
			A <= $random(seed);
			B <= $random(seed);
			#5;
		end

		cntrol <= 3'b011;
		//checking overflow flag for subtraction
		A <= 64'h8000000000000000;
		B <= 64'd12353;
		#5;
		cntrol <= 3'b010;
		//checking overflow flag for addition
		A <= 64'h7FFFFFFFFFFFFFFF;
		B <= 64'h7FFFFFFFFFFFFFFF;
		#5;	
		$stop;
	end
endmodule