`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/09/2024 03:38:29 PM
// Design Name: 
// Module Name: P5_R2
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

module bin2seg (
    input [3:0] sw,    // 4-bit swary input
    output reg [6:0] seg // 7-segment display output (abcdefg)
);
    always @(*) begin
        case (sw)
            4'b0000: seg = 7'b1000000; // 0
            4'b0001: seg = 7'b1111001; // 1
            4'b0010: seg = 7'b0100100; // 2 
            4'b0011: seg = 7'b0110000; // 3 
            4'b0100: seg = 7'b0011001; // 4 
            4'b0101: seg = 7'b0010010; // 5 
            4'b0110: seg = 7'b0000010; // 6 
            4'b0111: seg = 7'b1111000; // 7 
            4'b1000: seg = 7'b0000000; // 8
            4'b1001: seg = 7'b0010000; // 9
            4'b1010: seg = 7'b0001000; // A
            4'b1011: seg = 7'b0000011; // b
            4'b1100: seg = 7'b1000110; // C
            4'b1101: seg = 7'b0100001; // d
            4'b1110: seg = 7'b0000110; // E
            4'b1111: seg = 7'b0001110; // F
            default: seg = 7'b1111111; // Blank (should never happen)
        endcase
    end
endmodule

module P5_R2 (
    input [3:0] sw,        // 4-bit swary input from switches
    output [6:0] seg,      // 7-segment display (abcdefg)
    output reg [3:0] an    // 4-digit display anodes (active-low)
);

    bin2seg decoder(
        .sw(sw),       // Correct port name 'sw' used here
        .seg(seg)
    );

    always @(*) begin
        an = 4'b1110; // Only enable the first digit (others are off)
    end
    
endmodule
    
