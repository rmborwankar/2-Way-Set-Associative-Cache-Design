`timescale 1ns / 1ps

///////////////////////////////////////////////////////////
// University: Worcester Polytechnic Institute
// Desription : Cache Controller module for 2-way set associate Cache 
// Course : Computer Architecture ECE 501/ summer 2016
////////////////////////////////////////////////////////////

module CacheController(input clk,rst,memoryAccessC,memoryReadyM,Miss,read,write,output reg memoryReadyC,memoryAccessM,writeLM,writeLRUM,writeTagM,writeCM,writeM,readM);

reg [3:0] ns,ps;

always @(posedge clk)begin
	if(rst == 1'b1)
		ps <= 4'b0000;
	else 
		ps <= ns;
end

always @(memoryAccessC,memoryReadyM,Miss,read,write,ps)begin

	ns = 0;
case (ps)
	0: begin
		if(memoryAccessC == 1'b1) ns = 1;
		else ns = 0;
	end
	1: begin
		if (Miss == 1'b0 && read == 1'b1)
		ns = 2;
		else if (Miss == 1'b0 && write == 1'b1)
		ns = 3;
		else if (Miss == 1'b1 && read == 1'b1)
		ns = 4;
		else if (Miss == 1'b1 && write == 1'b1)
		ns = 6;
		else 
		ns = 1;
	end
	2: ns = 0;
	3: ns = 0;
	4: begin
		if (memoryReadyM == 1'b1)
		ns = 5;
		else 
		ns = 4;
	end
	5: ns = 0;
	6: begin
		if (memoryReadyM == 1'b1)
		ns = 7;
		else
		ns = 6;
	end
	7: ns = 0;
	default : ns = 0;
endcase
end

always @(ps)begin

memoryReadyC = 1'b0; writeLRUM = 1'b0; writeLM = 1'b0;writeCM = 1'b0; memoryAccessM = 1'b0; writeM = 1'b0;
readM = 1'b0; writeTagM = 1'b0;

case (ps)
	0: memoryReadyC = 1'b1;
	1: ;
	2: begin
		memoryReadyC = 1'b1;
		writeLRUM = 1'b1;
		writeLM = 1'b1;
	end
	3: begin
		writeLM = 1'b1;
		writeLRUM = 1'b1;
		writeCM = 1'b1;
		memoryAccessM = 1'b1;
		writeM = 1'b1;
	end
	4: begin
		memoryAccessM = 1'b1;
		readM = 1'b1;
	end
	5: begin
		writeCM = 1'b1;
		writeLM = 1'b1;
		writeLRUM = 1'b1;
		writeTagM = 1'b1;
	end
	6: begin
		memoryAccessM = 1'b1;
		writeM = 1'b1;
	end
	7: begin
		writeCM = 1'b1;
		writeLM = 1'b1;
		writeLRUM = 1'b1;
		writeTagM = 1'b1;
	end
	default : ;
endcase
end
endmodule
	