`timescale 1ns / 1ps

///////////////////////////////////////////////////////////
// University: Worcester Polytechnic Institute
// Desription : Cache LRU Memory module for 2-way set associate Cache 
// Course : Computer Architecture ECE 501/ summer 2016
////////////////////////////////////////////////////////////

module CacheLRUMemory(input clk,input write,input [1:0]NewL,input [2:0]index,output [1:0]OldL);

reg [31:0]regArray[7:0];

always @(posedge clk)
	if (write == 1'b1) regArray[index] = NewL;

assign OldL = regArray[index];

endmodule
