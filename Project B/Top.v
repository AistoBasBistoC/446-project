`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/20/2021 07:52:32 AM
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
    input Clk, Reset,
    output [7:0] Anode,
    output [7:0] Display
    );
    wire s_clock;
    wire [4:0] An_t;
    
    Clock_Divider U0 (.Clk(Clk), .Reset(Reset), .Slow_Clk(s_clock));
    Display_Reg  U1 (.Clk(s_clock), .Reset(Reset), .disp(Display));
    An_State_Gen U2 (.Clk(s_clock), .Reset(Reset), .An(An_t));
    
    assign Anode = {3'b111,An_t[4:0]};
    
endmodule
