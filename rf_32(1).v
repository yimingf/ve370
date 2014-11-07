// by ccpizzadaisuki, modified 141103
// Register file (32 bits).
// partly copied from ve370 Homework 3, problem 9.

`ifndef _rf_32
`define _rf_32

module rf_32(rd_1, rd_2, rr_1, rr_2, wr, wd, write, clk);
	output reg	   [31:0]	rd_1, rd_2;
	input wire 		[4:0]	rr_1, rr_2, wr;
	input wire 		[31:0]	wd;
	input wire				write;
	input wire				clk;
	
	reg				[31:0]	register_file[31:0];
	always @(posedge clk) begin
		if (write==1) 	register_file[wr] <= wd;
	end
	assign	rd_1 	= 	register_file[rr_1];
	assign 	rd_2 	= 	register_file[rr_2];

	
endmodule

`endif