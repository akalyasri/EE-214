`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/15/2024 09:39:47 PM
// Design Name: 
// Module Name: P5_R3
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
    input [3:0] sw,    
    output reg [6:0] seg 
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
            default: seg = 7'b1111111; // Blank
        endcase
    end
endmodule

module P5_R3 (
     input [3:0] sw1,        // 4-bit binary input for digit 1
    input [3:0] sw2,        // 4-bit binary input for digit 2
    input btn,              // Button input for selecting digit
    output [6:0] seg,       // 7-segment display output
    output reg [3:0] an     // 4-digit display anodes (active-low)
);

    reg [3:0] selected_sw; 
    wire btn_state;         
    reg [1:0] digit_enable; 

 
    always @(*) begin
        if (btn) 
            selected_sw = sw2;  // show second digit
        else 
            selected_sw = sw1;  // ]show first digit
    end

    
    bin2seg decoder(
        .sw(selected_sw),   
        .seg(seg)
    );

    
    always @(*) begin
        if (btn) begin
            an = 4'b1101; // second digit (active low)
        end else begin
            an = 4'b1110; // first digit active low)
        end
    end

endmodule
    

