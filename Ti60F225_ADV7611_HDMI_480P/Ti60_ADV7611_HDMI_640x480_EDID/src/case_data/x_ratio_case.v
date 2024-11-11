module x_ratio_case(raddr,data);

    input      [9:0]    raddr;
    output reg [15:0]   data;

    always@(*)
        case(raddr)
            10'd0    :data  <=16'd40960;
            10'd1   : data <= 16'hFF77;
            10'd2   : data <= 16'hFEF0;
            10'd3   : data <= 16'hFE68;
            10'd4   : data <= 16'hFDE2;
            10'd5   : data <= 16'hFD5C;
            10'd6   : data <= 16'hFCD6;
            10'd7   : data <= 16'hFC52;
            10'd8   : data <= 16'hFBCD;
            10'd9   : data <= 16'hFB49;
            10'd10  : data <= 16'hFAC6;

            10'd11  : data <= 16'hFA43; 
            10'd12  : data <= 16'hF9C1; 
            10'd13  : data <= 16'hF93F; 
            10'd14  : data <= 16'hF8BE; 
            10'd15  : data <= 16'hF83E; 
            10'd16  : data <= 16'hF7BD; 
            10'd17  : data <= 16'hF73E; 
            10'd18  : data <= 16'hF6BF; 
            10'd19  : data <= 16'hF640; 
            10'd20  : data <= 16'hF5C2;

            10'd21  : data <= 16'hF544; 
            10'd22  : data <= 16'hF4C7; 
            10'd23  : data <= 16'hF44B; 
            10'd24  : data <= 16'hF3CF; 
            10'd25  : data <= 16'hF353; 
            10'd26  : data <= 16'hF2D8; 
            10'd27  : data <= 16'hF25D; 
            10'd28  : data <= 16'hF1E3; 
            10'd29  : data <= 16'hF16A; 
            10'd30  : data <= 16'hF0F0;

            10'd31  : data <= 16'hF078;
            10'd32  : data <= 16'hF000;
            10'd33  : data <= 16'hEF88;
            10'd34  : data <= 16'hEF10;
            10'd35  : data <= 16'hEE9A;
            10'd36  : data <= 16'hEE23;    
            10'd37  : data <= 16'hEDAD;
            10'd38  : data <= 16'hED38;
            10'd39  : data <= 16'hECC3;
            10'd40  : data <= 16'hEC4E;

            10'd41   : data <= 16'hEBDA;
            10'd42   : data <= 16'hEB66;
            10'd43   : data <= 16'hEAF3;
            10'd44   : data <= 16'hEA80;
            10'd45   : data <= 16'hEA0E;
            10'd46   : data <= 16'hE99C;
            10'd47   : data <= 16'hE92B;
            10'd48   : data <= 16'hE8BA;
            10'd49   : data <= 16'hE849;
            10'd50   : data <= 16'hE7D9;

            10'd51   : data <= 16'hE769;
            10'd52   : data <= 16'hE6FA;
            10'd53   : data <= 16'hE68B;
            10'd54   : data <= 16'hE61C;
            10'd55   : data <= 16'hE5AE;
            10'd56   : data <= 16'hE540;
            10'd57   : data <= 16'hE4D3;
            10'd58   : data <= 16'hE466;
            10'd59   : data <= 16'hE3FA;
            10'd60   : data <= 16'hE38E;

            10'd61   : data <= 16'hE322;
            10'd62   : data <= 16'hE2B7;
            10'd63   : data <= 16'hE24C;
            10'd64   : data <= 16'hE1E1;
            10'd65   : data <= 16'hE177;
            10'd66   : data <= 16'hE10E;
            10'd67   : data <= 16'hE0A4;
            10'd68   : data <= 16'hE03B;
            10'd69   : data <= 16'hDFD3;
            10'd70   : data <= 16'hDF6B;

            10'd71    : data <= 16'hDF03;
            10'd72    : data <= 16'hDE9B;
            10'd73    : data <= 16'hDE34;
            10'd74    : data <= 16'hDDCE;
            10'd75    : data <= 16'hDD67;
            10'd76    : data <= 16'hDD01;
            10'd77    : data <= 16'hDC9C;
            10'd78    : data <= 16'hDC37;
            10'd79    : data <= 16'hDBD2;
            10'd80    : data <= 16'hDB6D;
            
            10'd81    : data <= 16'hDB09;
            10'd82    : data <= 16'hDAA5;
            10'd83    : data <= 16'hDA42;
            10'd84    : data <= 16'hD9DF;
            10'd85    : data <= 16'hD97C;
            10'd86    : data <= 16'hD91A;
            10'd87    : data <= 16'hD8B8;
            10'd88    : data <= 16'hD856;
            10'd89    : data <= 16'hD7F5;    
            10'd90    : data <= 16'hD794;

            10'd91   : data <= 16'hD733;
            10'd92   : data <= 16'hD6D3;
            10'd93   : data <= 16'hD673;
            10'd94   : data <= 16'hD613;
            10'd95   : data <= 16'hD5B4;
            10'd96   : data <= 16'hD555;
            10'd97   : data <= 16'hD4F6;
            10'd98   : data <= 16'hD498;
            10'd99   : data <= 16'hD43A;
            10'd100  : data <= 16'hD3DC; 

            10'd101   : data <= 16'hD37F;
            10'd102   : data <= 16'hD322;
            10'd103   : data <= 16'hD2C5;
            10'd104   : data <= 16'hD269;
            10'd105   : data <= 16'hD20D;
            10'd106   : data <= 16'hD1B1;
            10'd107   : data <= 16'hD155;
            10'd108   : data <= 16'hD0FA;
            10'd109   : data <= 16'hD09F;
            10'd110   : data <= 16'hD045;          

            10'd111    : data <= 16'hCFEB;
            10'd112    : data <= 16'hCF91;
            10'd113    : data <= 16'hCF37;
            10'd114    : data <= 16'hCEDE;
            10'd115    : data <= 16'hCE85;
            10'd116    : data <= 16'hCE2C;
            10'd117    : data <= 16'hCDD4;
            10'd118    : data <= 16'hCD7C;
            10'd119    : data <= 16'hCD24;
            10'd120    : data <= 16'hCCCC;    

            10'd121   : data <= 16'hCC75;
            10'd122   : data <= 16'hCC1E;
            10'd123   : data <= 16'hCBC7;
            10'd124   : data <= 16'hCB71;
            10'd125   : data <= 16'hCB1B;
            10'd126   : data <= 16'hCAC5;
            10'd127   : data <= 16'hCA70;
            10'd128   : data <= 16'hCA1A;
            10'd129   : data <= 16'hC9C5;
            10'd130   : data <= 16'hC971;           

            10'd131   : data <= 16'hC91C;
            10'd132   : data <= 16'hC8C8;
            10'd133   : data <= 16'hC874;
            10'd134   : data <= 16'hC821;
            10'd135   : data <= 16'hC7CE;
            10'd136   : data <= 16'hC77B;
            10'd137   : data <= 16'hC728;
            10'd138   : data <= 16'hC6D5;
            10'd139   : data <= 16'hC683;
            10'd140   : data <= 16'hC631;            

            10'd141   : data <= 16'hC5DF;
            10'd142   : data <= 16'hC58E;
            10'd143   : data <= 16'hC53D;
            10'd144   : data <= 16'hC4EC;
            10'd145   : data <= 16'hC49B;
            10'd146   : data <= 16'hC44B;
            10'd147   : data <= 16'hC3FB;
            10'd148   : data <= 16'hC3AB;
            10'd149   : data <= 16'hC35B;
            10'd150   : data <= 16'hC30C;          

            10'd151   : data <= 16'hC2BD;
            10'd152   : data <= 16'hC26E;
            10'd153   : data <= 16'hC21F;
            10'd154   : data <= 16'hC1D1;
            10'd155   : data <= 16'hC183;
            10'd156   : data <= 16'hC135;
            10'd157   : data <= 16'hC0E7;
            10'd158   : data <= 16'hC09A;
            10'd159   : data <= 16'hC04C;
            10'd160   : data <= 16'hC000;            

            10'd161  : data <= 16'hBFB3; 
            10'd162  : data <= 16'hBF66; 
            10'd163  : data <= 16'hBF1A; 
            10'd164  : data <= 16'hBECE; 
            10'd165  : data <= 16'hBE82; 
            10'd166  : data <= 16'hBE37; 
            10'd167  : data <= 16'hBDEC; 
            10'd168  : data <= 16'hBDA1; 
            10'd169  : data <= 16'hBD56; 
            10'd170  : data <= 16'hBD0B;            

            10'd171  : data <= 16'hBCC1; 
            10'd172  : data <= 16'hBC77; 
            10'd173  : data <= 16'hBC2D; 
            10'd174  : data <= 16'hBBE3; 
            10'd175  : data <= 16'hBB9A; 
            10'd176  : data <= 16'hBB51; 
            10'd177  : data <= 16'hBB08; 
            10'd178  : data <= 16'hBABF; 
            10'd179  : data <= 16'hBA76; 
            10'd180  : data <= 16'hBA2E;            

            10'd181  : data <= 16'hB9E6;
            10'd182  : data <= 16'hB99E;
            10'd183  : data <= 16'hB956;
            10'd184  : data <= 16'hB90F;
            10'd185  : data <= 16'hB8C8;
            10'd186  : data <= 16'hB881;
            10'd187  : data <= 16'hB83A;
            10'd188  : data <= 16'hB7F3;
            10'd189  : data <= 16'hB7AD;
            10'd190  : data <= 16'hB767;

            10'd191   : data <= 16'hB721;
            10'd192   : data <= 16'hB6DB;
            10'd193   : data <= 16'hB695;
            10'd194   : data <= 16'hB650;
            10'd195   : data <= 16'hB60B;
            10'd196   : data <= 16'hB5C6;
            10'd197   : data <= 16'hB581;
            10'd198   : data <= 16'hB53D;
            10'd199   : data <= 16'hB4F8;
            10'd200   : data <= 16'hB4B4;

            10'd201   : data <= 16'hB470;
            10'd202   : data <= 16'hB42D;
            10'd203   : data <= 16'hB3E9;
            10'd204   : data <= 16'hB3A6;
            10'd205   : data <= 16'hB363;
            10'd206   : data <= 16'hB320;
            10'd207   : data <= 16'hB2DD;
            10'd208   : data <= 16'hB29A;
            10'd209   : data <= 16'hB258;
            10'd210   : data <= 16'hB216;           

            10'd211   : data <= 16'hB1D4;
            10'd212   : data <= 16'hB192;
            10'd213   : data <= 16'hB150;
            10'd214   : data <= 16'hB10F;
            10'd215   : data <= 16'hB0CE;
            10'd216   : data <= 16'hB08D;
            10'd217   : data <= 16'hB04C;
            10'd218   : data <= 16'hB00B;
            10'd219   : data <= 16'hAFCB;
            10'd220   : data <= 16'hAF8A;            

            10'd221    : data <= 16'hAF4A;
            10'd222    : data <= 16'hAF0A;
            10'd223    : data <= 16'hAECB;
            10'd224    : data <= 16'hAE8B;
            10'd225    : data <= 16'hAE4C;
            10'd226    : data <= 16'hAE0D;
            10'd227    : data <= 16'hADCE;
            10'd228    : data <= 16'hAD8F;
            10'd229    : data <= 16'hAD50;
            10'd230    : data <= 16'hAD12;            

            10'd231    : data <= 16'hACD3;
            10'd232    : data <= 16'hAC95;
            10'd233    : data <= 16'hAC57;
            10'd234    : data <= 16'hAC19;
            10'd235    : data <= 16'hABDC;
            10'd236    : data <= 16'hAB9E;
            10'd237    : data <= 16'hAB61;
            10'd238    : data <= 16'hAB24;
            10'd239    : data <= 16'hAAE7;
            10'd240    : data <= 16'hAAAA;

        10'd241   :   data <=16'hAA6E;
        10'd242   :   data <=16'hAA31;
        10'd243   :   data <=16'hA9F5;
        10'd244   :   data <=16'hA9B9;
        10'd245   :   data <=16'hA97D;
        10'd246   :   data <=16'hA941;
        10'd247   :   data <=16'hA905;
        10'd248   :   data <=16'hA8CA;
        10'd249   :   data <=16'hA88F;
        10'd250   :   data <=16'hA854;


        10'd251   :   data <=16'hA819;
        10'd252   :   data <=16'hA7DE;
        10'd253   :   data <=16'hA7A3;
        10'd254   :   data <=16'hA769;
        10'd255   :   data <=16'hA72F;
        10'd256   :   data <=16'hA6F4;
        10'd257   :   data <=16'hA6BA;
        10'd258   :   data <=16'hA681;
        10'd259   :   data <=16'hA647;
        10'd260   :   data <=16'hA60D;

        10'd261   :   data <=16'hA5D4;
        10'd262   :   data <=16'hA59B;
        10'd263   :   data <=16'hA562;
        10'd264   :   data <=16'hA529;
        10'd265   :   data <=16'hA4F0;
        10'd266   :   data <=16'hA4B7;
        10'd267   :   data <=16'hA47F;
        10'd268   :   data <=16'hA447;
        10'd269   :   data <=16'hA40F;
        10'd270   :   data <=16'hA3D7;

        10'd271   :   data <=16'hA39F;
        10'd272   :   data <=16'hA367;
        10'd273   :   data <=16'hA32F;
        10'd274   :   data <=16'hA2F8;
        10'd275   :   data <=16'hA2C1;
        10'd276   :   data <=16'hA28A;
        10'd277   :   data <=16'hA253;
        10'd278   :   data <=16'hA21C;
        10'd279   :   data <=16'hA1E5;
        10'd280   :   data <=16'hA1AF;

        10'd281   :   data <=16'hA178;
        10'd282   :   data <=16'hA142;
        10'd283   :   data <=16'hA10C;
        10'd284   :   data <=16'hA0D6;
        10'd285   :   data <=16'hA0A0;
        10'd286   :   data <=16'hA06A;
        10'd287   :   data <=16'hA035;
        10'd288   :   data <=16'hA000;
        10'd289   :   data <=16'h9FCA;
        10'd290   :   data <=16'h9F95;


        10'd291   :   data <=16'h9F60;
        10'd292   :   data <=16'h9F2B;
        10'd293   :   data <=16'h9EF7;
        10'd294   :   data <=16'h9EC2;
        10'd295   :   data <=16'h9E8E;
        10'd296   :   data <=16'h9E59;
        10'd297   :   data <=16'h9E25;
        10'd298   :   data <=16'h9DF1;
        10'd299   :   data <=16'h9DBD;
        10'd300   :   data <=16'h9D89;

        10'd301   :   data <=16'h9D56;
        10'd302   :   data <=16'h9D22;
        10'd303   :   data <=16'h9CEF;
        10'd304   :   data <=16'h9CBC;
        10'd305   :   data <=16'h9C88;
        10'd306   :   data <=16'h9C55;
        10'd307   :   data <=16'h9C23;
        10'd308   :   data <=16'h9BF0;
        10'd309   :   data <=16'h9BBD;
        10'd310   :   data <=16'h9B8B;

        10'd311   :   data <=16'h9B59;
        10'd312   :   data <=16'h9B26;
        10'd313   :   data <=16'h9AF4;
        10'd314   :   data <=16'h9AC2;
        10'd315   :   data <=16'h9A90;
        10'd316   :   data <=16'h9A5F;
        10'd317   :   data <=16'h9A2D;
        10'd318   :   data <=16'h99FC;
        10'd319   :   data <=16'h99CA;
        10'd320   :   data <=16'h9999;

        10'd321   :   data <=16'h9968;
        10'd322   :   data <=16'h9937;
        10'd323   :   data <=16'h9906;
        10'd324   :   data <=16'h98D5;
        10'd325   :   data <=16'h98A5;
        10'd326   :   data <=16'h9874;
        10'd327   :   data <=16'h9844;
        10'd328   :   data <=16'h9814;
        10'd329   :   data <=16'h97E4;
        10'd330   :   data <=16'h97B4;

        10'd331   :   data <=16'h9784;
        10'd332   :   data <=16'h9754;
        10'd333   :   data <=16'h9724;
        10'd334   :   data <=16'h96F5;
        10'd335   :   data <=16'h96C5;
        10'd336   :   data <=16'h9696;
        10'd337   :   data <=16'h9667;
        10'd338   :   data <=16'h9638;
        10'd339   :   data <=16'h9609;
        10'd340   :   data <=16'h95DA;

        10'd341   :   data <=16'h95AB;
        10'd342   :   data <=16'h957D;
        10'd343   :   data <=16'h954E;
        10'd344   :   data <=16'h9520;
        10'd345   :   data <=16'h94F2;
        10'd346   :   data <=16'h94C3;
        10'd347   :   data <=16'h9495;
        10'd348   :   data <=16'h9467;
        10'd349   :   data <=16'h943A;
        10'd350   :   data <=16'h940C;

        10'd351   :   data <=16'h93DE;
        10'd352   :   data <=16'h93B1;
        10'd353   :   data <=16'h9383;
        10'd354   :   data <=16'h9356;
        10'd355   :   data <=16'h9329;
        10'd356   :   data <=16'h92FC;
        10'd357   :   data <=16'h92CF;
        10'd358   :   data <=16'h92A2;
        10'd359   :   data <=16'h9275;
        10'd360   :   data <=16'h9249;

        10'd361   :   data <=16'h921C;
        10'd362   :   data <=16'h91F0;
        10'd363   :   data <=16'h91C3;
        10'd364   :   data <=16'h9197;
        10'd365   :   data <=16'h916B;
        10'd366   :   data <=16'h913F;
        10'd367   :   data <=16'h9113;
        10'd368   :   data <=16'h90E7;
        10'd369   :   data <=16'h90BC;
        10'd370   :   data <=16'h9090;

        10'd371   :   data <=16'h9065;
        10'd372   :   data <=16'h9039;
        10'd373   :   data <=16'h900E;
        10'd374   :   data <=16'h8FE3;
        10'd375   :   data <=16'h8FB8;
        10'd376   :   data <=16'h8F8D;
        10'd377   :   data <=16'h8F62;
        10'd378   :   data <=16'h8F37;
        10'd379   :   data <=16'h8F0C;
        10'd380   :   data <=16'h8EE2;

        10'd381   :   data <=16'h8EB7;
        10'd382   :   data <=16'h8E8D;
        10'd383   :   data <=16'h8E63;
        10'd384   :   data <=16'h8E38;
        10'd385   :   data <=16'h8E0E;
        10'd386   :   data <=16'h8DE4;
        10'd387   :   data <=16'h8DBA;
        10'd388   :   data <=16'h8D91;
        10'd389   :   data <=16'h8D67;
        10'd390   :   data <=16'h8D3D;

        10'd391   :   data <=16'h8D14;
        10'd392   :   data <=16'h8CEA;
        10'd393   :   data <=16'h8CC1;
        10'd394   :   data <=16'h8C98;
        10'd395   :   data <=16'h8C6F;
        10'd396   :   data <=16'h8C46;
        10'd397   :   data <=16'h8C1D;
        10'd398   :   data <=16'h8BF4;
        10'd399   :   data <=16'h8BCB;
        10'd400   :   data <=16'h8BA2;

        10'd401   :   data <=16'h8B7A;
        10'd402   :   data <=16'h8B51;
        10'd403   :   data <=16'h8B29;
        10'd404   :   data <=16'h8B01;
        10'd405   :   data <=16'h8AD8;
        10'd406   :   data <=16'h8AB0;
        10'd407   :   data <=16'h8A88;
        10'd408   :   data <=16'h8A60;
        10'd409   :   data <=16'h8A39;
        10'd410   :   data <=16'h8A11;

        10'd411   :   data <=16'h89E9;
        10'd412   :   data <=16'h89C2;
        10'd413   :   data <=16'h899A;
        10'd414   :   data <=16'h8973;
        10'd415   :   data <=16'h894B;
        10'd416   :   data <=16'h8924;
        10'd417   :   data <=16'h88FD;
        10'd418   :   data <=16'h88D6;
        10'd419   :   data <=16'h88AF;
        10'd420   :   data <=16'h8888;

        10'd421   :   data <=16'h8861;
        10'd422   :   data <=16'h883B;
        10'd423   :   data <=16'h8814;
        10'd424   :   data <=16'h87ED;
        10'd425   :   data <=16'h87C7;
        10'd426   :   data <=16'h87A1;
        10'd427   :   data <=16'h877A;
        10'd428   :   data <=16'h8754;
        10'd429   :   data <=16'h872E;
        10'd430   :   data <=16'h8708;

        10'd431   :   data <=16'h86E2;
        10'd432   :   data <=16'h86BC;
        10'd433   :   data <=16'h8696;
        10'd434   :   data <=16'h8671;
        10'd435   :   data <=16'h864B;
        10'd436   :   data <=16'h8626;
        10'd437   :   data <=16'h8600;
        10'd438   :   data <=16'h85DB;
        10'd439   :   data <=16'h85B5;
        10'd440   :   data <=16'h8590;

        10'd441   :   data <=16'h856B;
        10'd442   :   data <=16'h8546;
        10'd443   :   data <=16'h8521;
        10'd444   :   data <=16'h84FC;
        10'd445   :   data <=16'h84D7;
        10'd446   :   data <=16'h84B3;
        10'd447   :   data <=16'h848E;
        10'd448   :   data <=16'h8469;
        10'd449   :   data <=16'h8445;
        10'd450   :   data <=16'h8421;

        10'd451   :   data <=16'h83FC;
        10'd452   :   data <=16'h83D8;
        10'd453   :   data <=16'h83B4;
        10'd454   :   data <=16'h8390;
        10'd455   :   data <=16'h836C;
        10'd456   :   data <=16'h8348;
        10'd457   :   data <=16'h8324;
        10'd458   :   data <=16'h8300;
        10'd459   :   data <=16'h82DC;
        10'd460   :   data <=16'h82B9;

        10'd461   :   data <=16'h8295;
        10'd462   :   data <=16'h8272;
        10'd463   :   data <=16'h824E;
        10'd464   :   data <=16'h822B;
        10'd465   :   data <=16'h8208;
        10'd466   :   data <=16'h81E4;
        10'd467   :   data <=16'h81C1;
        10'd468   :   data <=16'h819E;
        10'd469   :   data <=16'h817B;
        10'd470   :   data <=16'h8158;

        10'd471   :   data <=16'h8136;
        10'd472   :   data <=16'h8113;
        10'd473   :   data <=16'h80F0;
        10'd474   :   data <=16'h80CE;
        10'd475   :   data <=16'h80AB;
        10'd476   :   data <=16'h8089;
        10'd477   :   data <=16'h8066;
        10'd478   :   data <=16'h8044;
        10'd479   :   data <=16'h8022;
        10'd480   :   data <=16'h8000;

        10'd481   :   data <=16'h7FDD;
        10'd482   :   data <=16'h7FBB;
        10'd483   :   data <=16'h7F99;
        10'd484   :   data <=16'h7F78;
        10'd485   :   data <=16'h7F56;
        10'd486   :   data <=16'h7F34;
        10'd487   :   data <=16'h7F12;
        10'd488   :   data <=16'h7EF1;
        10'd489   :   data <=16'h7ECF;
        10'd490   :   data <=16'h7EAE;

        10'd491   :   data <=16'h7E8C;
        10'd492   :   data <=16'h7E6B;
        10'd493   :   data <=16'h7E4A;
        10'd494   :   data <=16'h7E29;
        10'd495   :   data <=16'h7E07;
        10'd496   :   data <=16'h7DE6;
        10'd497   :   data <=16'h7DC5;
        10'd498   :   data <=16'h7DA4;
        10'd499   :   data <=16'h7D84;
        10'd500   :   data <=16'h7D63;

        10'd501   :   data <=16'h7D42;
        10'd502   :   data <=16'h7D21;
        10'd503   :   data <=16'h7D01;
        10'd504   :   data <=16'h7CE0;
        10'd505   :   data <=16'h7CC0;
        10'd506   :   data <=16'h7C9F;
        10'd507   :   data <=16'h7C7F;
        10'd508   :   data <=16'h7C5F;
        10'd509   :   data <=16'h7C3F;
        10'd510   :   data <=16'h7C1F;

        10'd511   :   data <=16'h7BFE;
        10'd512   :   data <=16'h7BDE;
        10'd513   :   data <=16'h7BBF;
        10'd514   :   data <=16'h7B9F;
        10'd515   :   data <=16'h7B7F;
        10'd516   :   data <=16'h7B5F;
        10'd517   :   data <=16'h7B3F;
        10'd518   :   data <=16'h7B20;
        10'd519   :   data <=16'h7B00;
        10'd520   :   data <=16'h7AE1;

        10'd521   :   data <=16'h7AC1;
        10'd522   :   data <=16'h7AA2;
        10'd523   :   data <=16'h7A83;
        10'd524   :   data <=16'h7A63;
        10'd525   :   data <=16'h7A44;
        10'd526   :   data <=16'h7A25;
        10'd527   :   data <=16'h7A06;
        10'd528   :   data <=16'h79E7;
        10'd529   :   data <=16'h79C8;
        10'd530   :   data <=16'h79A9;

        10'd531   :   data <=16'h798B;
        10'd532   :   data <=16'h796C;
        10'd533   :   data <=16'h794D;
        10'd534   :   data <=16'h792E;
        10'd535   :   data <=16'h7910;
        10'd536   :   data <=16'h78F1;
        10'd537   :   data <=16'h78D3;
        10'd538   :   data <=16'h78B5;
        10'd539   :   data <=16'h7896;
        10'd540   :   data <=16'h7878;

        10'd541   :   data <=16'h785A;
        10'd542   :   data <=16'h783C;
        10'd543   :   data <=16'h781E;
        10'd544   :   data <=16'h7800;
        10'd545   :   data <=16'h77E2;
        10'd546   :   data <=16'h77C4;
        10'd547   :   data <=16'h77A6;
        10'd548   :   data <=16'h7788;
        10'd549   :   data <=16'h776A;
        10'd550   :   data <=16'h774D;

        10'd551   :   data <=16'h772F;
        10'd552   :   data <=16'h7711;
        10'd553   :   data <=16'h76F4;
        10'd554   :   data <=16'h76D6;
        10'd555   :   data <=16'h76B9;
        10'd556   :   data <=16'h769C;
        10'd557   :   data <=16'h767E;
        10'd558   :   data <=16'h7661;
        10'd559   :   data <=16'h7644;
        10'd560   :   data <=16'h7627;

        10'd561   :   data <=16'h760A;
        10'd562   :   data <=16'h75ED;
        10'd563   :   data <=16'h75D0;
        10'd564   :   data <=16'h75B3;
        10'd565   :   data <=16'h7596;
        10'd566   :   data <=16'h7579;
        10'd567   :   data <=16'h755D;
        10'd568   :   data <=16'h7540;
        10'd569   :   data <=16'h7523;
        10'd570   :   data <=16'h7507;

        10'd571   :   data <=16'h74EA;
        10'd572   :   data <=16'h74CE;
        10'd573   :   data <=16'h74B1;
        10'd574   :   data <=16'h7495;
        10'd575   :   data <=16'h7479;
        10'd576   :   data <=16'h745D;
        10'd577   :   data <=16'h7440;
        10'd578   :   data <=16'h7424;
        10'd579   :   data <=16'h7408;
        10'd580   :   data <=16'h73EC;

        10'd581   :   data <=16'h73D0;
        10'd582   :   data <=16'h73B4;
        10'd583   :   data <=16'h7398;
        10'd584   :   data <=16'h737D;
        10'd585   :   data <=16'h7361;
        10'd586   :   data <=16'h7345;
        10'd587   :   data <=16'h7329;
        10'd588   :   data <=16'h730E;
        10'd589   :   data <=16'h72F2;
        10'd590   :   data <=16'h72D7;

        10'd591   :   data <=16'h72BB;
        10'd592   :   data <=16'h72A0;
        10'd593   :   data <=16'h7285;
        10'd594   :   data <=16'h7269;
        10'd595   :   data <=16'h724E;
        10'd596   :   data <=16'h7233;
        10'd597   :   data <=16'h7218;
        10'd598   :   data <=16'h71FD;
        10'd599   :   data <=16'h71E2;
        10'd600   :   data <=16'h71C7;

            default : data <= 0;
        endcase
endmodule
