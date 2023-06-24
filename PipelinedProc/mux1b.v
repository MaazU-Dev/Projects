`timescale 1ns / 1ps

module muxb(select,a,b,y);
input select;
input a,b;
output reg [31:0] y;
always@(select,a,b) begin

case(select)
	1'b0:y=a;
	1'b1:y=b;
endcase
end
endmodule
