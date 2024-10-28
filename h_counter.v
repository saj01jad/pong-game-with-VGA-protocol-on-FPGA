`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    22:24:18 02/04/2024 
// Design Name: 
// Module Name:    h_counter 
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
module h_counter(
    input clk,
    output reg v_counter_e=0,
    output reg [15:0] h_counter_val=0
    );
	 
always@(posedge clk)begin
	if (h_counter_val<799) begin
		h_counter_val <= h_counter_val+1;
		v_counter_e <= 0;
	end
	else begin
		h_counter_val <= 0;
		v_counter_e <= 1;
	end
end
endmodule
