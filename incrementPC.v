`timescale 1ns / 1ps

module incrementPC(
    input [3:0]IN,
    output [3:0]OUT
    );

	 assign OUT = IN + 1'b1;


endmodule
