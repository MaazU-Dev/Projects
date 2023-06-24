`timescale 1ns / 1ps


module PCModule(clk, rst, PC_write, nextPC);
input clk, rst, PC_write;
output reg[3:0] nextPC;
 
 initial begin
  nextPC=0;
  end 
  always @(posedge clk)begin
     if(rst==1)begin
       nextPC=0; end
     else begin
	  if(PC_write)begin
       nextPC = nextPC + 1; 
		 end 
		   end
  end 

endmodule
