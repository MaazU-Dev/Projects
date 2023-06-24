`timescale 1ns / 1ps

module ALU(input [31:0] data1, input [31:0] data2, input [3:0] aluoperation, output reg [31:0] result, output reg zero);
  always @(aluoperation, data1, data2) begin 
    case (aluoperation)
      4'b0000 : result = data1 + data2; // ADD
      4'b0001 : result = data1 - data2; // SUB
      4'b0010 : result = data1 & data2; // AND
      4'b0011 : result = data1 | data2; // OR
      4'b0100 : result = data1 ^ data2; // XOR
      // if you want to add new ALU instructions, add them here
      default : result = data1 + data2; // ADD
    endcase
    
    if (result == 32'd0)
      zero = 1'b1;
    else
      zero = 1'b0;
  end
  
  always @(result) begin
    $display("ALUResult = %x", result);
  end
endmodule





