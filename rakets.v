`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    19:32:26 02/05/2024 
// Design Name: 
// Module Name:    rakets 
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
module rakets(h_counter, v_counter, red, green, blue);

input [15:0] h_counter, v_counter;
output reg [3:0] red, green, blue;

reg [15:0] s_raket_1 = 400, e_raket_1 = 500, s_raket_2 = 400, e_raket_2 = 500;
reg [15:0] h_raket_1 = 80, l_raket_1 = 70, h_raket_2 = 480, l_raket_2 = 470;

always @(h_counter, v_counter)
		if (h_counter>s_raket_1 && h_counter<=e_raket_1 && v_counter < h_raket_1 && v_counter > l_raket_1) begin
			red <= 4'h0;
			green <= 4'h0;
			blue <= 4'hf;
		end
		else if (h_counter>s_raket_2 && h_counter<=e_raket_2 && v_counter < h_raket_2 && v_counter > l_raket_2) begin
			red <= 4'h0;
			green <= 4'hf;
			blue <= 4'h0;
		end
		else begin
			red <= 4'h0;
			green <= 4'h0;
			blue <= 4'h0;
		end
endmodule
