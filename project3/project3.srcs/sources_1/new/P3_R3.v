`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/18/2024 02:23:40 PM
// Design Name: 
// Module Name: P3_R3
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


module P3_R3(
    input [7:0] sw,
    output led
    );
    
    assign led = (sw >= 8'b10100000) && (sw <= 8'b10111000);
endmodule
