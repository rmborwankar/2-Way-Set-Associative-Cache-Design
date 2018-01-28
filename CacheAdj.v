`timescale 1ns / 1ps

///////////////////////////////////////////////////////////
// University: Worcester Polytechnic Institute
// Desription : Cache Adjuster module for 2-way set associate Cache 
// Course : Computer Architecture ECE 501/ summer 2016
////////////////////////////////////////////////////////////

module CacheAdj(input E,I,M,output U);

assign U = ((E < I) || (M == 1'b1)) ? E + 1 :
	   (E == I) ? (1'b0) : (E > I) ?
	   E : 1'b0;
 
endmodule
