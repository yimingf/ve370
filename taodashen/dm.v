// by ccpizzadaisuki, modified 141103
// partly copied from github.com/jmahler/mips-cpu/
// Data Memory(single cycle).

/*
 * Data Memory.
 *
 * 32-bit data with a 7 bit address (128 entries).
 *
 * The read and write operations operate somewhat independently.
 *
 * Any time the read signal (rd) is high the data stored at the
 * given address (addr) will be placed on 'rdata'.
 *
 * Any time the write signal (wr) is high the data on 'wdata' will
 * be stored at the given address (addr).
 * 
 * If a simultaneous read/write is performed the data written
 * can be immediately read out.
 */

`ifndef _dm
`define _dm

module dm(rdata,clk,addr,rd,wr,wdata);
		output wire	[31:0]	rdata;
		input wire			clk;
		input wire	[5:0]	addr;
		input wire			rd, wr;
		input wire 	[31:0]	wdata;

	reg [31:0] mem [0:63];  // 32-bit memory with 128 entries

	always @(posedge clk) begin
		if (wr==1) mem[addr]=wdata;
	end
	assign rdata = rd ? wdata : mem[addr][31:0];

endmodule

`endif