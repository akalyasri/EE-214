`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/05/2024 03:30:53 PM
// Design Name: 
// Module Name: P1_C2
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


module P1_C2(
    input [2:0] btn,
    input  sw,
    output [2:0] led
    );
    
    assign led[0] = btn[0] & sw;
    assign led[1] = btn[1] & sw;
    assign led[2] = btn[2] & sw;
    

endmodule
