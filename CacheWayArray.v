`timescale 1ns / 1ps

///////////////////////////////////////////////////////////
// University: Worcester Polytechnic Institute
// Desription : Cache Way Array module for 2-way set associate Cache 
// Course : Computer Architecture ECE 501/ summer 2016
////////////////////////////////////////////////////////////

module CacheWayArray(input clk,input [2:0]index,input [1:0]write,input [1:0]WF,input [32*8-1:0]inblock,output [32*8-1:0]outblock);

wire [32*8-1:0] outB [1:0];

genvar i;

generate 
for (i = 0; i < 2 ; i = i + 1)begin
	CacheWay CW (clk,index,write[i],WF[i],inblock,outB[i]);
	tristate ts (WF[i],outB[i],outblock);
end
endgenerate

endmodule
