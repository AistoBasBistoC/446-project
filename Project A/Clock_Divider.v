`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/06/2021 05:32:41 AM
// Design Name: 
// Module Name: Clock_Divider
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


module Clock_Divider(
    input Clk, Reset,
    output Slow_Clock
    );
    reg [25:0] Counter = 26'b0; //26 bit counter = 1 Hz clock speed
    
    //// write a Verilog code to slow down the clock from 100 MHz to 1 Hz
    
    //Clock Divider
    always @(posedge Clk, posedge Reset)
        if(Reset)
            Counter <= 26'b0;
            else
            Counter <= Counter + 1'b1;
    
    assign Slow_Clock = Counter[25];
    
    
endmodule
