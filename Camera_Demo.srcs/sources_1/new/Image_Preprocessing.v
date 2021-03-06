`timescale 1ns / 1ps

module RGB2Binary(
    //input clk,
    input [23:0] RGB_Data,
    output Binary
    );
   wire [7:0] R;
   wire [7:0] G;
   wire [7:0] B;
   assign R = RGB_Data[23:16];
   assign G = RGB_Data[15:8];
   assign B = RGB_Data[7:0];
   
   wire [15:0] Ry;
   wire [15:0] Gy;   
   wire [15:0] By;   
   assign Ry = R*77;
   assign Gy = G*150;
   assign By = B*29;
   //always@(posedge clk)
   assign Binary = ((Ry + Gy + By)>>8)>50?1'd1:1'd0;
   
endmodule
