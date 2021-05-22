`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/21/2021 07:10:45 PM
// Design Name: 
// Module Name: Multiply100
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


module Multiply100(
    input [3:0] Counter_In,
    output [9:0] Multi_Out  
    );
    reg [10:0] out; //need carry bit just in case
    
    always@(Counter_In)
        out = Counter_In * 7'b1100100;
        
    assign Multi_Out = out[9:0];
    
endmodule
