`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    23:42:34 02/07/2024 
// Design Name: 
// Module Name:    clk_bazz 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module clk_bazz(clock_in,clock_out
    );
input clock_in; // input clock on FPGA
output reg clock_out; // output clock after dividing the input clock by divisor
	reg[27:0] counter=28'd0;
	parameter DIVISOR = 28'd01000000;
	// The frequency of the output clk_out
	//  = The frequency of the input clk_in divided by DIVISOR
	// For example: Fclk_in = 50Mhz, if you want to get 1Hz signal to blink LEDs
	// You will modify the DIVISOR parameter value to 28'd50.000.000
	// Then the frequency of the output clk_out = 50Mhz/50.000.000 = 1Hz
	always @(posedge clock_in)
	begin
	 counter <= counter + 28'd1;
	 if(counter>=(DIVISOR-1))
	  counter <= 28'd0;

	 clock_out <= (counter<DIVISOR/2)?1'b1:1'b0;

	end
endmodule
