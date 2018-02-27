`timescale 1ns/10ps

module programCounter(in, PCsrc, out, clk, reset, temp, en);
	output reg [63:0] out;
	output [63:0] temp;

	input [63:0] in;
	input clk, reset, PCsrc, en;

	wire [63:0] PC4;
	wire C, of, neg, z;
	
	//reminder to implement this in top level
//	alu bcond (temp, in, 4'b0010, B, C, of, neg, z, 6'd0);
	alu pc4 (temp, 64'd4, 4'b0010, PC4, C, of, neg, z, 6'd0);
	assign temp = out;
	always @(posedge clk) begin
		if (reset) begin
			out <= 0;
		end
		else if (PCsrc && en) begin
			out <= in;
		end
		else if (en) begin
			out <= PC4;
		end
		else begin
			out <= out;
		end
	end
endmodule
