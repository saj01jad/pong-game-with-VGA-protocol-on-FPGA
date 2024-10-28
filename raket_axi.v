`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    02:12:18 02/07/2024 
// Design Name: 
// Module Name:    raket_axi 
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
module raket_axi(clk, key1, key2, left, right
    );
	 
input clk, key1, key2;
output [15:0] left,right;


reg [15:0] left_b = 400;
reg [15:0] right_b = 500;
reg direct = 1;

always @(posedge clk) begin
	if (key2)begin
		left_b <= left_b + 10;
		right_b <= right_b + 10;
		if (right_b > 784)
			direct <= 0;
	end
	else if (key1)begin
		left_b <= left_b - 10;
		right_b <= right_b - 10;
		if (right_b < 143)
			direct <= 0;
	end
end

assign left = left_b;
assign right = right_b;

endmodule
