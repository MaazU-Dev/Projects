`timescale 1ns / 1ps

module MEMWB(clock,/*iRegDests,*/ iRegWrite,/*iALUSrc,iMemRead,iMemWrite,*/ iMemToReg, /*iBranchs,*/ iJumps,/*iALUCtrl,*/
iIR,iReadData,iResult,iRegDest,
/*oRegDests,*/oRegWrite,/*oALUSrc,oMemRead,oMemWrite,*/oMemToReg,/*oBranchs,*/oJumps,/*oALUCtrl,*/
oIR,oReadData,oResult,oRegDest,enable);
input [31:0] iIR,iReadData,iResult;
input clock,enable;
input /*iRegDests,*/iRegWrite,/*iALUSrc,iMemRead,iMemWrite,*/iMemToReg,/*iBranchs,*/iJumps;
/*input [3:0]iALUCtrl;*/
input [4:0] iRegDest;
output [31:0] oIR,oReadData,oResult;
output /*oRegDests,*/oRegWrite,/*oALUSrc,oMemRead,oMemWrite,*/oMemToReg,/*oBranchs,*/oJumps;
/*output [3:0]oALUCtrl;*/
output [4:0]oRegDest;
reg [31:0] oIR,oReadData,oResult;
reg /*oRegDests,*/oRegWrite,/*oALUSrc,oMemRead,oMemWrite,*/oMemToReg,/*oBranchs,*/oJumps;
/*reg [3:0]oALUCtrl;*/
reg [4:0]oRegDest;
initial begin
oIR=32'b0;
end
always @(posedge clock)
begin
if(enable)begin
//oRegDests<=iRegDests;
oRegWrite<=iRegWrite;
//oALUSrc<=iALUSrc;
//oMemRead<=iMemRead;
//oMemWrite<=iMemWrite;
oMemToReg<=iMemToReg;
//oBranchs<=iBranchs;
oJumps<=iJumps;
//oALUCtrl<=iALUCtrl;
oIR<=iIR;
oReadData<=iReadData;
oResult<=iResult;
oRegDest<=iRegDest;
end
end
endmodule
