`timescale 1ns/10ps

module ALUcontrol(instruct, Op, out);
	output reg [3:0] out;

	input [10:0] instruct;
	input [1:0] Op;

	always @(*) begin
		casez(Op)
			2'b00: out = 4'b0000;
			2'b01: out = 4'b0111;
			2'b10: if(instruct == 1368) //ADDS
						out = 4'b0010;
					else if(instruct == 1880) //SUBS
						out = 4'b0011;
					else if(instruct == 1691) //LSL
						out = 4'b1001;
					else if(instruct == 1690) //LSR
						out = 4'b1010;
					else if (instruct >= 1160 && instruct <= 1161) //ADDI
						out = 4'b0010;
					else if (instruct == 1986 || instruct == 1984) //LDUR & STUR
						out = 4'b0010;
			2'b11: out = 4'b1000;
		endcase
	end

	// wire [7:0] F;

	// assign F = instruct[10:5];

	// wire [1:0] t0;
	// wire nOp;

	// not (nOp, Op[0]);

	// //Operation 0
	// or  (t0[0], F[3], F[0]);
	// and  (out[0], Op[1], t0[0]);

	// //Operation 1
	// nor  (out[1], Op[1], F[2]);

	// //operation 2
	// and  (t0[1], F[1], Op[1]);
	// or  (out[2], Op[0], t0[1]);

	// //Operation 3
	// and (out[3], Op[0], nOp);
endmodule