`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/05/2024 03:13:53 PM
// Design Name: 
// Module Name: P1_C1
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


module P1_C1(
    input [2:0] btn,
    output [2:0] led
    );
    
    assign led = btn;
    
endmodule
