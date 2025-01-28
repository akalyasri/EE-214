`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/18/2024 03:25:15 PM
// Design Name: 
// Module Name: P3_R4
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


module P3_R4(
    input [4:0] sw,
    output [1:0] led
    );
    
    
    wire C  = sw[0];  // Coolant low
    wire T  = sw[1];  // Temperature high
    wire OL = sw[2];  // Oil level low
    wire E  = sw[3];  // Exhaust out of spec
    wire OT = sw[4];  // Oil temperature high

    //Service Indicator (SI)
    assign led[0] = (OL & ~C) | C | (OT & C) | (T & OT);

    //Check Engine (CE)
    assign led[1] = (C & T) | (C & OT) | (T & OT) | E | OL | (~C & T) | (~T & C & OT & ~OL);
endmodule
