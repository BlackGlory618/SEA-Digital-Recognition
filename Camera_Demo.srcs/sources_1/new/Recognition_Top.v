`timescale 1ns / 1ps

module Recognition_Top(
    input pclk,
    input [10:0]Set_X,
    input [9:0]Set_Y,
    input [23:0]RGB_Raw,
    output [23:0]RGB_Data,
    output [1:0] LED,
    output RGB_LED
    );
    
wire Binary;
wire [3:0]num;
wire [6:0]digital;
    
RGB2Binary RGB2Binary(
    //input clk,
    .RGB_Data(RGB_Raw),
    .Binary(Binary)
    );
    
//Num_Recognition Num_Recognition(
//    .pclk(pclk),
//    .VtcHCnt(Set_X),
//    .VtcVCnt(Set_Y),
//    .Binary(Binary),
//    .num(num),
//    .digital(digital)
//    );
    
Num_Recognition Num_Recognition(
    .pclk(pclk),
    .Set_X(Set_X),
    .Set_Y(Set_Y),
    .Binary(Binary),
    .num(num),
    .digital(digital)
    );
    
Num_Display Num_Display(
    //.clk(pclk),
    .num(digital),
    .Set_X(Set_X),
    .Set_Y(Set_Y),
    //.RGB_Raw(RGB_Raw),
    .Binary(Binary),
    .RGB_Data(RGB_Data)
    );
    
Num_Display_Led Num_Display_Led(
    .clk_100MHz(pclk),
    .num(num),
    .LED(LED),
    .RGB_LED(RGB_LED)
    );
    
endmodule
