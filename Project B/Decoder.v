`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/02/2021 11:27:01 AM
// Design Name: 
// Module Name: Decoder
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


module Decoder(
    input D_in,
    output D_out0,
    output D_out1
    );
    reg D0, D1;
    
    always @(*)
        if(D_in)
            begin
            D0 <= 0;
            D1 <= 1;
            end
        else
            begin
            D0 <= 1;
            D1 <= 0;
            end

    assign D_out0 = D0;
    assign D_out1 = D1;

endmodule
