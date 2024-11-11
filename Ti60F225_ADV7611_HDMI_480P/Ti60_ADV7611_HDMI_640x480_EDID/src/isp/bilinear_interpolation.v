// *********************************************************************
// 
// Copyright (C) 2021-20xx CrazyBird Corporation
// 
// Filename     :   bilinear_interpolation.v
// Author       :   CrazyBird
// Email        :   CrazyBirdLin@qq.com
// 
// Description  :   
// 
// Modification History
// Date         By          Version         Change Description
//----------------------------------------------------------------------
// 2021/03/27   CrazyBird   1.0             Original
// 
// *********************************************************************
module bilinear_interpolation
#(
    parameter C_SRC_IMG_WIDTH  = 11'd640    ,
    parameter C_SRC_IMG_HEIGHT = 11'd480    
//    parameter C_DST_IMG_WIDTH  = 11'd1024   ,
//    parameter C_DST_IMG_HEIGHT = 11'd768    ,
//    parameter C_X_RATIO        = 16'd40960  ,           //  floor(C_SRC_IMG_WIDTH/C_DST_IMG_WIDTH*2^16)
//    parameter C_Y_RATIO        = 16'd40960              //  floor(C_SRC_IMG_HEIGHT/C_DST_IMG_HEIGHT*2^16)
)
(
    input  wire                 clk_in1         ,
    input  wire                 clk_in2         ,
    input  wire                 rst_n           ,
    
    //  Image data prepared to be processed
    input  wire                 per_img_vsync   ,       //  Prepared Image data vsync valid signal
    input  wire                 per_img_href    ,       //  Prepared Image data href vaild  signal
    input  wire     [7:0]       per_img_gray    ,       //  Prepared Image brightness input
    
    input          [7:0]             per_img_red ,      //input red
    input          [7:0]             per_img_green ,    //input green
    input          [7:0]             per_img_blue ,     //input blue
    //  Image data has been processed
    output reg      [10:0]        C_DST_IMG_WIDTH,   //input 目标图像宽
    output reg      [10:0]        C_DST_IMG_HEIGHT,  //input 目标图像高
    output reg                  post_img_vsync  ,       //  processed Image data vsync valid signal
    output reg                  post_img_href   ,       //  processed Image data href vaild  signal
    output reg      [7:0]       post_img_gray   ,          //  processed Image brightness output gray
    output reg      [7:0]       post_img_red   ,           //  processed Image brightness output red
    output reg      [7:0]       post_img_green   ,        //  processed Image brightness output  green
    output reg      [7:0]       post_img_blue           //  processed Image brightness output    blue

);
//计算
    reg r_data_en;

    reg   [15:0]      C_X_RATIO;
    reg   [15:0]      C_Y_RATIO;



    wire [15:0]         ram_x_ratio_data;

    reg [9:0]          x_ratio_raddr=10'd0;

    wire [11:0]         IMG_WIDTH;

    wire [15:0]         ram_y_ratio_data;
    reg  [10:0]          y_ratio_raddr = 11'd0;

    reg     [27:0] count;
    reg     [6:0] count1;

    reg [2:0] state_display;

    parameter   IDLE= 3'b000;
    parameter   ADD = 3'b010;
    parameter   SUB = 3'b100;

            
            //if ((x_ratio_raddr<=10'd585 && y_ratio_raddr<=11'd1280)) 

    always@(posedge clk_in1)
        if(count==28'd25000000)
            count<=28'd0;
        else
            count <= count +1'd1;
            
    always@(posedge clk_in1)
        if(!rst_n)
            count1<=0;
        else if(count1 > 79)
                count1<=0;
        else if(count==28'd25000000)
                count1 <= count1 + 1'd1;
        else;

    always@(posedge clk_in1)
        if(count1<=39)
            state_display<=ADD;
        else if(count1>40)
            state_display<=SUB;

    always@(posedge clk_in1)
        if(state_display==ADD)begin
                if(count==28'd25000000)
                begin
                    x_ratio_raddr<=x_ratio_raddr + 5'd9;
                    y_ratio_raddr<=y_ratio_raddr + 5'd16;
                end
        end
        else if(state_display==SUB)begin
                if(count==28'd25000000)
                begin
                    x_ratio_raddr<=x_ratio_raddr - 5'd9;
                    y_ratio_raddr<=y_ratio_raddr - 5'd16;
                end
        end



    
/*
    always@(posedge clk_in1)
        if(!rst_n)
            state_display<=IDLE;
        else 
            if(count==28'd25000000)
                case(state_display)
                    IDLE  :     if(count1<=26)
                                    state_display<=ADD;
                                else 
                                    state_display<=SUB;
                    10'd594:
                begin
                    x_ratio_raddr<=x_ratio_raddr - 5'd9;
                    y_ratio_raddr<=y_ratio_raddr - 5'd16; end
                endcase
*/


x_ratio_case u_x_ratio_case(
    .raddr(x_ratio_raddr),
    .data(ram_x_ratio_data)
    );
y_ratio_case u_y_ratio_case(
    .data(ram_y_ratio_data),
    .raddr(y_ratio_raddr)
    );
/*    

    bram_x_ratio  u_bram_x_ratio(
    .clk ( clk_in1 ),
    .addr ( x_ratio_raddr ),
    .rdata_a ( ram_x_ratio_data )
    );

    bram_y_ratio  u_bram_y_ratio(
    .clk ( clk_in1 ),
    .addr ( y_ratio_raddr ),
    .rdata_a ( ram_y_ratio_data )//32768
    );
*/
    always@(posedge clk_in2)begin
        C_Y_RATIO  <=ram_x_ratio_data ;
        C_X_RATIO  <=ram_y_ratio_data ;
    end

    always@(posedge clk_in2)begin
        C_DST_IMG_WIDTH  = C_SRC_IMG_WIDTH + y_ratio_raddr;
        C_DST_IMG_HEIGHT = C_SRC_IMG_HEIGHT + x_ratio_raddr;
    end
    


//----------------------------------------------------------------------
reg                             per_img_href_dly;


//-------------|         |-----------------------------------------------
//-------------|———————— |-----------------------------------------------
//----------------------------------------------------------------------

//下降沿检测电路
always @(posedge clk_in1)
begin
    if(rst_n == 1'b0)
        per_img_href_dly <= 1'b0;
    else
        per_img_href_dly <= per_img_href;
end

wire                            per_img_href_neg;

assign per_img_href_neg = per_img_href_dly & ~per_img_href;
//

reg             [10:0]          img_vs_cnt;                             //  from 0 to C_SRC_IMG_HEIGHT - 1

always @(posedge clk_in1)
begin
    if(rst_n == 1'b0)
        img_vs_cnt <= 11'b0;
    else
    begin
        if(per_img_vsync == 1'b0)
            img_vs_cnt <= 11'b0;
        else
        begin
            if(per_img_href_neg == 1'b1)
                img_vs_cnt <= img_vs_cnt + 1'b1;
            else
                img_vs_cnt <= img_vs_cnt;
        end
    end
end

reg             [10:0]          img_hs_cnt;                             //  from 0 to C_SRC_IMG_WIDTH - 1

always @(posedge clk_in1)
begin
    if(rst_n == 1'b0)
        img_hs_cnt <= 11'b0;
    else
    begin
        if((per_img_vsync == 1'b1)&&(per_img_href == 1'b1))
            img_hs_cnt <= img_hs_cnt + 1'b1;
        else
            img_hs_cnt <= 11'b0;
    end
end

//----------------------------------------------------------------------
reg             [7:0]           bram_a_wdata;//亮度值
reg             [7:0]           bram_a_wdata_r;
reg             [7:0]           bram_a_wdata_g;
reg             [7:0]           bram_a_wdata_b;

always @(posedge clk_in1)
begin
    bram_a_wdata <= per_img_gray;//将亮度值存入bram
    bram_a_wdata_r <= per_img_red;
    bram_a_wdata_g <= per_img_green;
    bram_a_wdata_b <= per_img_blue;
end
//写入地址是固定的，每个bram的地址都相同
reg             [11:0]          bram_a_waddr;

always @(posedge clk_in1)
begin
    bram_a_waddr <= {img_vs_cnt[2:1],10'b0} + img_hs_cnt;
end

reg                             bram1_a_wenb;

always @(posedge clk_in1)
begin
    if(rst_n == 1'b0)
        bram1_a_wenb <= 1'b0;
    else
        bram1_a_wenb <= per_img_vsync & per_img_href & ~img_vs_cnt[0];
end

reg                             bram2_a_wenb;

always @(posedge clk_in1)
begin
    if(rst_n == 1'b0)
        bram2_a_wenb <= 1'b0;
    else
        bram2_a_wenb <= per_img_vsync & per_img_href & img_vs_cnt[0];
end



reg             [10:0]          fifo_wdata;

always @(posedge clk_in1)
begin
    fifo_wdata <= img_vs_cnt;
end

reg                             fifo_wenb;

always @(posedge clk_in1)
begin
    if(rst_n == 1'b0)
        fifo_wenb <= 1'b0;
    else
    begin
        if((per_img_vsync == 1'b1)&&(per_img_href == 1'b1)&&(img_hs_cnt == C_SRC_IMG_WIDTH - 1'b1))
            fifo_wenb <= 1'b1;
        else
            fifo_wenb <= 1'b0;
    end
end

//----------------------------------------------------------------------
//  bram & fifo rw      gray
reg             [11:0]          even_bram1_b_raddr;
reg             [11:0]          odd_bram1_b_raddr;
reg             [11:0]          even_bram2_b_raddr;
reg             [11:0]          odd_bram2_b_raddr;
wire            [ 7:0]          even_bram1_b_rdata;
wire            [ 7:0]          odd_bram1_b_rdata;
wire            [ 7:0]          even_bram2_b_rdata;
wire            [ 7:0]          odd_bram2_b_rdata;





//gray

my_bram_ip  u1_my_bram_ip_gray(
    .clk_a                             (    clk_in1                        ),
    .we_a                              (    bram1_a_wenb                   ),

    .addr_a                            (    bram_a_waddr                   ),
    .wdata_a                           (    bram_a_wdata                   ),//input
    .rdata_a                           (                                   ),
    .clk_b                             (    clk_in2                        ), 
    .we_b                              (    1'b0                           ),
    .addr_b                            (    even_bram1_b_raddr             ),
    .wdata_b                           (    8'b0                           ),
    .rdata_b                           (    even_bram1_b_rdata             )
);
my_bram_ip  u2_my_bram_ip_gray(
    .clk_a                             (    clk_in1                     ),
    .we_a                              (    bram1_a_wenb                ),

    .addr_a                            (    bram_a_waddr                ),
    .wdata_a                           (    bram_a_wdata                ),//input
    .rdata_a                           (                                ),
    .clk_b                             (    clk_in2                     ), 
    .we_b                              (    1'b0                        ),
    .addr_b                            (    odd_bram1_b_raddr           ),
    .wdata_b                           (    8'b0                        ),
    .rdata_b                           (    odd_bram1_b_rdata           )
);
my_bram_ip  u3_my_bram_ip_gray(
    .clk_a                             (      clk_in1                   ),
    .we_a                              (      bram2_a_wenb              ),

    .addr_a                            (      bram_a_waddr              ),
    .wdata_a                           (      bram_a_wdata              ),//input
    .rdata_a                           (                                ),
    .clk_b                             (      clk_in2                   ), 
    .we_b                              (      1'b0                      ),
    .addr_b                            (      even_bram2_b_raddr        ),
    .wdata_b                           (      8'b0                      ),
    .rdata_b                           (      even_bram2_b_rdata        )
);
my_bram_ip  u4_my_bram_ip_gray(
    .clk_a                             (      clk_in1                     ),
    .we_a                              (      bram2_a_wenb                ),

    .addr_a                            (      bram_a_waddr                ),
    .wdata_a                           (      bram_a_wdata                ),//input
    .rdata_a                           (                                  ),
    .clk_b                             (      clk_in2                     ), 
    .we_b                              (      1'b0                        ),
    .addr_b                            (      odd_bram2_b_raddr           ),
    .wdata_b                           (      8'b0                        ),
    .rdata_b                           (      odd_bram2_b_rdata           )
);
//red
reg             [11:0]          even_bram1_b_raddr_red     ;
reg             [11:0]          odd_bram1_b_raddr_red     ;
reg             [11:0]          even_bram2_b_raddr_red     ;
reg             [11:0]          odd_bram2_b_raddr_red     ;
wire            [ 7:0]          even_bram1_b_rdata_red     ;
wire            [ 7:0]          odd_bram1_b_rdata_red     ;
wire            [ 7:0]          even_bram2_b_rdata_red     ;
wire            [ 7:0]          odd_bram2_b_rdata_red     ;

//bram1_a_wenb,写使能
//R
my_bram_ip  u1_my_bram_ip_red(
    .clk_a                             (    clk_in1                        ),
    .we_a                              (    bram1_a_wenb                   ),
    .addr_a                            (    bram_a_waddr                   ),
    .wdata_a                           (    bram_a_wdata_r                 ),
    .rdata_a                           (                                   ),
    .clk_b                             (    clk_in2                        ), 
    .we_b                              (    1'b0                           ),
    .addr_b                            (    even_bram1_b_raddr_red             ),
    .wdata_b                           (    8'b0                           ),
    .rdata_b                           (    even_bram1_b_rdata_red             )
);
my_bram_ip  u2_my_bram_ip_red(
    .clk_a                             (    clk_in1                     ),
    .we_a                              (    bram1_a_wenb                ),
    .addr_a                            (    bram_a_waddr                ),
    .wdata_a                           (    bram_a_wdata_r              ),
    .rdata_a                           (                                ),
    .clk_b                             (    clk_in2                     ), 
    .we_b                              (    1'b0                        ),
    .addr_b                            (    odd_bram1_b_raddr_red           ),
    .wdata_b                           (    8'b0                        ),
    .rdata_b                           (    odd_bram1_b_rdata_red           )
);
my_bram_ip  u3_my_bram_ip_red(
    .clk_a                             (      clk_in1                   ),
    .we_a                              (      bram2_a_wenb              ),
    .addr_a                            (      bram_a_waddr              ),
    .wdata_a                           (      bram_a_wdata_r            ),
    .rdata_a                           (                                ),
    .clk_b                             (      clk_in2                   ), 
    .we_b                              (      1'b0                      ),
    .addr_b                            (      even_bram2_b_raddr_red        ),
    .wdata_b                           (      8'b0                      ),
    .rdata_b                           (      even_bram2_b_rdata_red        )
);
my_bram_ip  u4_my_bram_ip_red(
    .clk_a                             (      clk_in1                     ),
    .we_a                              (      bram2_a_wenb                ),
    .addr_a                            (      bram_a_waddr                ),
    .wdata_a                           (      bram_a_wdata_r              ),
    .rdata_a                           (                                  ),
    .clk_b                             (      clk_in2                     ), 
    .we_b                              (      1'b0                        ),
    .addr_b                            (      odd_bram2_b_raddr_red           ),
    .wdata_b                           (      8'b0                        ),
    .rdata_b                           (      odd_bram2_b_rdata_red           )
);
//green
reg             [11:0]          even_bram1_b_raddr_green     ;
reg             [11:0]          odd_bram1_b_raddr_green     ;
reg             [11:0]          even_bram2_b_raddr_green    ;
reg             [11:0]          odd_bram2_b_raddr_green  ;
wire            [ 7:0]          even_bram1_b_rdata_green    ;
wire            [ 7:0]          odd_bram1_b_rdata_green  ;
wire            [ 7:0]          even_bram2_b_rdata_green    ;
wire            [ 7:0]          odd_bram2_b_rdata_green     ;


//green

my_bram_ip  u1_my_bram_ip_green(
    .clk_a                             (    clk_in1                        ),
    .we_a                              (    bram1_a_wenb                   ),
    .addr_a                            (    bram_a_waddr                   ),
    .wdata_a                           (    bram_a_wdata_g                 ),
    .rdata_a                           (                                   ),
    .clk_b                             (    clk_in2                        ), 
    .we_b                              (    1'b0                           ),
    .addr_b                            (    even_bram1_b_raddr_green             ),
    .wdata_b                           (    8'b0                           ),
    .rdata_b                           (    even_bram1_b_rdata_green             )
);
my_bram_ip  u2_my_bram_ip_green(
    .clk_a                             (    clk_in1                     ),
    .we_a                              (    bram1_a_wenb                ),
    .addr_a                            (    bram_a_waddr                ),
    .wdata_a                           (    bram_a_wdata_g              ),
    .rdata_a                           (                                ),
    .clk_b                             (    clk_in2                     ), 
    .we_b                              (    1'b0                        ),
    .addr_b                            (    odd_bram1_b_raddr_green           ),
    .wdata_b                           (    8'b0                        ),
    .rdata_b                           (    odd_bram1_b_rdata_green           )
);
my_bram_ip  u3_my_bram_ip_green(
    .clk_a                             (      clk_in1                   ),
    .we_a                              (      bram2_a_wenb              ),
    .addr_a                            (      bram_a_waddr              ),
    .wdata_a                           (      bram_a_wdata_g            ),
    .rdata_a                           (                                ),
    .clk_b                             (      clk_in2                   ), 
    .we_b                              (      1'b0                      ),
    .addr_b                            (      even_bram2_b_raddr_green        ),
    .wdata_b                           (      8'b0                      ),
    .rdata_b                           (      even_bram2_b_rdata_green        )
);
my_bram_ip  u4_my_bram_ip_green(
    .clk_a                             (      clk_in1                     ),
    .we_a                              (      bram2_a_wenb                ),
    .addr_a                            (      bram_a_waddr                ),
    .wdata_a                           (      bram_a_wdata_g              ),
    .rdata_a                           (                                  ),
    .clk_b                             (      clk_in2                     ), 
    .we_b                              (      1'b0                        ),
    .addr_b                            (      odd_bram2_b_raddr_green           ),
    .wdata_b                           (      8'b0                        ),
    .rdata_b                           (      odd_bram2_b_rdata_green           )
);
//blue
reg             [11:0]          even_bram1_b_raddr_blue     ;
reg             [11:0]          odd_bram1_b_raddr_blue     ;
reg             [11:0]          even_bram2_b_raddr_blue    ;
reg             [11:0]          odd_bram2_b_raddr_blue  ;
wire            [ 7:0]          even_bram1_b_rdata_blue    ;
wire            [ 7:0]          odd_bram1_b_rdata_blue  ;
wire            [ 7:0]          even_bram2_b_rdata_blue    ;
wire            [ 7:0]          odd_bram2_b_rdata_blue     ;

//blue

my_bram_ip  u1_my_bram_ip_blue(
    .clk_a                             (    clk_in1                        ),
    .we_a                              (    bram1_a_wenb                   ),
    .addr_a                            (    bram_a_waddr                   ),
    .wdata_a                           (    bram_a_wdata_b                 ),
    .rdata_a                           (                                   ),
    .clk_b                             (    clk_in2                        ), 
    .we_b                              (    1'b0                           ),
    .addr_b                            (    even_bram1_b_raddr_blue             ),
    .wdata_b                           (    8'b0                           ),
    .rdata_b                           (    even_bram1_b_rdata_blue             )
);
my_bram_ip  u2_my_bram_ip_blue(
    .clk_a                             (    clk_in1                     ),
    .we_a                              (    bram1_a_wenb                ),
    .addr_a                            (    bram_a_waddr                ),
    .wdata_a                           (    bram_a_wdata_b              ),
    .rdata_a                           (                                ),
    .clk_b                             (    clk_in2                     ), 
    .we_b                              (    1'b0                        ),
    .addr_b                            (    odd_bram1_b_raddr_blue           ),
    .wdata_b                           (    8'b0                        ),
    .rdata_b                           (    odd_bram1_b_rdata_blue           )
);
my_bram_ip  u3_my_bram_ip_blue(
    .clk_a                             (      clk_in1                   ),
    .we_a                              (      bram2_a_wenb              ),
    .addr_a                            (      bram_a_waddr              ),
    .wdata_a                           (      bram_a_wdata_b            ),
    .rdata_a                           (                                ),
    .clk_b                             (      clk_in2                   ), 
    .we_b                              (      1'b0                      ),
    .addr_b                            (      even_bram2_b_raddr_blue        ),
    .wdata_b                           (      8'b0                      ),
    .rdata_b                           (      even_bram2_b_rdata_blue        )
);
my_bram_ip  u4_my_bram_ip_blue(
    .clk_a                             (      clk_in1                     ),
    .we_a                              (      bram2_a_wenb                ),
    .addr_a                            (      bram_a_waddr                ),
    .wdata_a                           (      bram_a_wdata_b              ),
    .rdata_a                           (                                  ),
    .clk_b                             (      clk_in2                     ), 
    .we_b                              (      1'b0                        ),
    .addr_b                            (      odd_bram2_b_raddr_blue           ),
    .wdata_b                           (      8'b0                        ),
    .rdata_b                           (      odd_bram2_b_rdata_blue           )
);

//以上完成bram对原始RGB数据的存入
wire                            fifo_renb;
wire            [10:0]          fifo_rdata;
wire                            fifo_empty;
wire                            fifo_full;




//FIFO存入的是场计数器的值
    asyn_fifo  u_asyn_fifo(
        .a_rst_i                           (   ~rst_n                       ), 
        .wdata                             (    fifo_wdata                  ),
        .rd_clk_i                          (     clk_in2                    ),
        .rd_en_i                           (      fifo_renb                 ),
        .wr_clk_i                          (       clk_in1                  ),
        .wr_en_i                           (       fifo_wenb                ),
        .rdata                             (       fifo_rdata               ),
        .full_o                            (      fifo_empty                ),
        .empty_o                           (       fifo_full                ),
    .almost_full_o                     (        ),
    .prog_full_o                       (        ),
    .overflow_o                        (        ),
    .wr_ack_o                          (        ),
    .almost_empty_o                    (        ),
    .underflow_o                       (        ),
    .rd_valid_o                        (        ),
    .wr_datacount_o                    (        ),
    .rst_busy                          (        ),
    .rd_datacount_o                    (        )
);


localparam S_IDLE      = 3'd0;
localparam S_Y_LOAD    = 3'd1;
localparam S_BRAM_ADDR = 3'd2;
localparam S_Y_INC     = 3'd3;
localparam S_RD_FIFO   = 3'd4;

reg             [ 2:0]          state;
reg             [26:0]          y_dec;
reg             [26:0]          x_dec;
reg             [10:0]          y_cnt;
reg             [10:0]          x_cnt;

always @(posedge clk_in2)
begin
    if(rst_n == 1'b0)
        state <= S_IDLE;
    else
    begin
        case(state)
            S_IDLE : 
            begin
                if(fifo_empty == 1'b0)
                begin
                    if((fifo_rdata != 11'b0)&&(y_cnt == C_DST_IMG_HEIGHT))begin
                        r_data_en <= 1;
                        state <= S_RD_FIFO;
                    end
                    else begin
                        state <= S_Y_LOAD;
                        r_data_en <= 1;
                    end
                end
                else
                    state <= S_IDLE;
            end
            S_Y_LOAD : 
            begin
                if((y_dec[26:16] + 1'b1 <= fifo_rdata)||(y_cnt == C_DST_IMG_HEIGHT - 1'b1))
                    state <= S_BRAM_ADDR;
                else
                    state <= S_RD_FIFO;
            end
            S_BRAM_ADDR : 
            begin
                if(x_cnt == C_DST_IMG_WIDTH - 1'b1)
                    state <= S_Y_INC;
                else
                    state <= S_BRAM_ADDR;
            end
            S_Y_INC : 
            begin
                if(y_cnt == C_DST_IMG_HEIGHT - 1'b1)
                    state <= S_RD_FIFO;
                else
                    state <= S_Y_LOAD;
            end
            S_RD_FIFO : 
            begin
                state <= S_IDLE;
            end
            default : 
            begin
                state <= S_IDLE;
            end
        endcase
    end
end

assign fifo_renb = (state == S_RD_FIFO) ? 1'b1 : 1'b0;

always @(posedge clk_in2)
begin
    if(rst_n == 1'b0)
        y_dec <= 27'b0;
    else
    begin
        if((state == S_IDLE)&&(fifo_empty == 1'b0)&&(fifo_rdata == 11'b0))begin
            y_dec <= 27'b0;
        end
        else if(state == S_Y_INC)begin
            y_dec <= y_dec + C_Y_RATIO;
        end
        else
            y_dec <= y_dec;
    end
end

always @(posedge clk_in2)
begin
    if(rst_n == 1'b0)
        y_cnt <= 11'b0;
    else
    begin
        if((state == S_IDLE)&&(fifo_empty == 1'b0)&&(fifo_rdata == 11'b0))
            y_cnt <= 11'b0;
        else if(state == S_Y_INC)
            y_cnt <= y_cnt + 1'b1;
        else
            y_cnt <= y_cnt;
    end
end

always @(posedge clk_in2)
begin
    if(state == S_BRAM_ADDR)
        x_dec <= x_dec + C_X_RATIO;
    else
        x_dec <= 27'b0;
end

always @(posedge clk_in2)
begin
    if(state == S_BRAM_ADDR)
        x_cnt <= x_cnt + 1'b1;
    else
        x_cnt <= 11'b0;
end



//----------------------------------------------------------------------
//  c1
reg                             img_vs_c1;

always @(posedge clk_in2)
begin
    if(rst_n == 1'b0)
        img_vs_c1 <= 1'b0;
    else
    begin
        if((state == S_BRAM_ADDR)&&(x_cnt == 11'b0)&&(y_cnt == 11'b0))
            img_vs_c1 <= 1'b1;
        else if((state == S_Y_INC)&&(y_cnt == C_DST_IMG_HEIGHT - 1'b1))
            img_vs_c1 <= 1'b0;
        else
            img_vs_c1 <= img_vs_c1;
    end
end

reg                             img_hs_c1;

always @(posedge clk_in2)
begin
    if(rst_n == 1'b0)
        img_hs_c1 <= 1'b0;
    else
    begin
        if(state == S_BRAM_ADDR)
            img_hs_c1 <= 1'b1;
        else
            img_hs_c1 <= 1'b0;
    end
end

reg             [10:0]          x_int_c1;
reg             [10:0]          y_int_c1;
reg             [16:0]          x_fra_c1;
reg             [16:0]          inv_x_fra_c1;
reg             [16:0]          y_fra_c1;
reg             [16:0]          inv_y_fra_c1;

always @(posedge clk_in2)
begin
    x_int_c1     <= x_dec[25:16];
    y_int_c1     <= y_dec[25:16];
    x_fra_c1     <= {1'b0,x_dec[15:0]};
    inv_x_fra_c1 <= 17'h10000 - {1'b0,x_dec[15:0]};
    y_fra_c1     <= {1'b0,y_dec[15:0]};
    inv_y_fra_c1 <= 17'h10000 - {1'b0,y_dec[15:0]};
end

//----------------------------------------------------------------------
//  c2
reg                             img_vs_c2;
reg                             img_hs_c2;

always @(posedge clk_in2)
begin
    if(rst_n == 1'b0)
    begin
        img_vs_c2 <= 1'b0;
        img_hs_c2 <= 1'b0;
    end
    else
    begin
        img_vs_c2 <= img_vs_c1;
        img_hs_c2 <= img_hs_c1;
    end
end

reg             [11:0]          bram_addr_c2;
reg             [33:0]          frac_00_c2;
reg             [33:0]          frac_01_c2;
reg             [33:0]          frac_10_c2;
reg             [33:0]          frac_11_c2;
reg                             bram_mode_c2;

always @(posedge clk_in2)
begin
    bram_addr_c2 <= {y_int_c1[2:1],10'b0} + x_int_c1;
    frac_00_c2   <= inv_x_fra_c1 * inv_y_fra_c1;
    frac_01_c2   <= x_fra_c1 * inv_y_fra_c1;
    frac_10_c2   <= inv_x_fra_c1 * y_fra_c1;
    frac_11_c2   <= x_fra_c1 * y_fra_c1;
    bram_mode_c2 <= y_int_c1[0];
end

reg                             right_pixel_extand_flag_c2;
reg                             bottom_pixel_extand_flag_c2;

always @(posedge clk_in2)
begin
    if(x_int_c1 == C_SRC_IMG_WIDTH - 1'b1)
        right_pixel_extand_flag_c2 <= 1'b1;
    else
        right_pixel_extand_flag_c2 <= 1'b0;
    if(y_int_c1 == C_SRC_IMG_HEIGHT - 1'b1)
        bottom_pixel_extand_flag_c2 <= 1'b1;
    else
        bottom_pixel_extand_flag_c2 <= 1'b0;
end

//----------------------------------------------------------------------
//  c3
reg                             img_vs_c3;
reg                             img_hs_c3;

always @(posedge clk_in2)
begin
    if(rst_n == 1'b0)
    begin
        img_vs_c3 <= 1'b0;
        img_hs_c3 <= 1'b0;
    end
    else
    begin
        img_vs_c3 <= img_vs_c2;
        img_hs_c3 <= img_hs_c2;
    end
end


//gray      bram地址处理
always @(posedge clk_in2)
begin
    if(bram_mode_c2 == 1'b0)
    begin
        even_bram1_b_raddr <= bram_addr_c2;
        odd_bram1_b_raddr  <= bram_addr_c2 + 1'b1;
        even_bram2_b_raddr <= bram_addr_c2;
        odd_bram2_b_raddr  <= bram_addr_c2 + 1'b1;
    end
    else
    begin
        even_bram1_b_raddr <= bram_addr_c2 + 11'd1024;
        odd_bram1_b_raddr  <= bram_addr_c2 + 11'd1025;
        even_bram2_b_raddr <= bram_addr_c2;
        odd_bram2_b_raddr  <= bram_addr_c2 + 1'b1;
    end
end
//red      bram地址处理
always @(posedge clk_in2)
begin
    if(bram_mode_c2 == 1'b0)
    begin
        even_bram1_b_raddr_red <= bram_addr_c2;
        odd_bram1_b_raddr_red  <= bram_addr_c2 + 1'b1;
        even_bram2_b_raddr_red <= bram_addr_c2;
        odd_bram2_b_raddr_red  <= bram_addr_c2 + 1'b1;
    end
    else
    begin
        even_bram1_b_raddr_red <= bram_addr_c2 + 11'd1024;
        odd_bram1_b_raddr_red  <= bram_addr_c2 + 11'd1025;
        even_bram2_b_raddr_red <= bram_addr_c2;
        odd_bram2_b_raddr_red  <= bram_addr_c2 + 1'b1;
    end
end

//green      bram地址处理
always @(posedge clk_in2)
begin
    if(bram_mode_c2 == 1'b0)
    begin
        even_bram1_b_raddr_green <= bram_addr_c2;
        odd_bram1_b_raddr_green  <= bram_addr_c2 + 1'b1;
        even_bram2_b_raddr_green <= bram_addr_c2;
        odd_bram2_b_raddr_green  <= bram_addr_c2 + 1'b1;
    end
    else
    begin
        even_bram1_b_raddr_green <= bram_addr_c2 + 11'd1024;
        odd_bram1_b_raddr_green  <= bram_addr_c2 + 11'd1025;
        even_bram2_b_raddr_green <= bram_addr_c2;
        odd_bram2_b_raddr_green  <= bram_addr_c2 + 1'b1;
    end
end
//blue      bram地址处理
always @(posedge clk_in2)
begin
    if(bram_mode_c2 == 1'b0)
    begin
        even_bram1_b_raddr_blue <= bram_addr_c2;
        odd_bram1_b_raddr_blue  <= bram_addr_c2 + 1'b1;
        even_bram2_b_raddr_blue <= bram_addr_c2;
        odd_bram2_b_raddr_blue  <= bram_addr_c2 + 1'b1;
    end
    else
    begin
        even_bram1_b_raddr_blue <= bram_addr_c2 + 11'd1024;
        odd_bram1_b_raddr_blue  <= bram_addr_c2 + 11'd1025;
        even_bram2_b_raddr_blue <= bram_addr_c2;
        odd_bram2_b_raddr_blue  <= bram_addr_c2 + 1'b1;
    end
end

reg             [33:0]          frac_00_c3;
reg             [33:0]          frac_01_c3;
reg             [33:0]          frac_10_c3;
reg             [33:0]          frac_11_c3;
reg                             bram_mode_c3;
reg                             right_pixel_extand_flag_c3;
reg                             bottom_pixel_extand_flag_c3;

always @(posedge clk_in2)
begin
    frac_00_c3                  <= frac_00_c2;
    frac_01_c3                  <= frac_01_c2;
    frac_10_c3                  <= frac_10_c2;
    frac_11_c3                  <= frac_11_c2;
    bram_mode_c3                <= bram_mode_c2;
    right_pixel_extand_flag_c3  <= right_pixel_extand_flag_c2;
    bottom_pixel_extand_flag_c3 <= bottom_pixel_extand_flag_c2;
end

//----------------------------------------------------------------------
//  c4
reg                             img_vs_c4;
reg                             img_hs_c4;

always @(posedge clk_in2)
begin
    if(rst_n == 1'b0)
    begin
        img_vs_c4 <= 1'b0;
        img_hs_c4 <= 1'b0;
    end
    else
    begin
        img_vs_c4 <= img_vs_c3;
        img_hs_c4 <= img_hs_c3;
    end
end

reg             [33:0]          frac_00_c4;
reg             [33:0]          frac_01_c4;
reg             [33:0]          frac_10_c4;
reg             [33:0]          frac_11_c4;
reg                             bram_mode_c4;
reg                             right_pixel_extand_flag_c4;
reg                             bottom_pixel_extand_flag_c4;

always @(posedge clk_in2)
begin
    frac_00_c4                  <= frac_00_c3;
    frac_01_c4                  <= frac_01_c3;
    frac_10_c4                  <= frac_10_c3;
    frac_11_c4                  <= frac_11_c3;
    bram_mode_c4                <= bram_mode_c3;
    right_pixel_extand_flag_c4  <= right_pixel_extand_flag_c3;
    bottom_pixel_extand_flag_c4 <= bottom_pixel_extand_flag_c3;
end

//----------------------------------------------------------------------
//  c5
reg                             img_vs_c5;
reg                             img_hs_c5;

always @(posedge clk_in2)
begin
    if(rst_n == 1'b0)
    begin
        img_vs_c5 <= 1'b0;
        img_hs_c5 <= 1'b0;
    end
    else
    begin
        img_vs_c5 <= img_vs_c4;
        img_hs_c5 <= img_hs_c4;
    end
end
//gray
reg             [7:0]           pixel_data00_c5;
reg             [7:0]           pixel_data01_c5;
reg             [7:0]           pixel_data10_c5;
reg             [7:0]           pixel_data11_c5;

always @(posedge clk_in2)
begin
    if(bram_mode_c4 == 1'b0)
    begin
        pixel_data00_c5 <= even_bram1_b_rdata;
        pixel_data01_c5 <= odd_bram1_b_rdata;
        pixel_data10_c5 <= even_bram2_b_rdata;
        pixel_data11_c5 <= odd_bram2_b_rdata;
    end
    else
    begin
        pixel_data00_c5 <= even_bram2_b_rdata;
        pixel_data01_c5 <= odd_bram2_b_rdata;
        pixel_data10_c5 <= even_bram1_b_rdata;
        pixel_data11_c5 <= odd_bram1_b_rdata;
    end
end

//red
reg             [7:0]           red_data00_c5;
reg             [7:0]           red_data01_c5;
reg             [7:0]           red_data10_c5;
reg             [7:0]           red_data11_c5;

always @(posedge clk_in2)
begin
    if(bram_mode_c4 == 1'b0)
    begin
        red_data00_c5 <= even_bram1_b_rdata_red;
        red_data01_c5 <= odd_bram1_b_rdata_red;
        red_data10_c5 <= even_bram2_b_rdata_red;
        red_data11_c5 <= odd_bram2_b_rdata_red;
    end
    else
    begin
        red_data00_c5 <= even_bram2_b_rdata_red;
        red_data01_c5 <= odd_bram2_b_rdata_red;
        red_data10_c5 <= even_bram1_b_rdata_red;
        red_data11_c5 <= odd_bram1_b_rdata_red;
    end
end
//green
reg             [7:0]           green_data00_c5;
reg             [7:0]           green_data01_c5;
reg             [7:0]           green_data10_c5;
reg             [7:0]           green_data11_c5;

always @(posedge clk_in2)
begin
    if(bram_mode_c4 == 1'b0)
    begin
        green_data00_c5 <= even_bram1_b_rdata_green;
        green_data01_c5 <= odd_bram1_b_rdata_green;
        green_data10_c5 <= even_bram2_b_rdata_green;
        green_data11_c5 <= odd_bram2_b_rdata_green;
    end
    else
    begin
        green_data00_c5 <= even_bram2_b_rdata_green;
        green_data01_c5 <= odd_bram2_b_rdata_green;
        green_data10_c5 <= even_bram1_b_rdata_green;
        green_data11_c5 <= odd_bram1_b_rdata_green;
    end
end
//blue
reg             [7:0]           blue_data00_c5;
reg             [7:0]           blue_data01_c5;
reg             [7:0]           blue_data10_c5;
reg             [7:0]           blue_data11_c5;

always @(posedge clk_in2)
begin
    if(bram_mode_c4 == 1'b0)
    begin
        blue_data00_c5 <= even_bram1_b_rdata_blue;
        blue_data01_c5 <= odd_bram1_b_rdata_blue;
        blue_data10_c5 <= even_bram2_b_rdata_blue;
        blue_data11_c5 <= odd_bram2_b_rdata_blue;
    end
    else
    begin
        blue_data00_c5 <= even_bram2_b_rdata_blue;
        blue_data01_c5 <= odd_bram2_b_rdata_blue;
        blue_data10_c5 <= even_bram1_b_rdata_blue;
        blue_data11_c5 <= odd_bram1_b_rdata_blue;
    end
end


reg             [33:0]          frac_00_c5;
reg             [33:0]          frac_01_c5;
reg             [33:0]          frac_10_c5;
reg             [33:0]          frac_11_c5;
reg                             right_pixel_extand_flag_c5;
reg                             bottom_pixel_extand_flag_c5;

always @(posedge clk_in2)
begin
    frac_00_c5                  <= frac_00_c4;
    frac_01_c5                  <= frac_01_c4;
    frac_10_c5                  <= frac_10_c4;
    frac_11_c5                  <= frac_11_c4;
    right_pixel_extand_flag_c5  <= right_pixel_extand_flag_c4;
    bottom_pixel_extand_flag_c5 <= bottom_pixel_extand_flag_c4;
end

//----------------------------------------------------------------------
//  c6
reg                             img_vs_c6;
reg                             img_hs_c6;

always @(posedge clk_in2)
begin
    if(rst_n == 1'b0)
    begin
        img_vs_c6 <= 1'b0;
        img_hs_c6 <= 1'b0;
    end
    else
    begin
        img_vs_c6 <= img_vs_c5;
        img_hs_c6 <= img_hs_c5;
    end
end
//gray
reg             [7:0]           pixel_data00_c6;
reg             [7:0]           pixel_data01_c6;
reg             [7:0]           pixel_data10_c6;
reg             [7:0]           pixel_data11_c6;

always @(posedge clk_in2)
begin
    case({right_pixel_extand_flag_c5,bottom_pixel_extand_flag_c5})
        2'b00 : 
        begin
            pixel_data00_c6 <= pixel_data00_c5;
            pixel_data01_c6 <= pixel_data01_c5;
            pixel_data10_c6 <= pixel_data10_c5;
            pixel_data11_c6 <= pixel_data11_c5;
        end
        2'b01 : 
        begin
            pixel_data00_c6 <= pixel_data00_c5;
            pixel_data01_c6 <= pixel_data01_c5;
            pixel_data10_c6 <= pixel_data00_c5;
            pixel_data11_c6 <= pixel_data01_c5;
        end
        2'b10 : 
        begin
            pixel_data00_c6 <= pixel_data00_c5;
            pixel_data01_c6 <= pixel_data00_c5;
            pixel_data10_c6 <= pixel_data10_c5;
            pixel_data11_c6 <= pixel_data10_c5;
        end
        2'b11 : 
        begin
            pixel_data00_c6 <= pixel_data00_c5;
            pixel_data01_c6 <= pixel_data00_c5;
            pixel_data10_c6 <= pixel_data00_c5;
            pixel_data11_c6 <= pixel_data00_c5;
        end
    endcase
end
//red
reg             [7:0]           red_data00_c6;
reg             [7:0]           red_data01_c6;
reg             [7:0]           red_data10_c6;
reg             [7:0]           red_data11_c6;

always @(posedge clk_in2)
begin
    case({right_pixel_extand_flag_c5,bottom_pixel_extand_flag_c5})
        2'b00 : 
        begin
            red_data00_c6 <= red_data00_c5;
            red_data01_c6 <= red_data01_c5;
            red_data10_c6 <= red_data10_c5;
            red_data11_c6 <= red_data11_c5;
        end
        2'b01 : 
        begin
            red_data00_c6 <= red_data00_c5;
            red_data01_c6 <= red_data01_c5;
            red_data10_c6 <= red_data00_c5;
            red_data11_c6 <= red_data01_c5;
        end
        2'b10 : 
        begin
            red_data00_c6 <= red_data00_c5;
            red_data01_c6 <= red_data00_c5;
            red_data10_c6 <= red_data10_c5;
            red_data11_c6 <= red_data10_c5;
        end
        2'b11 : 
        begin
            red_data00_c6 <= red_data00_c5;
            red_data01_c6 <= red_data00_c5;
            red_data10_c6 <= red_data00_c5;
            red_data11_c6 <= red_data00_c5;
        end
    endcase
end
//green
reg             [7:0]           green_data00_c6;
reg             [7:0]           green_data01_c6;
reg             [7:0]           green_data10_c6;
reg             [7:0]           green_data11_c6;

always @(posedge clk_in2)
begin
    case({right_pixel_extand_flag_c5,bottom_pixel_extand_flag_c5})
        2'b00 : 
        begin
            green_data00_c6 <= green_data00_c5;
            green_data01_c6 <= green_data01_c5;
            green_data10_c6 <= green_data10_c5;
            green_data11_c6 <= green_data11_c5;
        end
        2'b01 : 
        begin
            green_data00_c6 <= green_data00_c5;
            green_data01_c6 <= green_data01_c5;
            green_data10_c6 <= green_data00_c5;
            green_data11_c6 <= green_data01_c5;
        end
        2'b10 : 
        begin
            green_data00_c6 <= green_data00_c5;
            green_data01_c6 <= green_data00_c5;
            green_data10_c6 <= green_data10_c5;
            green_data11_c6 <= green_data10_c5;
        end
        2'b11 : 
        begin
            green_data00_c6 <= green_data00_c5;
            green_data01_c6 <= green_data00_c5;
            green_data10_c6 <= green_data00_c5;
            green_data11_c6 <= green_data00_c5;
        end
    endcase
end
//blue
reg             [7:0]           blue_data00_c6;
reg             [7:0]           blue_data01_c6;
reg             [7:0]           blue_data10_c6;
reg             [7:0]           blue_data11_c6;

always @(posedge clk_in2)
begin
    case({right_pixel_extand_flag_c5,bottom_pixel_extand_flag_c5})
        2'b00 : 
        begin
            blue_data00_c6 <= blue_data00_c5;
            blue_data01_c6 <= blue_data01_c5;
            blue_data10_c6 <= blue_data10_c5;
            blue_data11_c6 <= blue_data11_c5;
        end
        2'b01 : 
        begin
            blue_data00_c6 <= blue_data00_c5;
            blue_data01_c6 <= blue_data01_c5;
            blue_data10_c6 <= blue_data00_c5;
            blue_data11_c6 <= blue_data01_c5;
        end
        2'b10 : 
        begin
            blue_data00_c6 <= blue_data00_c5;
            blue_data01_c6 <= blue_data00_c5;
            blue_data10_c6 <= blue_data10_c5;
            blue_data11_c6 <= blue_data10_c5;
        end
        2'b11 : 
        begin
            blue_data00_c6 <= blue_data00_c5;
            blue_data01_c6 <= blue_data00_c5;
            blue_data10_c6 <= blue_data00_c5;
            blue_data11_c6 <= blue_data00_c5;
        end
    endcase
end

reg             [33:0]          frac_00_c6;
reg             [33:0]          frac_01_c6;
reg             [33:0]          frac_10_c6;
reg             [33:0]          frac_11_c6;

always @(posedge clk_in2)
begin
    frac_00_c6 <= frac_00_c5;
    frac_01_c6 <= frac_01_c5;
    frac_10_c6 <= frac_10_c5;
    frac_11_c6 <= frac_11_c5;
end

//----------------------------------------------------------------------
//  c7
reg                             img_vs_c7;
reg                             img_hs_c7;

always @(posedge clk_in2)
begin
    if(rst_n == 1'b0)
    begin
        img_vs_c7 <= 1'b0;
        img_hs_c7 <= 1'b0;
    end
    else
    begin
        img_vs_c7 <= img_vs_c6;
        img_hs_c7 <= img_hs_c6;
    end
end
//gray
reg             [41:0]          gray_data00_c7;
reg             [41:0]          gray_data01_c7;
reg             [41:0]          gray_data10_c7;
reg             [41:0]          gray_data11_c7;

always @(posedge clk_in2)
begin
    gray_data00_c7 <= frac_00_c6 * pixel_data00_c6;
    gray_data01_c7 <= frac_01_c6 * pixel_data01_c6;
    gray_data10_c7 <= frac_10_c6 * pixel_data10_c6;
    gray_data11_c7 <= frac_11_c6 * pixel_data11_c6;
end

//red
reg             [41:0]          red_data00_c7;
reg             [41:0]          red_data01_c7;
reg             [41:0]          red_data10_c7;
reg             [41:0]          red_data11_c7;

always @(posedge clk_in2)
begin
    red_data00_c7 <= frac_00_c6 * red_data00_c6;
    red_data01_c7 <= frac_01_c6 * red_data01_c6;
    red_data10_c7 <= frac_10_c6 * red_data10_c6;
    red_data11_c7 <= frac_11_c6 * red_data11_c6;
end
//green
reg             [41:0]          green_data00_c7;
reg             [41:0]          green_data01_c7;
reg             [41:0]          green_data10_c7;
reg             [41:0]          green_data11_c7;

always @(posedge clk_in2)
begin
    green_data00_c7 <= frac_00_c6 * green_data00_c6;
    green_data01_c7 <= frac_01_c6 * green_data01_c6;
    green_data10_c7 <= frac_10_c6 * green_data10_c6;
    green_data11_c7 <= frac_11_c6 * green_data11_c6;
end
//blue
reg             [41:0]          blue_data00_c7;
reg             [41:0]          blue_data01_c7;
reg             [41:0]          blue_data10_c7;
reg             [41:0]          blue_data11_c7;

always @(posedge clk_in2)
begin
    blue_data00_c7 <= frac_00_c6 * blue_data00_c6;
    blue_data01_c7 <= frac_01_c6 * blue_data01_c6;
    blue_data10_c7 <= frac_10_c6 * blue_data10_c6;
    blue_data11_c7 <= frac_11_c6 * blue_data11_c6;
end


//----------------------------------------------------------------------
//  c8
reg                             img_vs_c8;
reg                             img_hs_c8;

always @(posedge clk_in2)
begin
    if(rst_n == 1'b0)
    begin
        img_vs_c8 <= 1'b0;
        img_hs_c8 <= 1'b0;
    end
    else
    begin
        img_vs_c8 <= img_vs_c7;
        img_hs_c8 <= img_hs_c7;
    end
end
//gray
reg             [42:0]          gray_data_tmp1_c8;
reg             [42:0]          gray_data_tmp2_c8;

always @(posedge clk_in2)
begin
    gray_data_tmp1_c8 <= gray_data00_c7 + gray_data01_c7;
    gray_data_tmp2_c8 <= gray_data10_c7 + gray_data11_c7;
end
//red
reg             [42:0]          red_data_tmp1_c8;
reg             [42:0]          red_data_tmp2_c8;

always @(posedge clk_in2)
begin
    red_data_tmp1_c8 <= red_data00_c7 + red_data01_c7;
    red_data_tmp2_c8 <= red_data10_c7 + red_data11_c7;
end
//green
reg             [42:0]          green_data_tmp1_c8;
reg             [42:0]          green_data_tmp2_c8;

always @(posedge clk_in2)
begin
    green_data_tmp1_c8 <= green_data00_c7 + green_data01_c7;
    green_data_tmp2_c8 <= green_data10_c7 + green_data11_c7;
end
//blue
reg             [42:0]          blue_data_tmp1_c8;
reg             [42:0]          blue_data_tmp2_c8;

always @(posedge clk_in2)
begin
    blue_data_tmp1_c8 <= blue_data00_c7 + blue_data01_c7;
    blue_data_tmp2_c8 <= blue_data10_c7 + blue_data11_c7;
end

//----------------------------------------------------------------------
//  c9
reg                             img_vs_c9;
reg                             img_hs_c9;

always @(posedge clk_in2)
begin
    if(rst_n == 1'b0)
    begin
        img_vs_c9 <= 1'b0;
        img_hs_c9 <= 1'b0;
    end
    else
    begin
        img_vs_c9 <= img_vs_c8;
        img_hs_c9 <= img_hs_c8;
    end
end
//gray
reg             [43:0]          gray_data_c9;

always @(posedge clk_in2)
begin
    gray_data_c9 <= gray_data_tmp1_c8 + gray_data_tmp2_c8;
end
//red
reg             [43:0]          red_data_c9;

always @(posedge clk_in2)
begin
    red_data_c9 <= red_data_tmp1_c8 + red_data_tmp2_c8;
end
//green
reg             [43:0]          green_data_c9;

always @(posedge clk_in2)
begin
    green_data_c9 <= green_data_tmp1_c8 + green_data_tmp2_c8;
end
//blue
reg             [43:0]          blue_data_c9;

always @(posedge clk_in2)
begin
    blue_data_c9 <= blue_data_tmp1_c8 + blue_data_tmp2_c8;
end

//----------------------------------------------------------------------
//  c10
reg                             img_vs_c10;
reg                             img_hs_c10;

always @(posedge clk_in2)
begin
    if(rst_n == 1'b0)
    begin
        img_vs_c10 <= 1'b0;
        img_hs_c10 <= 1'b0;
    end
    else
    begin
        img_vs_c10 <= img_vs_c9;
        img_hs_c10 <= img_hs_c9;
    end
end
//gray
reg             [11:0]          gray_data_c10;

always @(posedge clk_in2)
begin
    gray_data_c10 <= gray_data_c9[43:32] + gray_data_c9[31];
end
//red
reg             [11:0]          red_data_c10;

always @(posedge clk_in2)
begin
    red_data_c10 <= red_data_c9[43:32] + red_data_c9[31];
end
//green
reg             [11:0]          green_data_c10;

always @(posedge clk_in2)
begin
    green_data_c10 <= green_data_c9[43:32] + green_data_c9[31];
end
//blue
reg             [11:0]          blue_data_c10;

always @(posedge clk_in2)
begin
    blue_data_c10 <= blue_data_c9[43:32] + blue_data_c9[31];
end

//----------------------------------------------------------------------
//  signals output
always @(posedge clk_in2)
begin
    if(rst_n == 1'b0)
    begin
        post_img_vsync <= 1'b0;
        post_img_href  <= 1'b0;
    end
    else
    begin
        post_img_vsync <= img_vs_c10;
        post_img_href  <= img_hs_c10;
    end
end
//gray 判断是否越界
always @(posedge clk_in2)
begin
    if(gray_data_c10 > 12'd255)
        post_img_gray <= 8'd255;
    else
        post_img_gray <= gray_data_c10[7:0];
end
//red 判断是否越界
always @(posedge clk_in2)
begin
    if(red_data_c10 > 12'd255)
        post_img_red <= 8'd255;
    else
        post_img_red <= red_data_c10[7:0];
end
//green 判断是否越界
always @(posedge clk_in2)
begin
    if(green_data_c10 > 12'd255)
        post_img_green <= 8'd255;
    else
        post_img_green <= green_data_c10[7:0];
end
//blue 判断是否越界
always @(posedge clk_in2)
begin
    if(blue_data_c10 > 12'd255)
        post_img_blue <= 8'd255;
    else
        post_img_blue <= blue_data_c10[7:0];
end

endmodule

