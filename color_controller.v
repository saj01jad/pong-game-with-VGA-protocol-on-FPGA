`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    22:32:29 02/04/2024 
// Design Name: 
// Module Name:    color_controller 
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
module color_controller(video_in, red, green, blue, h_counter, v_counter);
input video_in;
input [15:0] h_counter, v_counter;
output reg [3:0] red, green, blue;

always @ (video_in, h_counter, v_counter)
	if (video_in) begin
		if (h_counter>143 && h_counter<=303) begin
			red <= 4'hf;
			green <= 4'h0;
			blue <= 4'h0;
		end
		else if (h_counter>303 && h_counter<=463) begin
			red <= 4'h0;
			green <= 4'hf;
			blue <= 4'h0;
		end 
		else if (h_counter>463 && h_counter<=623) begin
			red <= 4'h0;
			green <= 4'h0;
			blue <= 4'hf;
		end 
		else if (h_counter>623 && h_counter<=783) begin
			red <= 4'h0;
			green <= 4'h0;
			blue <= 4'h0;
		end 
	end
/*assign red = (video_in) ? 4'hf:4'h0;
assign green = (video_in) ? 4'h0:4'h0;
assign blue = (video_in) ? 4'hf:4'h0;*/
endmodule
