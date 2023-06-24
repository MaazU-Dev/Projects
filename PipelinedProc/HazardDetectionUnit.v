`timescale 1ns / 1ps

module HazardDetectionUnit(
  input[4:0] ID_EX_RegisterRt,
  input[4:0] IF_ID_RegisterRs,
  input[4:0] IF_ID_RegisterRt,
  input ID_EX_MemRead,
  output reg IFID_write, PC_write, ControlU_Write  
  );

initial begin
	IFID_write=1;
		PC_write=1;
		ControlU_Write=1;
end

always@(*)begin
	if(ID_EX_MemRead && ((ID_EX_RegisterRt == IF_ID_RegisterRs) || (ID_EX_RegisterRt == IF_ID_RegisterRt)))begin
		IFID_write=0;
		PC_write=0;
		ControlU_Write=0;
	end 
	else begin
		IFID_write=1;
		PC_write=1;
		ControlU_Write=1;
		end
end

endmodule
