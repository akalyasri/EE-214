`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/01/2024 07:36:07 PM
// Design Name: 
// Module Name: P12_R1
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


module P12_R1(
    input wire clk,         // System clock
    input wire rst,         // Reset signal
    input wire raw_input,   // Raw switch input
    output reg clean_output // Debounced output
);
    reg [1:0] state;        // FSM state
    reg [1:0] samples;      // Consecutive samples of raw input

    // State encoding
    parameter IDLE = 2'b00, DETECT_HIGH = 2'b01, 
              HIGH = 2'b10, DETECT_LOW = 2'b11;

    always @(posedge clk or posedge rst) begin
        if (rst) begin
            state <= IDLE;
            samples <= 2'b00;
            clean_output <= 0;
        end else begin
            // Shift samples and FSM logic
            samples <= {samples[0], raw_input};
            case (state)
                IDLE: begin
                    clean_output <= 0; // Reset output when in IDLE
                    if (samples == 2'b01) state <= DETECT_HIGH;
                end
                DETECT_HIGH: 
                    if (samples == 2'b11) state <= HIGH;
                    else if (samples == 2'b00) state <= IDLE;
                HIGH: begin
                    clean_output <= 1;
                    if (samples == 2'b10) state <= DETECT_LOW;
                end
                DETECT_LOW: begin
                    if (samples == 2'b00) state <= IDLE;
                end
            endcase
        end
    end
endmodule