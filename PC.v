`timescale 1ns / 1ps

module PC(
    input [3:0]Input,
	 input clk,
    input clear,
    input load,
	 output reg [3:0]Output
    );
	 
	 reg [3:0] pcreg;
	 
	 always@(posedge clk)
	 begin
		if(clear==1)
		begin
			pcreg <= 4'b0000;
		end
		else if(clear==0)
		begin
			if(load==1)
			begin
				pcreg <= Input;
			end
		end
		Output <= pcreg;
	 end

endmodule
