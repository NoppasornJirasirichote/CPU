`timescale 1ns / 1ps

module ROM(
    input [3:0]Address,
    input clk,
    output reg [7:0]Output
    );
	 
	 reg [7:0] rom [15:0];
	 
	 always@(posedge clk)
	 begin
		
		rom[0] <= 8'b0011_0000; // in a
		rom[1] <= 8'b0100_0000; // in b
		rom[2] <= 8'b0101_0000; // alu
		rom[3] <= 8'b0110_0000; // out
		rom[4] <= 8'b0111_0010; // branch
		rom[5] <= 8'b1000_0000; // halt
		Output <= rom[Address];
		
	 end


endmodule
