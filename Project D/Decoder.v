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
    input [1:0] D_in,
    output D_out0,  //ones
    output D_out1,  //tens
    output D_out2   //hundreds
    );
    reg D0, D1, D2;
    
    always @(*)
    begin
    case(D_in)
    2'b00:
    begin
    D0 <= 1'b1;
    D1 <= 1'b1;
    D2 <= 1'b0;
    end
    2'b01:
    begin
    D0 <= 1'b1;
    D1 <= 1'b0;
    D2 <= 1'b1;
    end
    2'b10:
    begin
    D0 <= 1'b0;
    D1 <= 1'b1;
    D2 <= 1'b1;
    end
    endcase
    end
    
    assign D_out0 = D0;
    assign D_out1 = D1;
    assign D_out2 = D2;

endmodule
