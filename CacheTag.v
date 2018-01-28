`timescale 1ns / 1ps

///////////////////////////////////////////////////////////
// University: Worcester Polytechnic Institute
// Desription : Cache Tag module for 2-way set associate Cache 
// Course : Computer Architecture ECE 501/ summer 2016
////////////////////////////////////////////////////////////

module CacheTag(input clk, input [2:0]index, input write,input [7:0]inTag,output WF);

reg [7:0] regarray [7:0];
wire [7:0] outTag;

always @(posedge clk)
	if (write == 1'b1) regarray [index] = inTag;

assign outTag = regarray [index];

assign WF = (outTag == inTag) ? 1'b1 : 1'b0;

endmodule
