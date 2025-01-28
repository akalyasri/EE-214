`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/05/2024 01:17:41 AM
// Design Name: 
// Module Name: P1_R3_v2
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


module P1_R3_v2(
    input [11:0] sw,
    output [11:0] led
    );
    
    assign led = sw;
endmodule
