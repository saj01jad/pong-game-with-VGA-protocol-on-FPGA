`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    23:40:40 02/07/2024 
// Design Name: 
// Module Name:    bazz 
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
module bazz(clk, fell, out);

input clk, fell;
output reg out;

wire clk_in;

clk_bazz clk_bazz_inst(.clock_in(clk),.clock_out(clk_in));

always @(posedge clk_in)
	if (fell)
		out <= 0;
	else 
		out <= 1;
		
endmodule
