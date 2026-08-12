`timescale 1ns/1ps

module flag_register (
    input  wire       clk,
    input  wire       reset,
    input  wire       enable,

    input  wire [7:0] result,
    input  wire       carry_in,
    input  wire       overflow_in,

    output reg        carry_flag,
    output reg        zero_flag,
    output reg        sign_flag,
    output reg        overflow_flag
);

    always @(posedge clk or posedge reset) begin

        if (reset) begin
            carry_flag    <= 1'b0;
            zero_flag     <= 1'b0;
            sign_flag     <= 1'b0;
            overflow_flag <= 1'b0;
        end

        else if (enable) begin

            // Carry flag
            carry_flag <= carry_in;

            // Zero flag
            if (result == 8'b00000000)
                zero_flag <= 1'b1;
            else
                zero_flag <= 1'b0;

            // Sign flag = MSB of result
            sign_flag <= result[7];

            // Overflow flag
            overflow_flag <= overflow_in;

        end

    end

endmodule