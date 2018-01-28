`timescale 1ns / 1ps

///////////////////////////////////////////////////////////
// University: Worcester Polytechnic Institute
// Desription : Cache Datapath module for 2-way set associate Cache 
// Course : Computer Architecture ECE 501/ summer 2016
////////////////////////////////////////////////////////////

module CacheDatapath(input clk,input [15:0]address,input writeLM,writeLRUM,writeTag,writeCWay,input [32*8-1:0]inblock,output Miss,output [32*8-1:0] outblock);

wire [1:0]WF;
wire ReplaceWay;
wire [1:0]writeArrayT,writeArrayC,Array1;

CacheCompleteLRU CCLRU (clk,writeLM,writeLRUM,address[7:5],WF,ReplaceWay,Miss);

CacheTagArray 	 CTA	(clk,address[7:5],writeArrayT,address[15:8],WF);

CacheWayArray 	 CWA	(clk,address[7:5],writearrayC,WF,inblock,outblock);

assign writeArrayT = writeTag & (Array1);

assign Array1 = (ReplaceWay == 1'b0) ? 2'b01 : (ReplaceWay == 1'b1) ? 2'b10 : 2'b00;

assign writeArrayC = ((Miss) & (writeCWay) & (Array1)) || ((~Miss) & (writeCWay) & (WF));

endmodule
