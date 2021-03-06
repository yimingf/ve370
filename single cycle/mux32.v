`timescale 1ns / 1ps
module mux32 (result, dIn0, dIn1, selectd);
	output wire [31:0] result;
	input [31:0] dIn0, dIn1;
	input selectd;

	assign result = selectd ? dIn1 : dIn0;
	
endmodule