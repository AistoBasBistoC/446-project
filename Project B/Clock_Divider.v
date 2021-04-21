`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/20/2021 07:04:12 AM
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
    output Slow_Clk
    );
  
  reg [17:0] count;
  
  always @(posedge Reset,posedge Clk )
  begin
  if(Reset)
  count <= 17'b0;
  else
  count <= count + 1'b1;
  end
   
   assign Slow_Clk = count[17]; 
endmodule
