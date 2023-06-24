`timescale 1ns / 1ps

module IFID(
  clk,
   iNextPC,
  iInstr,
  iNextInstr,
 oNextPC,
  oInstr,
  oNextInstr,
  
  enable
);

  input clk, enable;
  input [31:0] iInstr;
  input [31:0] iNextInstr;
  input [3:0] iNextPC;
  output reg [31:0] oInstr;
  output reg[31:0] oNextInstr;
  output reg [3:0] oNextPC;
  
  always @(posedge clk) begin
    if(enable)begin
    oInstr <= iInstr;
	 oNextInstr <= iNextInstr;
    oNextPC <= iNextPC;
	 end
  end
endmodule
