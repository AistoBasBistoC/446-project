`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/06/2021 05:42:58 AM
// Design Name: 
// Module Name: Top
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


module Top(
    input clk, reset,
    input [7:0] AN,
    output [7:0] display,
    output [7:0] Anode
    );
    wire Slow_Clk;
    wire [3:0] counter_out;
    
    Clock_Divider slowclk(.Clk(clk), .Reset(reset), .Slow_Clock(Slow_Clk));
    
    Counter FSM(.Clk(Slow_Clk), .Reset(reset), .Q(counter_out));
    
    Bin_7Segment decoder(.Bin(counter_out), .Seven_Segment(display));
    
    assign Anode = AN;
    
endmodule
