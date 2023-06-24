`timescale 1ns / 1ps

module BranchComputation( 
nextInstr, signExtOffset, branchAddress
    );
	 
input [31:0] nextInstr;
input [31:0] signExtOffset;
output reg[31:0] branchAddress; 

always@(nextInstr, signExtOffset)begin

 branchAddress= nextInstr+(signExtOffset<<2);


end
endmodule
