`timescale 1ns / 1ps

///////////////////////////////////////////////////////////
// University: Worcester Polytechnic Institute
// Desription : Cache Way module for 2-way set associate Cache 
// Course : Computer Architecture ECE 501/ summer 2016
////////////////////////////////////////////////////////////

module CacheWay(input clk,input [2:0]index,input write,input [32*8-1:0]inblock,output [32*8-1:0]outblock);

reg [32*8-1:0] regArray [7:0];

always @(posedge clk)
	if(write == 1'b1) regArray [index] = inblock;

assign outblock = regArray [index];

endmodule
