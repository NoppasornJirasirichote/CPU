`timescale 1ns / 1ps

module Datapath(
    input [7:0]A,
    input [7:0]B,
    input A_select,
    input Aload,
    input Bload,
    input [1:0]SelectMode,
    input IRload,
    input PCload,
	 input ANSload,
    input Jump_Sel,
    input Reset,
    input Clk,
	 output reg StopProgram,
    output [7:0]Output,
    output [3:0]IR_CU,
	 output cout
    );
	 
	 wire [7:0] OutMuxA,OutMuxB;
	 wire [7:0] OutRegA,OutRegB,KeepANS;
	 
	 assign KeepANS = Output;
	 
	 assign ANSresult = A + (5 * B);
	 
	 always @(*)begin
		 if(KeepANS < ANSresult)
			StopProgram <= 1;
		 else if(KeepANS == ANSresult)
			StopProgram <= 0;
	 end
	 
	 mux2to1_8bits ThismuxA(.in0(Output),.in1(A),.sel(A_select),.out(OutMuxA));
	 Register_8bits ThisregA(.in(OutMuxA),.load(Aload),.clear(Reset),.clk(Clk),.out(OutRegA));
	 Register_8bits ThisregB(.in(B),.load(Bload),.clear(Reset),.clk(Clk),.out(OutRegB));
	 ALU calculator(.A(OutRegA),.B(OutRegB),.sel_mode(SelectMode),.ans(Output),.cout(cout));
	 
	 wire [3:0] IROUT;
	 wire [7:0] ROMout;
	 wire [3:0] outJSM;
	 wire [3:0] PCplusONE,addPC;
	 
	 IR ThisIR(.Input(ROMout),.load(IRload),.clear(Reset),.clk(Clk),.IR_CU(IR_CU),.IR_DTP(IROUT));
	 JSM ThisJSM(.in0(PCplusONE),.in1(IROUT),.sel(Jump_Sel),.out(outJSM));
	 PC ThisPC(.Input(outJSM),.load(PCload),.clear(Reset),.clk(Clk),.Output(addPC));
	 incrementPC ThisPLUS1(.IN(addPC),.OUT(PCplusONE));
	 ROM ThisROM(.Address(addPC),.clk(Clk),.Output(ROMout));

endmodule
