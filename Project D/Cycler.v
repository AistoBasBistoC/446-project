`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/21/2021 08:42:11 PM
// Design Name: 
// Module Name: Cycler
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


module Cycler(
    input Clk,
    input Reset,
    output [1:0] Cycle_Out
    );
    reg [1:0] PS, NS; //Present state, Next state
    
    //State declarations
    parameter S0 = 2'b00;
    parameter S1 = 2'b01;
    parameter S2 = 2'b10;
    
    //Reset + Cycle through states
    always@(posedge Clk, posedge Reset)
    if(Reset)
        PS <= S0;
        else
        PS <= NS;
        
    //State Transitions
    always@(*)
    case(PS)
    S0: NS <= S1;
    S1: NS <= S2;
    S2: NS <= S0;
    default: NS <= S0;
    endcase
    
    assign Cycle_Out = PS;
endmodule
