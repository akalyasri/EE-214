`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/16/2024 03:05:47 PM
// Design Name: 
// Module Name: P3_R2
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


module P3_R2(
    input A,B,C,D,E,
    output led
    );
    
    assign led = (A & B & C) | (A & B & D) | (A & B & E) | 
               (A & C & D) | (A & C & E) | (A & D & E) |
               (B & C & D) | (B & C & E) | (B & D & E) |
               (C & D & E);
endmodule
