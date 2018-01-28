`timescale 1ns / 1ps

///////////////////////////////////////////////////////////
// University: Worcester Polytechnic Institute
// Desription : Cache Mux module for 2-way set associate Cache 
// Course : Computer Architecture ECE 501/ summer 2016
////////////////////////////////////////////////////////////

module CacheMux(input sel, input in0,in1,output out);

assign out = (sel == 1'b0) ? in0 : (sel == 1'b1) ? in1 : 1'b0; 

endmodule
