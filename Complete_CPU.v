`timescale 1ns / 1ps

module CompleteCPU(
    input [7:0]A,
    input [7:0]B,
    input Reset,
    input Clock,
	 output Halt,
	 output [3:0]state,
	 output [3:0]IRout,
    output [7:0]Output,
	 output cout
    );
	 
	 wire [1:0] SelectMode;
	 wire [3:0] IR_CU;
	 wire Jump_Sel;
	 wire IRload,PCload,Asel,Aload,Bload,ANSload;
	 wire Stop;
	 
	 ControlUnit cu(.IR_CU(IR_CU),.Reset(Reset),.Clk(Clock),.IRload(IRload),.Jump_SelMode(Jump_Sel),.PCload(PCload),.A_sel(Asel),.Aload(Aload),.Bload(Bload),.Sel_Mode(SelectMode),.Halt(Halt),.OUTPUT(state),.StopProgram(Stop));
	 
	 Datapath dtp(.cout(cout),.A(A),.B(B),.A_select(Asel),.Aload(Aload),.Bload(Bload),.SelectMode(SelectMode),.IRload(IRload),.PCload(PCload),.Jump_Sel(Jump_Sel),.Reset(Reset),.Clk(Clock),.Output(Output),.IR_CU(IR_CU),.StopProgram(Stop));

	 assign IRout = IR_CU;

endmodule
