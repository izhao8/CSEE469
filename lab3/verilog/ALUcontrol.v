`timescale 1ns/10ps

module ALUcontrol(instruct, Op, out);
	output [2:0] out;

	input [10:0] instruct;
	input [1:0] Op;

	wire [7:0] F;

	assign F = instruct[10:6];

	wire [1:0] t0;

	// always @(*) begin
	// 	casez(Op)
	// 		2'b00: out = 3'b010;
	// 		2'bZ1: out = 3'b111;
	// 		2'b1Z: if (instruct[9] == 0 && instruct[3] == 1)
	// 					out = 3'b010;
	// 				else if (instruct[9] == 1 && instruct[3] == 1)
	// 					out = 3'b110;
	// 				else if (instruct[8])
	// 					out = 3'b001;
	// 				else 
	// 					out = 0;
	// 	endcase
	// end

	//Operation 0
	or  (t0[0], F[3], F[0]);
	and  (out[0], Op[1], t0[0]);

	//Operation 1
	nor  (out[1], Op[1], F[2]);

	//operation 2
	and  (t0[1], F[1], Op[1]);
	or  (out[2], Op[0], t0[1]);


endmodule