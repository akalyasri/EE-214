`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/14/2024 07:26:11 PM
// Design Name: 
// Module Name: P3_R1
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


module P3_R1(
    input [4:0] sw,
    output led
    );
    
    assign led = sw[0] ^ sw[1] ^ sw[2] ^ sw[3] ^ sw[4];
endmodule
