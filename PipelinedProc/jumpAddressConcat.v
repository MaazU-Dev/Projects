`timescale 1ns / 1ps

module jumpAddressJoin(part1, part2, joinedRslt);
input [3:0]part1;
input [27:0]part2;
output reg [31:0]joinedRslt;
always @(part1,part2)begin
joinedRslt={part1,part2};
end
endmodule
