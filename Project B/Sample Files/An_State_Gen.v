`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/20/2021 07:43:12 AM
// Design Name: 
// Module Name: An_State_Gen
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module An_State_Gen(
    input Clk, Reset,
    output [4:0] An
    );
    
    // Refer Lecture Slide 7
  reg [2:0] state_reg, state_next;
  parameter S0 = 3'b000;
  parameter S1 = 3'b001;
  parameter S2 = 3'b010;
  parameter S3 = 3'b011;
  parameter S4 = 3'b100;

//state register
always @(posedge Reset, posedge Clk)
if(Reset) state_reg <= S0;
else
state_reg <= state_next;

//Combiinational Logic
always @(*)
case (state_reg)
S0: state_next = S1;
S1: state_next = S2;
S2: state_next = S3;
S3: state_next = S4;
S4: state_next = S0;
 default:state_next = S0;
 endcase   
 
assign An = (state_reg == S0)? 5'b11110:(state_reg == S1)? 5'b11101
          :(state_reg==S2)?5'b11011:(state_reg==S3)?5'b10111:(state_reg==S4)?5'b01111
          :5'b11111;
endmodule
