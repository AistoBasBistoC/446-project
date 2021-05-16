`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/02/2021 11:27:01 AM
// Design Name: 
// Module Name: Counter
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


module Counter(
    input Clk,
    input Reset,
    output [3:0] D,
    output Q
    );
    reg [3:0] PS, NS;   //PS = Present State, NS = Next State
    reg Q_; //temp Q
    
    //state definitions
    parameter S0 = 4'b0000; //0
    parameter S1 = 4'b0001; //1
    parameter S2 = 4'b0010; //2
    parameter S3 = 4'b0011; //3
    parameter S4 = 4'b0100; //4
    parameter S5 = 4'b0101; //5
    parameter S6 = 4'b0110; //6
    parameter S7 = 4'b0111; //7
    parameter S8 = 4'b1000; //8
    parameter S9 = 4'b1001; //9
    
    //reset check
    always @(posedge Clk, posedge Reset)
        if(Reset)
        PS <= S0;
        else
        PS <= NS;
    
    //state transitions    
    always @(*)
        case (PS)
        S0:
            begin
            NS <= S1;
            Q_ <= 1'b1;
            end
        S1:
            begin
            NS <= S2;
            Q_ <= 1'b0;
            end
        S2:
            begin
            NS <= S3;
            Q_ <= 1'b0;
            end
        S3:
            begin
            NS <= S4;
            Q_ <= 1'b0;
            end
        S4:
            begin
            NS <= S5;
            Q_ <= 1'b0;
            end    
        S5:
            begin
            NS <= S6;
            Q_ <= 1'b0;
            end
        S6:
            begin
            NS <= S7;
            Q_ <= 1'b0;
            end
        S7:
            begin
            NS <= S8;
            Q_ <= 1'b0;
            end    
        S8:
            begin
            NS <= S9;
            Q_ <= 1'b0;
            end
        S9:
            begin
            NS <= S0;
            Q_ <= 1'b0;
            end
        default:
            begin
            NS <= S0;
            Q_ <= 1'b0;
            end
        endcase
        
    assign D = PS;
    assign Q = Q_;
                   
endmodule
