`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    22:27:28 02/04/2024 
// Design Name: 
// Module Name:    syncroner 
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
module syncroner(clk, hsync, vsync, video_on, h_counter, v_counter
    );
	 
input clk;
output hsync, vsync, video_on;
output [15:0] h_counter, v_counter;

wire [15:0] h_counter_val, v_counter_val;
wire v_counter_e, clk_in;

Clock_divider clock_divider_inst(.clock_in(clk),.clock_out(clk_in));
h_counter vga_h_counter(.clk(clk_in), .v_counter_e(v_counter_e), .h_counter_val(h_counter_val));
v_counter vga_v_counter(.clk(clk_in), .v_counter_e(v_counter_e), .v_counter_val(v_counter_val));

assign hsync = (h_counter_val<95) ? 0:1;
assign vsync = (v_counter_val<2) ? 0:1;
assign video_on = (h_counter_val<=784 && h_counter_val>143 && v_counter_val<=515 && v_counter_val>35) ? 1:0;
assign h_counter = h_counter_val;
assign v_counter = v_counter_val;

endmodule
