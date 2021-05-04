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
    
    wire N_Clk1, N_Clk2, Q_Clk, gnd
    wire [3:0] C1_In0, C2_In1, Mux_Bin;

    ClockDivider dut0( .Clk(Clk), .Reset(Reset), .N_Clk381Hz(N_Clk1), .N_Clk1Hz(N_Clk2));

   // ClockDivider 1Hz( .Clk(Clk), .Reset(Reset), .N_Clk1Hz(N_Clk2));

    Counter dut1( .Clk(N_Clk2), .Reset(Reset), .Q(Q_Clk), .D(C1_In0));

    Counter dut2( .Clk(Q_Clk), .Reset(Reset), .Q(gnd), .D(C2_In1));

    Decoder dut3( .D_in(N_Clk1), .D_out0(Anode), .D_out1(Anode));

    Mux dut4( .in_0(C1_In0), .in_1(C2_In1), .Sel(N_Clk1), .Mux_out(Mux_Dec));

    Bin_7Segment dut5( .Bin(Mux_Bin), .Seven_Segment(Display));
    
    assign Anode = {3'b111,An_t[4:0]};
    
endmodule
