module jumpShifter (extendAdrs, relaAddress);
	output [27:0] extendAdrs;
	input [25:0] relaAddress;

	assign extendAdrs = relaAddress * 4;
endmodule
