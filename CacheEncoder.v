`timescale 1ns / 1ps

///////////////////////////////////////////////////////////
// University: Worcester Polytechnic Institute
// Desription : Cache Encoder module for 2-way set associate Cache 
// Course : Computer Architecture ECE 501/ summer 2016
////////////////////////////////////////////////////////////

module CacheEncoder(input W0,W1,output Miss,output WayF);

assign  WayF = (W0 == 1'b1) ? 1'b0 : (W1 == 1'b1) ? 1'b1 : 1'b0;
assign Miss = (W0 || W1) ? 1'b0 : 1'b1 ;

endmodule


