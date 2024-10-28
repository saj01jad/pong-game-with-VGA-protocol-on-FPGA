`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    22:24:55 02/04/2024 
// Design Name: 
// Module Name:    v_counter 
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
module v_counter(
    input clk,
    input v_counter_e,
    output reg [15:0] v_counter_val=0
    );
	 
always@(posedge clk)begin
	if (v_counter_e)begin
		if (v_counter_val<524)
			v_counter_val <= v_counter_val+1;
		else
			v_counter_val <= 0;
	end
end
endmodule
