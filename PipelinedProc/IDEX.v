`timescale 1ns / 1ps

module IDEX(clock,iRegDests,iRegWrite,iALUSrc,iMemRead,iMemWrite,iMemToReg,iBranchs,iJumps,iALUCtrl,
iIR, iNextInstr, iPC,iA,iB,iRegDest,iBranch,iJump, 
oRegDests,oRegWrite,oALUSrc,oMemRead,oMemWrite,oMemToReg,oBranchs,oJumps,oALUCtrl,
oIR, oNextInstr, oPC,oA,oB,oRegDest,oBranch,oJump,enable);
input [31:0] iIR,iA,iB,iBranch,iJump;
input [3:0] iPC;
input clock,enable;
input iRegDests,iRegWrite,iALUSrc,iMemRead,iMemWrite,iMemToReg,iBranchs,iJumps;
input [3:0]iALUCtrl;
input [4:0] iRegDest;
input[31:0] iNextInstr;
output [31:0] oIR,oA,oB,oBranch,oJump;
output [3:0] oPC;
output oRegDests,oRegWrite,oALUSrc,oMemRead,oMemWrite,oMemToReg,oBranchs,oJumps;
output [3:0]oALUCtrl;
output [4:0]oRegDest;
output [31:0] oNextInstr;
reg [31:0] oIR,oA,oB,oResult,oBranch,oJump;
reg [3:0] oPC;
reg oZero;
reg oRegDests,oRegWrite,oALUSrc,oMemRead,oMemWrite,oMemToReg,oBranchs,oJumps;
reg [3:0]oALUCtrl;
reg [4:0]oRegDest;
reg[31:0] oNextInstr;
initial begin
 oPC=32'b0;
 oIR=32'b0;
end
always @(posedge clock)
begin
if(enable)begin
oRegDests<=iRegDests;
oRegWrite<=iRegWrite;
oALUSrc<=iALUSrc;
oMemRead<=iMemRead;
oMemWrite<=iMemWrite;
oMemToReg<=iMemToReg;
oBranchs<=iBranchs;
oJumps<=iJumps;
oALUCtrl<=iALUCtrl;
oPC<=iPC;
oA<=iA;
oB<=iB;
oRegDest<=iRegDest;
oBranch<=iBranch;
oJump<=iJump;
oIR<=iIR;
oNextInstr<=iNextInstr;
end
end
endmodule
