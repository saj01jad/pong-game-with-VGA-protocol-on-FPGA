`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    11:02:25 02/07/2024 
// Design Name: 
// Module Name:    debunce 
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
module debunce(
    input keyin,
    input clk,
    output keyout
    );
///////////////////////////////////////////////////////	
parameter [23:0] delay = 6'h4c4b40;
parameter [1:0] zero=2'b00, zto=2'b01, one=2'b10, otz=2'b11;
///////////////////////////////////////////////////////	
reg [4:0] cnt;
reg [1:0] state=one, next_state;
///////////////////////////////////////////////////////	
always @ (posedge clk)
	state <= next_state;
///////////////////////////////////////////////////////	
always @ (keyin, cnt)
	case (state)
		zero:
			if (keyin == 1'b0)
				next_state = zero;
			else
				next_state = zto;
		zto:
			if (keyin == 1'b0)
				next_state = zero;
			else if((keyin==1'b1)&&(cnt<delay))
				next_state = zto;
			else if ((keyin==1'b1)&&(cnt==delay))
				next_state = one;
		one:
			if(keyin == 1'b1)
				next_state = one;
			else 
				next_state = otz;
		otz:
			if (keyin == 1'b1)
				next_state = one;
			else if((keyin==1'b0)&&(cnt<delay))
				next_state = otz;
			else if ((keyin==1'b0)&&(cnt==delay))
				next_state = zero;
	endcase
///////////////////////////////////////////////////////	
always @ (posedge clk)
	case (state)
		zero:
			if (keyin == 1'b1)
				cnt <= 5'b00000;
		zto:
			if((keyin==1'b1)&&(cnt<delay))
				cnt <= cnt + 5'b00001;
		one:
			if(keyin == 1'b0)
				cnt <= 5'b00000;
		otz:
			if((keyin==1'b0)&&(cnt<delay))
				cnt <= cnt + 5'b00001;
	endcase
///////////////////////////////////////////////////////	
assign keyout = (state == zero)?1'b0:
					 (state == zto)?1'b0:
					 (state == one )?1'b1:1'b1;
///////////////////////////////////////////////////////	
endmodule
