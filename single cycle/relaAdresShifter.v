`timescale 1ns / 1ps
module relaAdrsShifter(resultd, dataIn);
	input [31:0] dataIn;
	output [31:0] resultd;
	assign resultd = dataIn * 4;

endmodule