`timescale 1ns / 1ps
module aluAdder(result, pcFour, relaAddress);
	input [31:0] pcFour, relaAddress;
	output [31:0] result;
	assign result = pcFour + relaAddress;
	// for branch, if branch, new pc = result.
endmodule
