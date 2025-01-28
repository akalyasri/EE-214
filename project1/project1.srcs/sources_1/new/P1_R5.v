`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/05/2024 11:28:19 AM
// Design Name: 
// Module Name: P1_R5
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


module P1_R5(
    input [7:0] sw, // switches
    input [3:0] btn, // buttons
    output [7:0] ssd, // seven segment
    output [3:0] dis // display
    );
    
    assign dis = ~((btn[0]) ? 4'b0001 :
                (btn[1]) ? 4'b0010 :
                (btn[2]) ? 4'b0100 :
                (btn[3]) ? 4'b1000 :
                4'b0000);
    assign ssd = sw;
    
endmodule
