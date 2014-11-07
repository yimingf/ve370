`timescale 1ns / 1ps

module PCadder(resultd, oldPC);
	input [31:0] oldPC;
	output [31:0] resultd;
	assign resultd = oldPC + 4;
endmodule
