`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   22:46:00 02/04/2024
// Design Name:   top
// Module Name:   C:/Users/Lenovo/OneDrive/Documents/uni/FPGA/VGA_protocol/top_tb.v
// Project Name:  VGA_protocol
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: top
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module top_tb;

	// Inputs
	reg clk;

	// Outputs
	wire hsync;
	wire vsync;
	wire [3:0] red;
	wire [3:0] green;
	wire [3:0] blue;

	// Instantiate the Unit Under Test (UUT)
	top uut (
		.clk(clk), 
		.hsync(hsync), 
		.vsync(vsync), 
		.red(red), 
		.green(green), 
		.blue(blue)
	);

	initial begin
		// Initialize Inputs
		clk = 0;
	end
   initial forever #10 clk = !clk;   
endmodule

