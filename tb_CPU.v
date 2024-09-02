`timescale 1ns / 1ps

module TB_CPU;

	// Inputs
	reg [7:0] A;
	reg [7:0] B;
	reg Reset;
	reg Clock;

	// Outputs
	wire Halt;
	wire [3:0] state;
	wire [3:0] IRout;
	wire [7:0] Output;

	// Instantiate the Unit Under Test (UUT)
	CompleteCPU uut (
		.A(A), 
		.B(B),  
		.Reset(Reset), 
		.Clock(Clock), 
		.Halt(Halt), 
		.state(state), 
		.IRout(IRout), 
		.Output(Output)
	);

	always begin
		#10 Clock = ~Clock;
	end

	initial begin
		// Initialize Inputs
		A = 0;
		B = 0;
		Reset = 1;
		Clock = 0;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here

		A = 5;
		B = 4;
		Reset = 0;
		
		#100;

	end
      
endmodule

