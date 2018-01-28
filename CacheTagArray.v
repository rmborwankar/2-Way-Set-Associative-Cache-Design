`timescale 1ns / 1ps

///////////////////////////////////////////////////////////
// University: Worcester Polytechnic Institute
// Desription : Cache Tag Array module for 2-way set associate Cache 
// Course : Computer Architecture ECE 501/ summer 2016
////////////////////////////////////////////////////////////

module CacheTagArray(input clk,input [2:0]index,input [1:0]write, input [7:0]intag,output [1:0]WF);

genvar i;

generate
for (i = 0; i < 2; i = i + 1)

	CacheTag CT (clk,index, write[i],inTag,WF[i]);
endgenerate

endmodule
