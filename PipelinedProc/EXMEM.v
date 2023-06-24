`timescale 1ns / 1ps

module EXMEM(clock/*iRegDests*/,iRegWrite, /*iALUSrc*/iMemRead,iMemWrite,iMemToReg,iBranchs,
iJumps/*iALUCtrl*/,
iIR, inIR, iPC,iB, iResult,iRegDest,iBranch,iJump,iZero, oRegWrite,oMemRead,oMemWrite,oMemToReg,oBranchs,oJumps,
oIR, onIR, oPC, oB, oResult,oRegDest,oBranch,oJump,oZero,enable);
input [31:0] iIR, inIR, iPC,iB,iResult,iBranch,iJump;
input iZero,clock,enable;
input iRegWrite,iMemRead,iMemWrite,iMemToReg,iBranchs,iJumps;
input [4:0] iRegDest;
output [31:0] oIR, onIR, oPC,oB,oResult,oBranch,oJump;
output oZero;
output oRegWrite,oMemRead,oMemWrite,oMemToReg,oBranchs,oJumps;
output [4:0]oRegDest;
reg [31:0] oIR, onIR, oPC,oB,oResult,oBranch,oJump;
reg oZero;
reg oRegWrite,oMemRead,oMemWrite,oMemToReg,oBranchs,oJumps;
reg [4:0]oRegDest;
initial begin
 oPC=32'b0;
 oIR=32'b0;
end
always @(posedge clock)
begin
if(enable)begin
//oRegDests<=iRegDests;
oRegWrite<=iRegWrite;
//oALUSrc<=iALUSrc;
oMemRead<=iMemRead;
oMemWrite<=iMemWrite;
oMemToReg<=iMemToReg;
oBranchs<=iBranchs;
oJumps<=iJumps;
//oALUCtrl<=iALUCtrl;
oIR<=iIR;
onIR<=inIR;
oPC<=iPC;
oB<=iB;
oResult<=iResult;
oRegDest<=iRegDest;
oBranch<=iBranch;
oJump<=iJump;
oZero<=iZero;
end
end
endmodule
