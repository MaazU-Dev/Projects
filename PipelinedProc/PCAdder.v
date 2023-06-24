`timescale 1ns / 1ps

module PCAdder(in1, in2 ,out);
input [3:0]in1;
input [3:0]in2;
output reg [3:0]out;

always@(in1,in2)begin
out=in1+in2;
end
endmodule
