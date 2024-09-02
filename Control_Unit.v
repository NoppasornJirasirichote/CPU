`timescale 1ns / 1ps

module ControlUnit(
    input [3:0] IR_CU,
	 input Reset,
    input Clk,
	 input StopProgram,
    output reg IRload,
    output reg Jump_SelMode,
    output reg PCload,
    output reg A_sel,
    output reg Aload,
    output reg Bload,
    output reg [1:0] Sel_Mode,
	 output reg Halt,
	 output [3:0]OUTPUT
    );
	 
	 wire [3:0] IR_CU;
	 
	 parameter start = 4'b0000,fetch = 4'b0001,decode = 4'b0010,inA = 4'b0011,inB = 4'b0100,add = 4'b0101,OUT=4'b0110,JSM =4'b0111,HALT=4'b1000;

	 reg [3:0] state;
	 
	 always @(posedge Clk) begin
	 if(Reset == 1)
	 state = start;
	 else begin
	 case(state)
		 start : state = fetch;
		 
		 fetch : state = decode;
		 
		 decode : if(IR_CU == 4'b0011)begin
						state = inA;
					 end
					 else if(IR_CU == 4'b0100)begin
						state = inB;
					 end
					 else if(IR_CU == 4'b0101)begin
						state = add;
					 end
					 else if(IR_CU == 4'b0110)begin
						state = OUT;
					 end
					 else if(IR_CU == 4'b0110)begin
						state = JSM;
					 end
					 else if(IR_CU == 4'b0111)begin
						state = HALT;
					 end
					 
		 inA : state = start;
		 
		 inB : state = start;
		 
		 add : state = start;
		 
		 OUT : state = start;
		 
		 JSM : state = start;
		 
		 HALT : state = HALT;
		 
		 default: state = HALT;
		 
		 endcase
		 end
		 end
	 
	 always @(posedge Clk)
		begin : FSM_OUT
		 if(Reset == 1'b1)begin
				IRload <= 1'b0;
				PCload <= 1'b0;
				Jump_SelMode <= 1'b0;
				A_sel <= 1'b0;
				Aload <= 1'b0;
				Bload <= 1'b0;
				Sel_Mode <= 2'b0;
				Halt <= 1'b0;
		 end
		 else if (Reset == 1'b0) begin
			 case(state)
				 start : begin
								IRload <= 1'b0;
								PCload <= 1'b0;
								Jump_SelMode <= 1'b0;
								A_sel <= 1'b0;
								Aload <= 1'b0;
								Bload <= 1'b0;
								Sel_Mode <= 2'bx;
								Halt <= 1'b0;
							end
				 fetch : begin
								IRload <= 1'b1;
								PCload <= 1'b1;
								Jump_SelMode <= 1'b0;
								A_sel <= 1'b0;
								Aload <= 1'b0;
								Bload <= 1'b0;
								Sel_Mode <= 2'bx;
								Halt <= 1'b0;
							end
				 decode : begin
								IRload <= 1'b0;
								PCload <= 1'b0;
								Jump_SelMode <= 1'b0;
								A_sel <= 1'b0;
								Aload <= 1'b0;
								Bload <= 1'b0;
								Sel_Mode <= 2'bx;
								Halt <= 1'b0;
							end
				 inA : begin
								IRload <= 1'b0;
								PCload <= 1'b0;
								Jump_SelMode <= 1'b0;
								A_sel <= 1'b1;
								Aload <= 1'b1;
								Bload <= 1'b0;
								Sel_Mode <= 2'bx;
								Halt <= 1'b0;
							end
				 inB : begin
								IRload <= 1'b0;
								PCload <= 1'b0;
								Jump_SelMode <= 1'b0;
								A_sel <= 1'b0;
								Aload <= 1'b0;
								Bload <= 1'b1;
								Sel_Mode <= 2'bx;
								Halt <= 1'b0;
							end
				add : begin
								IRload <= 1'b0;
								PCload <= 1'b0;
								Jump_SelMode <= 1'b0;
								A_sel <= 1'b0;
								Aload <= 1'b1;
								Bload <= 1'b1;
								Sel_Mode <= 2'b11;
								Halt <= 1'b0;
							end			
				OUT : begin
								IRload <= 1'b0;
								PCload <= 1'b0;
								Jump_SelMode <= 1'b0;
								A_sel <= 1'b0;
								Aload <= 1'b0;
								Bload <= 1'b0;
								Sel_Mode <= 2'bx;
								Halt <= 1'b0;
							end
				JSM : begin
								if(StopProgram == 1)begin
									PCload <= 1'b1;
									IRload <= 1'b0;
									Jump_SelMode <= 1'b1;
									A_sel <= 1'b0;
									Aload <= 1'b0;
									Bload <= 1'b0;
									Sel_Mode <= 2'bx;
									Halt <= 1'b0;
								end else if(StopProgram == 0) begin
									PCload <= 1'b0;
									IRload <= 1'b0;
									Jump_SelMode <= 1'b1;
									A_sel <= 1'b0;
									Aload <= 1'b0;
									Bload <= 1'b0;
									Sel_Mode <= 2'bx;
									Halt <= 1'b0;
								end
							end
				HALT : begin
								IRload <= 1'b0;
								PCload <= 1'b0;
								Jump_SelMode <= 2'b0;
								A_sel <= 1'b0;
								Aload <= 1'b0;
								Bload <= 1'b0;
								Sel_Mode <= 1'bx;
								Halt <= 1'b1;
							end
			 endcase
	 
		 end
		 
	 end
	 
	 assign OUTPUT = state;

endmodule
