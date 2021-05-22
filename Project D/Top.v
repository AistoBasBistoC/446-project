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
    input [9:0] Stop,
    output [7:0] Anode,
    output [7:0] Display
    );
    wire Clk1Hz, Clk381Hz, Counter1Q, Counter2Q, CompOut, NOROut;
    wire [1:0] CycleOut;
    wire [2:0] An_t;
    wire [3:0] Counter1Out, Counter2Out, Counter3Out, MuxOut;
    wire [5:0] Multi10Out, SumOut;
    wire [9:0] Multi100Out;
    
    
    ClockDivider Clock_Divider (.Clk(Clk), .Reset(Reset), .N_Clk1Hz(Clk1Hz), .N_Clk381Hz(Clk381Hz));
    
    Counter Ones_Cntr (.Clk(NOROut), .Reset(Reset), .D(Counter1Out), .Q(Counter1Q));
    
    Counter Tens_Cntr (.Clk(Counter1Q), .Reset(Reset), .D(Counter2Out), .Q(Counter2Q));
    
    Counter Hundreds_Cntr (.Clk(Counter2Q), .Reset(Reset), .D(Counter3Out), .Q(1'b0));
    
    Multiply10 Multi_10 (.Counter_In(Counter2Out), .Multi_Out(Multi10Out));
    
    Multiply100 Multi_100 (.Counter_In(Counter3Out), .Multi_Out(Multi100Out));
    
    Add Adder (.LSC_In(Counter1Out), .Mul10_In(Multi10Out), .Mul100_In(Multi100Out), .Sum_Out(SumOut));
    
    Comparator Equals (.CompA(SumOut), .CompB(Stop), .Comp_Out(CompOut));
    
    Comp_Clk_NOR NORGate (.Clk(Clk1Hz), .Comp_In(CompOut), .NOR_Out(NOROut));
    
    Cycler Cycler(.Clk(Clk381Hz), .Reset(Reset), .Cycle_Out(CycleOut));
    
    Decoder Decoder (.D_in(CycleOut), .D_out0(An_t[2]), .D_out1(An_t[1]), .D_out2(An_t[0]));
    
    Mux Mux (.in_0(Counter1Out), .in_1(Counter2Out), .in_2(Counter3Out), .in_3(1'b0), .Sel(CycleOut), .Mux_out(MuxOut));
    
    Decoder7Seg Decoder_Bin7Seg (.Bin(MuxOut), .Seven_Seg(Display));
    
    
    assign Anode = {5'b11111,An_t[2:0]};
    
endmodule
