`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/20/2021 07:16:28 AM
// Design Name: 
// Module Name: Display_Reg
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


module Display_Reg(
    input Clk, Reset,
    output [7:0] disp
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
 
assign disp = (state_reg == S0)? 8'hC7:(state_reg == S1)? 8'hA3
          :(state_reg==S2)?8'hC7:(state_reg==S3)?8'hEF:(state_reg==S4)?8'h89
          :8'hFF;
    
endmodule
