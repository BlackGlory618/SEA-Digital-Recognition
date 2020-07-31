`timescale 1ns / 1ps

module Num_Display(
    //input clk,
    input [6:0]num,
    input [10:0]Set_X,
    input [9:0]Set_Y,
    //input Mode,
    //input [23:0]RGB_Raw,
    input Binary,
    output reg[23:0]RGB_Data//=24'hffff00    //RBG
    );
    
parameter 
    CENTER_H = 640,
    CENTER_V = 360,
    VtcVCnt_max = 266,
    VtcHCnt_max = 200,
    VtcHCnt_l=CENTER_H-100,
    VtcHCnt_r=CENTER_H+100,
    VtcVCnt_u=CENTER_V-133,      
    VtcVCnt_d=CENTER_V+133,
    X1 = (CENTER_V-(VtcVCnt_max>>1))+((VtcVCnt_max*410)>>10),
    X2 = (CENTER_V-(VtcVCnt_max>>1))+((VtcVCnt_max*683)>>10);

always@(*)
    begin
        if( (Set_X>=5&&Set_X<25) && (Set_Y<VtcVCnt_u) )
            begin
                if(Set_Y>=25&&Set_Y<105)
                    begin
                        if(num[1])
                            RGB_Data<=24'h0000ff;
                        else
                            RGB_Data<={24{Binary}};
                    end
                else if(Set_Y>=125&&Set_Y<205)
                    begin
                        if(num[2])
                            RGB_Data<=24'h0000ff;
                        else
                            RGB_Data<={24{Binary}};
                    end
                else
                    RGB_Data<={24{Binary}};
            end
        else if( (Set_X>=25&&Set_X<105) && (Set_Y<VtcVCnt_u) )
            begin
                if(Set_Y>=5&&Set_Y<25)
                    begin
                        if(num[6])
                            RGB_Data<=24'h0000ff;
                        else
                            RGB_Data<={24{Binary}};
                    end
                else if(Set_Y>=105&&Set_Y<125)
                    begin
                        if(num[0])
                            RGB_Data<=24'h0000ff;
                        else
                            RGB_Data<={24{Binary}};
                    end
                else if(Set_Y>=205&&Set_Y<225)
                    begin
                        if(num[3])
                            RGB_Data<=24'h0000ff;
                        else
                            RGB_Data<={24{Binary}};
                    end
                else
                    RGB_Data<={24{Binary}};
            end
        else if( (Set_X>=105&&Set_X<125) && (Set_Y<VtcVCnt_u) )
            begin
                if(Set_Y>=25&&Set_Y<105)
                    begin
                        if(num[5])
                            RGB_Data<=24'h0000ff;
                        else
                            RGB_Data<={24{Binary}};
                    end
                else if(Set_Y>=125&&Set_Y<205)
                    begin
                        if(num[4])
                            RGB_Data<=24'h0000ff;
                        else
                            RGB_Data<={24{Binary}};
                    end
                else
                    RGB_Data<={24{Binary}};
            end
        else if( Set_X ==  CENTER_H || Set_Y == X1 || Set_Y == X2 )
            RGB_Data <= 24'hff0000;
        else if( (Set_X>=VtcHCnt_l && Set_X<VtcHCnt_r) && (Set_Y==VtcVCnt_u || Set_Y==VtcVCnt_d) )
            RGB_Data <= 24'h000000;
        else if( (Set_Y>=VtcVCnt_u && Set_Y<VtcVCnt_d) && (Set_X==VtcHCnt_l || Set_X==VtcHCnt_r) )
            RGB_Data <= 24'h000000;
        else
            RGB_Data<={24{Binary}}; 
    
    end

endmodule
