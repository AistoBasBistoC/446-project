`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/13/2021 11:04:41 AM
// Design Name: 
// Module Name: Multiply10
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


module Multiply10(
    input [3:0] Counter_In,
    output [5:0] Multi_Out
    );
    reg [6:0] out;  //need extra bit for any possible carryover
    
    always@(Counter_In)
        out = Counter_In * 4'b1010;
    
    assign Multi_Out = out[5:0];
    
endmodule
