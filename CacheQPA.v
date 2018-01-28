`timescale 1ns / 1ps

///////////////////////////////////////////////////////////
// University: Worcester Polytechnic Institute
// Desription : Cache Queue Position Adjuster module for 2-way set associate Cache 
// Course : Computer Architecture ECE 501/ summer 2016
////////////////////////////////////////////////////////////

module CacheQPA (input E0,E1, input [1:0]w,output U0,U1,output LU,output Miss);

wire I,WayF;
wire [1:0]A;

CacheIZP 	CI (E0,E1,I,Miss,U0,U1);
CacheEncoder 	CE (w[0],w[1],Miss,WayF);
cacheMux	CM (wayF,E0,E1,I);

assign A[0] = &(U0);
assign A[1] = &(U1);

assign LU = (A[0] == 1'b1) ? 1'b0 : (A[1] == 1'b1) ? 1'b1 : 1'b0;

endmodule
