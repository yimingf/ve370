module control1(RegDst,Jump,Branch,MemRead,MemtoReg,ALUop,MemWrite,ALUSrc,RegWrite,Sign,instruction);
//I use the disjucnctive normal form to define each control output
output wire RegDst;
output wire Branch;
output wire MemRead;
output wire MemtoReg;
output wire Jump;
output wire [1:0]ALUop;
output wire MemWrite;
output wire ALUSrc;
output wire RegWrite;
output wire Sign;
input wire [31:0] instruction;
wire lw;wire sw;wire Rtype;wire addi;wire andi;wire beq;wire j;
wire [5:0]opcode;
assign opcode[5:0]=instruction[31:26];
//The disjuctive form of each operation
assign lw=((opcode[5])&(~opcode[4])&(~opcode[3])&(~opcode[2])&(opcode[1])&(opcode[0]));
assign sw=((opcode[5])&(~opcode[4])&(opcode[3])&(~opcode[2])&(opcode[1])&(opcode[0]));
assign Rtype=((~opcode[5])&(~opcode[4])&(~opcode[3])&(~opcode[2])&(~opcode[1])&(~opcode[0]));
assign addi=((~opcode[5])&(~opcode[4])&(opcode[3])&(~opcode[2])&(~opcode[1])&(~opcode[0]));
assign andi=((~opcode[5])&(~opcode[4])&(opcode[3])&(opcode[2])&(~opcode[1])&(~opcode[0]));
assign beq=((~opcode[5])&(~opcode[4])&(~opcode[3])&(opcode[2])&(~opcode[1])&(~opcode[0]));
assign j=((~opcode[5])&(~opcode[4])&(~opcode[3])&(~opcode[2])&(opcode[1])&(~opcode[0]));
//Start defining the control output
assign RegDst=Rtype;
assign Jump=j;
assign Branch=beq;
assign MemRead=lw;
assign MemtoReg=lw;
assign ALUop[1]=(Rtype|andi);//if ALUop=11,then it's andi operation
assign ALUop[0]=(andi|beq);//if ALUop=11,then it's andi operation
assign MemWrite=sw;
assign ALUSrc=(lw|sw|addi|andi);
assign RegWrite=(lw|Rtype|addi|andi);
assign Sign=andi;//????
endmodule