module signExt (result, dIn, sign);
	input [15:0] dIn;
	input sign;
	output [31:0] result;
	wire [31:0] result;
	
	assign result = (sign == 1 && dIn[15] == 1) ? {{16{1'b1}}, dIn[15:0]}:{{16{1'b0}}, dIn[15:0]};

endmodule

Zhang Heng Ni Ge Sha Bi~~~~~