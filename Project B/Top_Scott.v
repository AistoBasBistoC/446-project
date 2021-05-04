`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/20/2021 07:52:32 AM
// Design Name: 
// Module Name: Top
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


module Top(
    input Clk, Reset,
    output [7:0] Anode,
    output [7:0] Display
    );
    wire Clk1Hz, Clk381Hz, Counter1Q;
    wire [1:0] An_t;
    wire [3:0] Counter1Out, Counter2Out, MuxOut;
    
    ClockDivider Clock_Divider (.Clk(Clk), .Reset(Reset), .N_Clk1Hz(Clk1Hz), .N_Clk381Hz(Clk381Hz));
    Counter Ones_Cntr (.Clk(Clk1Hz), .Reset(Reset), .D(Counter1Out), .Q(Counter1Q));
    Counter Tens_Cntr (.Clk(Counter1Q), .Reset(Reset), .D(Counter2Out), .Q(1'b0));
    Decoder Decoder (.D_in(Clk381Hz), .D_out0(An_t[0]), .D_out1(An_t[1]));
    Mux Mux (.in_0(Counter1Out), .in_1(Counter2Out), .Sel(Clk381Hz), .Mux_out(MuxOut));
    Decoder7Seg Decoder_Bin7Seg (.Bin(MuxOut), .Seven_Seg(Display));
    
    assign Anode = {6'b111111,An_t[1:0]};
    
endmodule
