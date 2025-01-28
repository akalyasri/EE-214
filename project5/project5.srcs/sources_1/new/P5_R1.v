`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/09/2024 02:50:45 PM
// Design Name: 
// Module Name: P5_R1
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


// 8-to-1 Multiplexer
module mux_8to1(
    input [7:0] I,    // 8 input signals (from slide switches)
    input [2:0] S,    // 3-bit select signal (from counter)
    output reg Y      // Output signal (to Demux and Red LED)
);

    always @(*) begin
        case(S)
            3'b000: Y = I[0];
            3'b001: Y = I[1];
            3'b010: Y = I[2];
            3'b011: Y = I[3];
            3'b100: Y = I[4];
            3'b101: Y = I[5];
            3'b110: Y = I[6];
            3'b111: Y = I[7];
            default: Y = 1'b0;  // Default case
        endcase
    end
endmodule

// 1-to-8 Demultiplexer
module demux_1to8(
    input EN,        // Enable input (Mux output)
    input [2:0] I,   // 3-bit select signal (from counter)
    output reg [7:0] Y  // 8 output signals (to LEDs)
);

    always @(*) begin
        if (EN) begin
            case(I)
                3'b000: Y = 8'b00000001;
                3'b001: Y = 8'b00000010;
                3'b010: Y = 8'b00000100;
                3'b011: Y = 8'b00001000;
                3'b100: Y = 8'b00010000;
                3'b101: Y = 8'b00100000;
                3'b110: Y = 8'b01000000;
                3'b111: Y = 8'b10000000;
                default: Y = 8'b00000000;
            endcase
        end else begin
            Y = 8'b00000000;  // Disable all outputs if EN is 0
        end
    end
endmodule

module counter (
    input clk,           // Clock input
    output [2:0] B       
);

    reg [27:0] counter;  

    always @ (posedge clk) begin
        counter <= counter + 1;
    end

    
    assign B = counter[27:25];

endmodule

module P5_R1(
    input clk,         // Clock input
    input [7:0] sw,    // Slide switches (8 inputs to Mux)
    output [7:0] led,  // LEDs (8 outputs from Demux)
    output red_led     // Red LED for Mux output
);

    wire [2:0] count;  // 3-bit counter output (for Mux/Demux select lines)
    wire sdata;        // Internal wire for Mux to Demux connection

   
    counter clk_divider (
        .clk(clk),
        .B(count)  // 3-bit output (select lines)
    );

    // Instantiate the 8-to-1 Multiplexer
    mux_8to1 input_mux (
        .I(sw),       // 8 slide switches as input
        .S(count),    // 3-bit select line from counter
        .Y(sdata)     // Mux output (connected to Demux enable and Red LED)
    );

    
    demux_1to8 output_demux (
        .EN(sdata),   
        .I(count),    
        .Y(led)       
    );

    
    assign red_led = sdata;

endmodule