`timescale 1ns / 1ps

module ALU(
    input [7:0]A,
    input [7:0]B,
    input [1:0]sel_mode,
    output reg[7:0]ans,
	 output reg cout
    );
	 
	 
	 always@(A,B,sel_mode)begin
		if(sel_mode == 2'b00)begin
			{cout,ans} = A + B;
		end 
		else if(sel_mode == 2'b01)begin
			ans = A - B;
			cout = !ans[7];
		end
		else if(sel_mode == 2'b10)begin
			ans = A & B;
		end
		else if(sel_mode == 2'b11)begin
			ans = A | B;
		end
	 end

endmodule
