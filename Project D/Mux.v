`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/02/2021 11:27:01 AM
// Design Name: 
// Module Name: Mux
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


module Mux(
    input [3:0] in_0,   //ones 
    input [3:0] in_1,   //tens 
    input [3:0] in_2,   //hundreds 
    input [3:0] in_3,   //ignored 
    input [1:0] Sel,
    output reg [3:0] Mux_out
    );
    
    always@(*)
    begin
    case(Sel)
    2'b00: Mux_out = in_0;
    2'b01: Mux_out = in_1;
    2'b10: Mux_out = in_2;
    endcase
    end
    
endmodule
