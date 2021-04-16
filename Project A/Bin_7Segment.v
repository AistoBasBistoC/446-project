`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/06/2021 05:33:47 AM
// Design Name: 
// Module Name: Bin_7Segment
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


module Bin_7Segment(
    input [3:0] Bin,
    output reg [7:0] Seven_Segment
    );
    
    always@(*)
    begin
    case(Bin)
    4'b0000: Seven_Segment = 8'hC0; //0
    4'b0001: Seven_Segment = 8'hF9; //1
    4'b0010: Seven_Segment = 8'hA4; //2
    4'b0011: Seven_Segment = 8'hB0; //3
    4'b0100: Seven_Segment = 8'h99; //4
    4'b0101: Seven_Segment = 8'h92; //5
    4'b0110: Seven_Segment = 8'h82; //6
    4'b0111: Seven_Segment = 8'hF8; //7
    4'b1000: Seven_Segment = 8'h80; //8
    4'b1001: Seven_Segment = 8'h90; //9
    endcase
    end
endmodule
