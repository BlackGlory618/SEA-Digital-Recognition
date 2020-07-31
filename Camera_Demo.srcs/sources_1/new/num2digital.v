`timescale 1ns / 1ps

module num2digital(
    //input pclk,
    input [3:0]num,
    output reg [6:0]cword//=7'b1001111
    );
    always@(*)
        begin
            case(num)
                0:cword <= 7'b1111110;
                1:cword <= 7'b0110000;
                2:cword <= 7'b1101101;
                3:cword <= 7'b1111001;
                4:cword <= 7'b0110011;
                5:cword <= 7'b1011011;
                6:cword <= 7'b1011111;
                7:cword <= 7'b1110000;
                8:cword <= 7'b1111111;
                9:cword <= 7'b1111011;
                default:cword <= 7'b1000111;        
            endcase
        end
        
endmodule
