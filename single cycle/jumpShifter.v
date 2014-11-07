`timescale 1ns / 1ps
module jumpShifter (extendAdrs, relaAddress, PCPlusFour);
	output [31:0] extendAdrs;
	input [25:0] relaAddress;
	input [31:0] PCPlusFour;

	assign extendAdrs = {PCPlusFour[31:28],relaAddress << 2};
endmodule

