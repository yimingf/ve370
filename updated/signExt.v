
module signExt (resultd, dIn, sign);
	output wire [31:0] resultd;
	input [15:0] dIn;
	input sign;
	
	assign resultd = (sign && dIn[15] == 1) ? {16'b1111111111111111, dIn[15:0]}:{16'b0, dIn[15:0]};


endmodule
