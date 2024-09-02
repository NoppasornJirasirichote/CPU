`timescale 1ns / 1ps

module Register_8bits(
    input [7:0]in,
    input load,
    input clear,
    input clk,
    output reg [7:0]out
    );
	 
	 reg [7:0] file;
	 
	 always @(posedge clk)begin
		if(clear == 1)begin
			file <= 8'b0;
		end
		else if(clear == 0)begin
			if(load == 1)begin
				file <= in;
			end
		end
		out <= file;
	 end


endmodule
