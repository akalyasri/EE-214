`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/11/2024 09:39:19 AM
// Design Name: 
// Module Name: P12_C1
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

module SwitchBounceMeasurer (
    input wire clk,             // 100MHz clock
    input wire reset,           // Synchronous reset
    input wire switch_input,    // Input from the switch to be measured
    output reg [31:0] bounce_time_ns // Measured bounce time in nanoseconds
);

    // States for the bounce detection state machine
    localparam IDLE = 2'b00;
    localparam START_COUNT = 2'b01;
    localparam WAIT_STABLE = 2'b10;

    // State register
    reg [1:0] current_state, next_state;

    // Registers and wires
    reg switch_input_prev;
    reg [31:0] counter; // Counter to measure time

    // Sequential logic: State transition and counter
    always @(posedge clk or posedge reset) begin
        if (reset) begin
            current_state <= IDLE;
            switch_input_prev <= 0;
            counter <= 0;
            bounce_time_ns <= 0;
        end else begin
            current_state <= next_state;
            switch_input_prev <= switch_input;

            // Update counter in START_COUNT state
            if (current_state == START_COUNT) begin
                counter <= counter + 1;
            end else if (current_state == WAIT_STABLE) begin
                // Hold counter value when in WAIT_STABLE
                counter <= counter;
            end else begin
                counter <= 0;
            end
        end
    end

    // Combinational logic: Next state logic and output updates
    always @(*) begin
        next_state = current_state; // Default to stay in current state

        case (current_state)
            IDLE: begin
                if (switch_input && !switch_input_prev) begin
                    // Detected rising edge, start counting
                    next_state = START_COUNT;
                end
            end

            START_COUNT: begin
                if (!switch_input) begin
                    // Detected a make-break transition
                    next_state = WAIT_STABLE;
                end
            end

            WAIT_STABLE: begin
                if (switch_input) begin
                    // Detected make-break-make transition
                    next_state = IDLE;
                    bounce_time_ns = counter * 10; // Convert counter to nanoseconds
                end
            end
        endcase
    end

endmodule
