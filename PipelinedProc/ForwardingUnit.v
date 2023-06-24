`timescale 1ns / 1ps

module ForwardingUnit(
  input EX_MEM_RegWrite,
  input [4:0] EX_MEM_RegisterRd,
  input [4:0] ID_EX_RegisterRs,
  input [4:0] ID_EX_RegisterRt,
  input MEM_WB_RegWrite,
  input [4:0] MEM_WB_RegisterRd,
  output reg [1:0] ForwardA,
  output reg [1:0] ForwardB
);
 
  always@(*)begin
  // EX hazard
  if (EX_MEM_RegWrite && (EX_MEM_RegisterRd != 5'b00000)) begin
    if (EX_MEM_RegisterRd == ID_EX_RegisterRs)begin
      ForwardA = 2'b10;
		end 
		else begin
		  ForwardA = 2'b00;
		  end
    if (EX_MEM_RegisterRd == ID_EX_RegisterRt) begin
      ForwardB = 2'b10;
		end
		else begin
		ForwardB = 2'b00;
		end
  end
  
  // MEM hazard
  if (MEM_WB_RegWrite && (MEM_WB_RegisterRd != 5'b00000)) begin
   if(EX_MEM_RegisterRd != ID_EX_RegisterRs)begin
    if (MEM_WB_RegisterRd == ID_EX_RegisterRs)begin
      ForwardA = 2'b01;
		end
		else begin
		  ForwardA = 2'b00;
		  end
		end
		else begin
		  ForwardA = 2'b00;
		  end
	if(EX_MEM_RegisterRd != ID_EX_RegisterRt)begin
    if (MEM_WB_RegisterRd == ID_EX_RegisterRt)begin
      ForwardB = 2'b01;
		end
		else begin
		 ForwardB = 2'b00;
		 end
	 end
	 else begin
		  ForwardB = 2'b00;
		  end
	 
  end
 
  
  end
  
  
endmodule

