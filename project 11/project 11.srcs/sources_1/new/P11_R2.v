`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/30/2024 05:55:10 PM
// Design Name: 
// Module Name: P11_R2
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
// Create Date: 11/30/2024 05:55:10 PM
// Design Name: 
// Module Name: P11_R2
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

module clock_divider (
    input clk,        // 100 MHz input clock
    input rst,        // Reset
    output reg clk_1k // 1 kHz output clock
);
    reg [16:0] count;
    always @(posedge clk or posedge rst) begin
        if (rst) begin
            count <= 0;
            clk_1k <= 0;
        end else if (count == 49999) begin
            count <= 0;
            clk_1k <= ~clk_1k; // Toggle clock every 50,000 cycles
        end else begin
            count <= count + 1;
        end
    end
endmodule

///////

module decimal_counter (
    input clk,         // 1 kHz clock
    input rst,         // Reset
    input cen,         // Counter enable
    output [15:0] count, // 4-digit counter output
    output tc          // Terminal count (rollover signal)
);
    reg [3:0] digit[3:0]; // 4 digits
    assign count = {digit[3], digit[2], digit[1], digit[0]};

    wire tc_0, tc_1, tc_2, tc_3;
    assign tc = (digit[3] == 4'd9 && digit[2] == 4'd9 && digit[1] == 4'd9 && digit[0] == 4'd9);

    // Individual digit counters
    always @(posedge clk or posedge rst) begin
        if (rst) begin
            digit[0] <= 0; digit[1] <= 0; digit[2] <= 0; digit[3] <= 0;
        end else if (cen) begin
            if (digit[0] == 4'd9) begin
                digit[0] <= 0;
                if (digit[1] == 4'd9) begin
                    digit[1] <= 0;
                    if (digit[2] == 4'd9) begin
                        digit[2] <= 0;
                        if (digit[3] == 4'd9) digit[3] <= 0;
                        else digit[3] <= digit[3] + 1;
                    end else digit[2] <= digit[2] + 1;
                end else digit[1] <= digit[1] + 1;
            end else digit[0] <= digit[0] + 1;
        end
    end
endmodule


///////////////

module state_machine (
    input clk,
    input rst,
    input start,
    input stop,
    input increment,
    input clear,
    output reg cen,
    output reg rst_count
);
    // states
    localparam [1:0] IDLE = 2'b00, RUN = 2'b01, PAUSE = 2'b10;
    reg [1:0] current_state, next_state;

    
    reg increment_prev;
    wire increment_edge;

    
    reg [15:0] counter_value; 

    // detect rising edge of increment
    always @(posedge clk or posedge rst) begin
        if (rst)
            increment_prev <= 0;
        else
            increment_prev <= increment;
    end

    assign increment_edge = increment & ~increment_prev; // rising edge detection

    // state transitions
    always @(posedge clk or posedge rst) begin
        if (rst) 
            current_state <= IDLE;
        else 
            current_state <= next_state;
    end

    
    always @(*) begin
        
        cen = 0;
        rst_count = 0;
        next_state = current_state; // stay in the current state

        case (current_state)
            IDLE: begin
                if (start) 
                    next_state = RUN;
                else if (clear) 
                    rst_count = 1;
            end
            RUN: begin
                cen = 1;
                if (stop) 
                    next_state = PAUSE;
                else if (clear) 
                    rst_count = 1;
            end
            PAUSE: begin
                if (start) 
                    next_state = RUN;
                else if (clear) 
                    rst_count = 1;
                else if (increment_edge) begin
                    // increment the rightmost digit
                    cen = 1; 
                end
            end
            default: next_state = IDLE;
        endcase
    end
endmodule

////////////

module seven_segment_display (
    input [3:0] value,        // 4-bit binary input
    output reg [6:0] segments // 7-segment output
);
always @(*) begin
    case (value)
        4'h0: segments = 7'b1000000; // 0
        4'h1: segments = 7'b1111001; // 1
        4'h2: segments = 7'b0100100; // 2
        4'h3: segments = 7'b0110000; // 3
        4'h4: segments = 7'b0011001; // 4
        4'h5: segments = 7'b0010010; // 5
        4'h6: segments = 7'b0000010; // 6
        4'h7: segments = 7'b1111000; // 7
        4'h8: segments = 7'b0000000; // 8
        4'h9: segments = 7'b0010000; // 9
        default: segments = 7'b1111111; // Off
    endcase
end
endmodule

///////////

module stopwatch (
    input clk,            // 100 MHz clock
    input rst,            // Reset
    input start,          // Start button
    input stop,           // Stop button
    input increment,      // Increment button (not implemented yet)
    input clear,          // Clear button
    output [7:0] segments, // 7-segment display segments
    output [3:0] anodes,    // 7-segment anodes
    output reg led
);
    wire clk_1k;          // 1 kHz clock
    wire cen;             // Counter enable
    wire rst_count;       // Reset count signal
    wire [15:0] count;    // 4-digit counter output
    reg [8:0] ledCounter;
    reg [3:0] randomStop;
    reg running;
    
    always @(posedge clk or posedge rst) begin
    
        if(rst || stop) begin
            ledCounter <= ledCounter + 1;
            randomStop <= 0;
            running <= 0;
            
        end else if (start) begin
            randomStop <= ledCounter[3:0];
            running <= 1;
            
        end
    end
    
    always @(posedge clk or posedge rst) begin
    
        if(rst || stop) begin
            randomStop <= 0;
            led <=0;
            running <=0;
        end else if(start) begin
            
            if(randomStop != 0) begin
                randomStop <= randomStop - 1;
            end  
            
            if(randomStop == 0) begin
                led <= 1;
                running <=1;
           end
      end 
    end
    
    // Clock divider to generate 1 kHz clock
    clock_divider u1 (
        .clk(clk),
        .rst(rst),
        .clk_1k(clk_1k)
    );

    // State machine for control logic
    state_machine u2 (
        .clk(clk_1k),
        .rst(rst),
        .start(start),
        .stop(stop),
        .increment(increment),
        .clear(clear),
        .cen(cen),
        .rst_count(rst_count)
    );

    // Decimal counter
    decimal_counter u3 (
        .clk(clk_1k),
        .rst(rst | rst_count),
        .cen(cen),
        .count(count),
        .tc() // Unused terminal count
    );
    
    // Clock divider for refresh rate
    reg [15:0] clk_div = 16'd0;
    always @(posedge clk) begin
        clk_div <= clk_div + 1;
    end
    wire slow_clk = clk_div[15];

    // Digit counter for multiplexing
    reg [1:0] anode_select = 2'b00; // Multiplexing selector
    always @(posedge slow_clk) begin
        anode_select <= anode_select + 1;
    end
    
    // Assigning the anodes for multiplexing
    assign anodes = (anode_select == 2'b00) ? 4'b1110 :
                    (anode_select == 2'b01) ? 4'b1101 :
                    (anode_select == 2'b10) ? 4'b1011 :
                    4'b0111;

    // Driving the 7-segment displays for each digit
    wire [3:0] digit_0 = count[3:0];        // Rightmost digit
    wire [3:0] digit_1 = count[7:4];        // Second digit
    wire [3:0] digit_2 = count[11:8];       // Third digit
    wire [3:0] digit_3 = count[15:12];      // Leftmost digit
    
    reg [7:0] segments_out; 
    always @(slow_clk) begin
        case (anode_select)
            2'b00: segments_out = {1'b1, get_segments(digit_0)};  // Rightmost digit, no dot
            2'b01: segments_out = {1'b1, get_segments(digit_1)};  // Second digit, no dot
            2'b10: segments_out = {1'b1, get_segments(digit_2)};  // Third digit, no dot
            2'b11: segments_out = {1'b0, get_segments(digit_3)};  // Leftmost digit, enable dot
            default: segments_out = 8'b11111111;                  // All off
        endcase
    end
    
    assign segments = segments_out;  

    function [6:0] get_segments(input [3:0] value);
        case (value)
            4'h0: get_segments = 7'b1000000; // 0
            4'h1: get_segments = 7'b1111001; // 1
            4'h2: get_segments = 7'b0100100; // 2
            4'h3: get_segments = 7'b0110000; // 3
            4'h4: get_segments = 7'b0011001; // 4
            4'h5: get_segments = 7'b0010010; // 5
            4'h6: get_segments = 7'b0000010; // 6
            4'h7: get_segments = 7'b1111000; // 7
            4'h8: get_segments = 7'b0000000; // 8
            4'h9: get_segments = 7'b0010000; // 9
            default: get_segments = 7'b1111111; // Off
        endcase
    endfunction
endmodule