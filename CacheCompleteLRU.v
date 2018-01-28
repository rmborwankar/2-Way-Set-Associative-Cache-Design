`timescale 1ns / 1ps

///////////////////////////////////////////////////////////
// University: Worcester Polytechnic Institute
// Desription : Cache LRU Complete module for 2-way set associate Cache 
// Course : Computer Architecture ECE 501/ summer 2016
////////////////////////////////////////////////////////////

module CacheCompleteLRU(input clk,writeLM,writeLRUM,input [2:0]index,input[1:0] WF,output ReplaceWay,Miss);

wire e0,e1,u0,u1;
wire lu;


CacheQPA	CQPA (e0,e1,WF,u0,u1,lu,Miss);

CacheLeastMemory CLM (clk,writeLM,lu,index,ReplaceWay);

CacheLRUMemory  CLRUM (clk,writeLRUM,{u1,uo},index,{e1,e0});


endmodule
