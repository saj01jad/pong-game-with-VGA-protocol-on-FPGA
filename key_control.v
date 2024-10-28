`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    23:31:05 02/04/2024 
// Design Name: 
// Module Name:    key_control 
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
module key_control(red, green, blue, key1, key2, key3, key4, video_on);
	 
input key1, key2, key3, key4, video_on;
output reg [3:0] red, green, blue;

always @(key1, key2, key3, key4)begin
	//if (video_on)
		if (!key1)begin
			red <= 4'h0;
			green <= 4'h0;
			blue <= 4'hf;
		end
		else if (!key2)begin
			red <= 4'h0;
			green <= 4'hf;
			blue <= 4'h0;
		end
		else if (!key3)begin
			red <= 4'hf;
			green <= 4'h0;
			blue <= 4'h0;
		end
		else if (!key4)begin
			red <= 4'hf;
			green <= 4'hf;
			blue <= 4'hf;
		end
		else begin
			red <= 4'hf;
			green <= 4'hf;
			blue <= 4'hf;
		end
end
endmodule
