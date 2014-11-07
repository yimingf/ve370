`timescale 1ns / 1ps
// by ccpizzadaisuki, modified 141103
// partly copied from github.com/jmahler/mips-cpu/
// Data Memory(single cycle).

/*
 * Data Memory.
 *
 * 32-bit data with a 64 entries.
 *
 * The read and write operations operate somewhat independently.
 *
 * Any time the read signal (rd) is high the data stored at the
 * given address (addr) will be placed on 'rdata'.
 *
 * Any time the write signal (wr) is high the data on 'wdata' will
 * be stored at the given address (addr).
 */

`ifndef _dm
`define _dm

module dm(rdata,clk,addr,rd,wr,wdata);
		output wire	[31:0]	rdata;
		input wire			clk;
		input wire	[31:0]	addr;
		input wire			rd, wr;
		input wire 	[31:0]	wdata;

	reg [31:0] mem [0:63];  // 32-bit memory with 64 entries

	always @(posedge clk) begin
		if (wr==1) mem[addr]=wdata;
	end
	assign rdata = rd ? mem[addr][31:0]:32'b0;

endmodule

`endif