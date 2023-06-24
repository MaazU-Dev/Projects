`timescale 1ns / 1ps

module mux5b(select,a,b,y);
input select;
input[4:0] a,b;
output reg [4:0] y;
always@(select,a,b) begin
 
case(select)
	1'b0:y=a;
	1'b1:y=b;
	endcase
end
endmodule

