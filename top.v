`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    22:34:54 02/04/2024 
// Design Name: 
// Module Name:    top 
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
module top(clk, hsync, vsync, red, green, blue, key1, key2, key3, key4,out);

input clk, key1, key2, key3, key4;
output [3:0] red, green, blue;
output hsync, vsync, out;

wire video_on, key_w_1, key_w_2, key_w_3, key_w_4, key_l_1, key_l_2, key_l_3, key_l_4, fell;
wire [15:0] h_counter, v_counter;

debunce deb_inst1(.keyin(key1), .clk(clk), .keyout(key_w_1));
debunce deb_inst2(.keyin(key2), .clk(clk), .keyout(key_w_2));
debunce deb_inst3(.keyin(key3), .clk(clk), .keyout(key_w_3));
debunce deb_inst4(.keyin(key4), .clk(clk), .keyout(key_w_4));

LtoP LtoP_inst1(.din(key_w_1),.clk(clk),.dout(key_l_1));
LtoP Ltop_inst2(.din(key_w_2),.clk(clk),.dout(key_l_2));
LtoP LtoP_inst3(.din(key_w_3),.clk(clk),.dout(key_l_3));
LtoP Ltop_inst4(.din(key_w_4),.clk(clk),.dout(key_l_4));

bazz bazz_inst(.clk(clk), .fell(fell), .out(out));

color color_inst(.clk(clk),.key1(key_l_1),.key2(key_l_2),.key3(key_l_3),.key4(key_l_4),.h_counter(h_counter), .v_counter(v_counter),.red(red),.green(green),.blue(blue),.fell(fell));
//rakets(.h_counter(h_counter), .v_counter(v_counter), .red(red), .green(green), .blue(blue));
syncroner sync_inst(.clk(clk), .hsync(hsync), .vsync(vsync), .video_on(video_on), .h_counter(h_counter), .v_counter(v_counter));
//color_controller color_controller_inst(.video_in(video_on), .red(red), .green(green), .blue(blue), .h_counter(h_counter), .v_counter(v_counter));
//key_control(.red(red), .green(green), .blue(blue), .key1(key1), .key2(key2), .key3(key3), .key4(key4), .video_on(video_on));
endmodule
