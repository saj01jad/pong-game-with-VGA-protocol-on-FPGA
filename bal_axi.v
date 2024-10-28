`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    00:43:33 02/07/2024 
// Design Name: 
// Module Name:    bal_axi 
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
module bal_axi(clk,left,right,top,botton,left_r1,right_r1,left_r2,right_r2,fell
    );
	 
input clk;
input [15:0] left_r1,right_r1,left_r2,right_r2;
output [15:0] left,right,top,botton;
output reg fell;

reg [15:0] left_b = 450, right_b = 465;
reg [15:0] top_b = 270, botton_b = 285;
reg [15:0] botton_r1 = 80, top_r2 = 470;
reg direct = 0;
reg [1:0] bordar = 0;
always @(posedge clk) begin
	fell <= 0;
	if (direct)begin
		case (bordar)
			0:begin //Direct
				top_b <= top_b + 1;
				botton_b <= botton_b +1;
				if (botton_b > 515)begin
					fell <= 1;
					direct <= 0;
				end
				else if (botton_b == top_r2)
					if (left_b >= left_r2 && left_b <= right_r2)begin
						direct <= 0;
						bordar <= bordar +1;
					end	
					else if (right_b >= left_r2 && right_b <= right_r2)begin
						direct <= 0;
						bordar <= 0;
					end

				end
			1:begin //right
				top_b <= top_b + 1;
				botton_b <= botton_b +1;
				left_b <= left_b+1;
				right_b <= right_b+1;
				if (left_b == 784)begin
					bordar <= 2;
				end
				if (botton_b > 515) begin
					fell <= 1;
					direct <= 0;
				end
				else if (botton_b == top_r2)
					if (left_b >= left_r2 && left_b <= right_r2)begin
						direct <= 0;
						bordar <= bordar +1;
					end	
					else if (right_b >= left_r2 && right_b <= right_r2)begin
						direct <= 0;
						bordar <= 0;
					end
			end
			2:begin //left
				top_b <= top_b + 1;
				botton_b <= botton_b +1;
				left_b <= left_b-1;
				right_b <= right_b-1;
				if (left_b == 143)begin
					bordar <= 1;
				end
				if (botton_b > 515) begin
					fell <= 1;
					direct <= 0;
				end
				else if (botton_b == top_r2)
					if (left_b >= left_r2 && left_b <= right_r2)begin
						direct <= 0;
						bordar <= bordar +1;
					end	
					else if (right_b >= left_r2 && right_b <= right_r2)begin
						direct <= 0;
						bordar <= 0;
					end
			end
			3:begin //Direct
				top_b <= top_b + 1;
				botton_b <= botton_b +1;
				if (botton_b > 515) begin
					fell <= 1;
					direct <= 0;
				end
				else if (botton_b == top_r2)
					if (left_b >= left_r2 && left_b <= right_r2)begin
						direct <= 0;
						bordar <= bordar +1;
					end	
					else if (right_b >= left_r2 && right_b <= right_r2)begin
						direct <= 0;
						bordar <= 0;
					end
			end
		endcase
	end
	/********/
	else begin
		case (bordar)
			0:	begin
				top_b <= top_b - 1;
				botton_b <= botton_b - 1;
				if (top_b < 40)begin
					fell <= 1;
					direct <= 1;
				end
				else if (top_b == botton_r1)
					if (left_b >= left_r1 && left_b <= right_r1)begin
						direct <= 1;
						bordar <= bordar +1;
					end
					else if (right_b >= left_r1 && right_b <= right_r1)begin
						direct <= 1;
						bordar <= 0;
					end
				end
			1:	begin
				top_b <= top_b - 1;
				botton_b <= botton_b - 1;
				left_b <= left_b-1;
				right_b <= right_b-1;
				if (left_b == 143)begin
					bordar <= 2;
				end
				if (top_b < 40)begin
					fell <= 1;
					direct <= 1;
				end
				else if (top_b == botton_r1)
					if (left_b >= left_r1 && left_b <= right_r1)begin
						direct <= 1;
						bordar <= bordar +1;
					end
					else if (right_b >= left_r1 && right_b <= right_r1)begin
						direct <= 1;
						bordar <= 0;
					end;
				end
			2:	begin
				top_b <= top_b - 1;
				botton_b <= botton_b - 1;
				left_b <= left_b+1;
				right_b <= right_b+1;
				if (left_b == 784)begin
					bordar <= 1;
				end
				if (top_b < 40)begin
					direct <= 1;
					fell <= 1;
				end
				else if (top_b == botton_r1)
					if (left_b >= left_r1 && left_b <= right_r1)begin
						direct <= 1;
						bordar <= bordar +1;
					end
					else if (right_b >= left_r1 && right_b <= right_r1)begin
						direct <= 1;
						bordar <= 0;
					end
				end
			3:	begin
				top_b <= top_b - 1;
				botton_b <= botton_b - 1;
				if (top_b < 40)begin
					fell <= 1;
					direct <= 1;
				end
				else if (top_b == botton_r1)
					if (left_b >= left_r1 && left_b <= right_r1)begin
						direct <= 1;
						bordar <= bordar +1;
					end
					else if (right_b >= left_r1 && right_b <= right_r1)begin
						direct <= 1;
						bordar <= 0;
					end
				end
		endcase
	end
end

assign left = left_b;
assign right = right_b;
assign top = top_b;
assign botton = botton_b;

endmodule