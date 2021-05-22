`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/13/2021 11:04:41 AM
// Design Name: 
// Module Name: Comparator
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


module Comparator(
    input [9:0] CompA,  //from Adder
    input [9:0] CompB,  //from Stop
    output Comp_Out
    );
    reg compare;    //since I can't directly manipulate inputs and outputs
    
    always @(CompA, CompB)
        begin
        if (CompA == CompB)
            compare = 1'b1;
        else
            compare = 1'b0;
        end
    
    assign Comp_Out = compare;
    
endmodule
