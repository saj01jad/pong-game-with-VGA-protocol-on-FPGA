`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    11:04:29 02/07/2024 
// Design Name: 
// Module Name:    LtoP 
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
module LtoP(
    input din,
	 input clk,
    output reg dout
    );

reg current_state, previus_state;

always @(posedge clk) begin
	previus_state = current_state;
	current_state = din;
	if ((current_state == 1'b0)&&(previus_state == 1'b1))
		dout = 1'b1;
	else
		dout = 1'b0;
end

endmodule
