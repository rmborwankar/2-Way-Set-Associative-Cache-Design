`timescale 1ns / 1ps

///////////////////////////////////////////////////////////
// University: Worcester Polytechnic Institute
// Desription : Cache INC/Zero/Pass module for 2-way set associate Cache 
// Course : Computer Architecture ECE 501/ summer 2016
////////////////////////////////////////////////////////////

module CacheIZP (input E0,E1,I,M,output U0,U1);
wire E [0:1];
wire U [0:1];

assign E[0] = E0;
assign E[1] = E1; 

CacheAdj CA0 (E[0],I,M,U[0]);
CacheAdj CA1 (E[1],I,M,U[1]);

assign U0 = U[0];
assign U1 = U[1];

endmodule

