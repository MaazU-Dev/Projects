`timescale 1ns / 1ps

module mux3x1(select, a, b, c, y);
input[1:0] select;
input[31:0] a,b,c;
output reg [31:0] y;
always@(select,a,b) begin

case(select)
	2'b00:y=a; //Instr from RegFile
	2'b10:y=b; //EXMEM
	2'b01:y=c; //MEMWB
endcase
end
endmodule