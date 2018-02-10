`include "multiplex.v"
`include "decoder.v"
`include "register.v"

module regfile (ReadRegister1, ReadRegister2, WriteData, ReadData1, 
				ReadData2, WriteRegister, RegWrite, clk);
	
	output [63:0] ReadData1, ReadData2;
	input [63:0] WriteData;
	input [4:0] ReadRegister1, ReadRegister2, WriteRegister;
	input RegWrite, clk;

	wire [31:0] dec;
	wire [31:0][63:0] outwr;

	decoder start (.in(WriteRegister), .out(dec), .en(RegWrite));

	generate
		genvar i;
		for (i = 0; i < 31; i = i + 1'b1) begin : toplevel
			register set (.in(WriteData), .out(outwr[i]), .en(dec[i]), .clk(clk));
		end
	endgenerate

	assign outwr[31] = 64'b0;
	multiplex one (.in(outwr), .out(ReadData1), .read(ReadRegister1));
	multiplex two (.in(outwr), .out(ReadData2), .read(ReadRegister2));

endmodule