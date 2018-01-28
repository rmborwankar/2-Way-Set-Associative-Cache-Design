`timescale 1ns / 1ps

///////////////////////////////////////////////////////////
// University: Worcester Polytechnic Institute
// Desription : Cache Test  module for 2-way set associate Cache 
// Course : Computer Architecture ECE 501/ summer 2016
////////////////////////////////////////////////////////////

module CacheTest();

reg clk,reset,write,read,memaccess,mainMready;
reg[15:0]address;
reg [32*8-1:0]inblock;
wire[32*8-1:0]outblock;
wire memReady,mainMaccess,mainRead,mainWrite;

integer i,j;

Cache 		C(clk,reset,write,read,memaccess,mainMready,address,inblock,outblock,memReady,mainMaccess,mainRead,mainWrite);
MainMemory	M(clk,mainRead,mainWrite,mainMaccess,address,inblock,outblock,mainMready);

always #10 clk = ~clk;

initial begin
clk = 1'b1;
reset = 1'b1;
#10;
reset = 1'b0;
#10;

end
always @(posedge clk) begin
write <= 1'b0;
read <= 1'b0;
memaccess <= 1'b0;
mainMready <= 1'b0;
for (i = 0; i < 20 ; i = i + 1)begin
	inblock <= $random;
	address <= 16'h1000;
	write <= 1'b1;
	read <= 1'b0;
	memaccess <= 1'b1;
	for (j = 0; j < 256; j = j + 1)begin
		address <= address + 1;
		inblock <= inblock + 1;
	end
end
end
endmodule
