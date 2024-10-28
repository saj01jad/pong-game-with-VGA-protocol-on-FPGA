`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    00:42:34 02/07/2024 
// Design Name: 
// Module Name:    color 
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
module color(clk, key1, key2, key3, key4, h_counter, v_counter,red,green,blue,fell
    );
	 
input clk, key1, key2, key3, key4;
input [15:0] h_counter, v_counter;
output reg [3:0] red,green,blue;
output fell;

wire clk_o;
wire [15:0] left_b_w,right_b_w,top_b_w,botton_b_w;
wire [15:0] s_raket_1, e_raket_1, s_raket_2, e_raket_2;

bal_clk bal_clk_inst(.clock_in(clk),.clock_out(clk_o));
bal_axi bal_axi_inst(.clk(clk_o),.left(left_b_w),.right(right_b_w),.top(top_b_w),.botton(botton_b_w),.left_r1(s_raket_1),.right_r1(e_raket_1),.left_r2(s_raket_2),.right_r2(e_raket_2),.fell(fell));
/**************************/
raket_axi raket_axi_inst1(.clk(clk),.key1(key1),.key2(key2),.left(s_raket_1),.right(e_raket_1));
raket_axi raket_axi_inst2(.clk(clk),.key1(key3),.key2(key4),.left(s_raket_2),.right(e_raket_2));
//reg [15:0] s_raket_1 = 400, e_raket_1 = 500, s_raket_2 = 400, e_raket_2 = 500;
reg [15:0] h_raket_1 = 80, l_raket_1 = 70, h_raket_2 = 480, l_raket_2 = 470;
/**************************/
always @(h_counter, v_counter)begin
		if (h_counter>left_b_w && h_counter<=right_b_w && v_counter > top_b_w && v_counter < botton_b_w) begin
			red <= 4'hf;
			green <= 4'hf;
			blue <= 4'hf;
		end
		else if (h_counter>s_raket_1 && h_counter<=e_raket_1 && v_counter < h_raket_1 && v_counter > l_raket_1) begin
			red <= 4'hf;
			green <= 4'h0;
			blue <= 4'h0;
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
end
endmodule
