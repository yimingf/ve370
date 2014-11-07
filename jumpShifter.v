module jumpShifter (extendAdrs, relaAddress);
	output [27:0] extendAdrs;
	input [25:0] relaAddress;
<<<<<<< HEAD
	assign extendAdrs = relaAddress * 4;
	// for jump instruction. if jump, instruction[25:0]->[27:0]
endmodule
=======

	assign extendAdrs = relaAddress * 4;
endmodule
>>>>>>> 14f980056707609f192789c3457eade4c2ae4280
