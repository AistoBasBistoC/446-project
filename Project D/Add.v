`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/13/2021 11:04:41 AM
// Design Name: 
// Module Name: Add
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


module Add(
    input [3:0] LSC_In,
    input [5:0] Mul10_In,   
    input [9:0] Mul100_In, 
    output [9:0] Sum_Out
    );
    reg [9:0] out;
    
    always @(LSC_In, Mul10_In, Mul100_In)
        out = LSC_In + Mul10_In + Mul100_In;
    
    assign Sum_Out = out;
    
endmodule
