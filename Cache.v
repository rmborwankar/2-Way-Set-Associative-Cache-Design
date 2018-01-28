`timescale 1ns / 1ps

///////////////////////////////////////////////////////////
// University: Worcester Polytechnic Institute
// Desription : Cache module for 2-way set associate Cache 
// Course : Computer Architecture ECE 501/ summer 2016
////////////////////////////////////////////////////////////

module cache(input clk,reset,write,read,memaccess,mainMready,input[15:0]address,input [32*8-1:0]inblock,output[32*8-1:0]outblock,output memReady,mainMaccess,mainRead,mainWrite);

wire writeLM,writeLRUM,writeTagM,writeCM,Miss;

CacheDatapath CD (clk,address,writeLM,writeLRUM,writeTag,writeCWay,inblock,Miss,outblock);

CacheController CC (clk,rst,memoryAccessC,memoryReadyM,Miss,read,write,memoryReadyC,memoryAccessM,writeLM,writeLRUM,writetagM,writeCM,writeM,readM);

endmodule
