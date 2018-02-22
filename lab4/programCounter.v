`timescale 1ns/10ps

module programCounter(in, PCsrc, out, clk, reset, temp);
	output reg [63:0] out, temp;

	input [63:0] in;
	input clk, reset, PCsrc;

	wire [63:0] B, PC4;
	wire C, of, neg, z;
	
	//reminder to implement this in top level
//	alu bcond (temp, in, 4'b0010, B, C, of, neg, z, 6'd0);
	alu pc4 (temp, 64'd4, 4'b0010, PC4, C, of, neg, z, 6'd0);

	always @(posedge clk) begin
		if (reset)
			out <= 0;
		else if (PCsrc)
			out <= in;
		else begin
			out <= PC4;
		end
		assign temp = out;
	end
endmodule
