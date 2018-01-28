`timescale 1ns / 1ps

///////////////////////////////////////////////////////////
// University: Worcester Polytechnic Institute
// Desription : Main Memory module for 2-way set associate Cache 
// Course : Computer Architecture ECE 501/ summer 2016
////////////////////////////////////////////////////////////

module MainMemory(input clk,readM,writeM,accessM,input [10:0]address,input [32*8-1:0]inblock,output reg[32*8-1:0]outblock,output reg readyM);

reg [32*8-1:0] mM [0:2048];

always @(readM or accessM) begin
	if(readM)begin 
	outblock <= mM[address];
	readyM <= 1'b1;
	end
end
 always @(writeM or accessM)begin
	if(writeM)begin 
	mM[address] <= inblock;
	readyM <= 1'b1;
	end
end

endmodule
