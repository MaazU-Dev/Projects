`timescale 1ns / 1ps

module controlUnit(clk,opcode,funct,ALUOp,RegDest,RegWrite,ALUSrc,MemRead,MemWrite,MemToReg,Branch,Jump,IR, cus);
input[5:0] opcode,funct;
input clk, cus;
input [31:0]IR;
output[2:0] ALUOp;
output RegDest,RegWrite,ALUSrc,MemRead,MemWrite,MemToReg,Branch,Jump;
reg[2:0] ALUOp;
reg RegDest,RegWrite,ALUSrc,MemRead,MemWrite,MemToReg,Branch,Jump;
 	parameter Rtype = 6'b000000;
	parameter beq = 6'b000100;
	parameter sw = 6'b101011;
	parameter lw = 6'b100011;
	parameter j = 6'b000010;

always@(opcode,funct)begin
//if(cus)begin
if(IR==32'b0)
begin
ALUOp<=3'b0;
RegDest<=1'b0;
RegWrite<=1'b0;
ALUSrc<=1'b0;
MemRead<=1'b0;
MemWrite<=1'b0;
MemToReg<=1'b0;
Branch<=1'b0;
Jump<=1'b0;
end
else
begin
case(opcode)
Rtype:begin//rtype
ALUOp<=3'b10;
RegDest<=1'b1;
RegWrite<=1'b1;
ALUSrc<=1'b0;
MemRead<=1'b0;
MemWrite<=1'b0;
MemToReg<=1'b0;
Branch<=1'b0;
Jump<=1'b0;
end
lw:begin//lw
ALUOp<=3'b00;
RegDest<=1'b0;
RegWrite<=1'b1;
ALUSrc<=1'b1;//
MemRead<=1'b1;
MemWrite<=1'b0;
MemToReg<=1'b1;
Branch<=1'b0;
Jump<=1'b0;
end
sw:begin//sw
ALUOp<=3'b00;
RegDest<=1'bx;
RegWrite<=1'b0;
ALUSrc<=1'b1;//
MemRead<=1'b0;
MemWrite<=1'b1;
MemToReg<=1'bx;
Branch<=1'b0;
Jump<=1'b0;
end
j:begin//jump
ALUOp<=3'bxxx;
RegDest<=1'bx;
RegWrite<=1'b0;
ALUSrc<=1'bx;
MemRead<=1'bx;
MemWrite<=1'b0;
MemToReg<=1'bx;
Branch<=1'bx;
Jump<=1'b1;
end
beq:begin//beq
ALUOp<=3'b01;
RegDest<=1'b0; //x
RegWrite<=1'b0;
ALUSrc<=1'b0;
MemRead<=1'b0;
MemWrite<=1'b0;
MemToReg<=1'b0; //x
Branch<=1'b1;
Jump<=1'b0;
end
endcase
//end
end

end
endmodule

