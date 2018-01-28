`timescale 1ns / 1ps

///////////////////////////////////////////////////////////
// University: Worcester Polytechnic Institute
// Desription : Cache Least Memory module for 2-way set associate Cache 
// Course : Computer Architecture ECE 501/ summer 2016
////////////////////////////////////////////////////////////

module CacheLeastMemory (input clk,write,input NewLB,input [2:0]index,output OldLB);

reg regArray[7:0];

always @(posedge clk)
	if (write == 1'b1) regArray[index] = NewLB; 

assign OldLB = regArray[index];

endmodule
