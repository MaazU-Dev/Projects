`timescale 1ns / 1ps

module mux32b(select,a,b,y);
input select;
input[31:0] a,b;
output reg [31:0] y;
always@(select,a,b) begin

case(select)
	1'b0:y=a;
	1'b1:y=b;
endcase
end
endmodule