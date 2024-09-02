`timescale 1ns / 1ps

module IR(
	 input [7:0]Input,
    output reg[3:0]IR_CU,
    output reg[3:0]IR_DTP,
    input load,
    input clear,
	 input clk
    );
	 
	 
	 reg [7:0] IRout;
	 
	 
	 always@(posedge clk)
     begin
        if(clear==1)
        begin
         IRout <= 8'b0;
        end
        else if(clear==0)
        begin
            if(load==1)begin
					 IRout <= Input;
				end
        end
		  
		  IR_DTP <= IRout[3:0];
		  IR_CU <= IRout[7:4];
		  
     end
	  
endmodule
