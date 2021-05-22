`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/02/2021 11:27:01 AM
// Design Name: 
// Module Name: ClockDivider
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


module ClockDivider(
    input Clk,
    input Reset,
    output N_Clk1Hz,
    output N_Clk381Hz
    );
    reg [25:0] counter1 = 26'b0;    //26-bit counter = 1Hz
    reg [18:0] counter2 = 19'b0;    //18-bit counter = 381Hz
    
    //Clock Divider (1Hz and 381Hz)
    always @(posedge Clk, posedge Reset)
        if(Reset)
            begin
            counter1 <= 26'b0;
            counter2 <= 19'b0;
            end
            
            else
            begin
            counter1 <= counter1 + 1'b1;
            counter2 <= counter2 + 1'b1;
            end
            
    
    assign N_Clk1Hz = counter1[25];
    assign N_Clk381Hz = counter2[18];
            
endmodule
