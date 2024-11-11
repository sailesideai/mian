
# Auto-generated by Interface Designer
#
# WARNING: Any manual changes made to this file will be lost when generating constraints.

# Efinity Interface Designer SDC
# Version: 2023.M.288
# Date: 2023-11-24 13:31

# Copyright (C) 2017 - 2023 Efinix Inc. All rights reserved.

# Device: Ti180J484
# Project: ti180_ddr3_controller
# Timing Model: C4 (final)

# PLL Constraints
#################
create_clock -period 10.0000 clk
create_clock -period 20.0000 sys_clk_50mhz
create_clock -period 2.5000 ddr_tdqss_clk
create_clock -period 5.0000 ddr_core_clk
create_clock -period 2.5000 ddr_tac_clk
create_clock -waveform {0.6250 1.8750} -period 2.5000 ddr_twd_clk
create_clock -period 20.0000 pll_inst1_CLKOUT4

# HSIO GPIO Constraints
#########################
# set_input_delay -clock <CLOCK> [-reference_pin <clkout_pad>] -max <MAX CALCULATION> [get_ports {reset_n}]
# set_input_delay -clock <CLOCK> [-reference_pin <clkout_pad>] -min <MIN CALCULATION> [get_ports {reset_n}]
set_output_delay -clock ddr_tdqss_clk -reference_pin [get_ports {ddr_tdqss_clk~CLKOUT~333~421}] -max 0.263 [get_ports {ddr_addr[0]}]
set_output_delay -clock ddr_tdqss_clk -reference_pin [get_ports {ddr_tdqss_clk~CLKOUT~333~421}] -min -0.140 [get_ports {ddr_addr[0]}]
set_output_delay -clock ddr_tdqss_clk -reference_pin [get_ports {ddr_tdqss_clk~CLKOUT~333~420}] -max 0.263 [get_ports {ddr_addr[1]}]
set_output_delay -clock ddr_tdqss_clk -reference_pin [get_ports {ddr_tdqss_clk~CLKOUT~333~420}] -min -0.140 [get_ports {ddr_addr[1]}]
set_output_delay -clock ddr_tdqss_clk -reference_pin [get_ports {ddr_tdqss_clk~CLKOUT~333~384}] -max 0.263 [get_ports {ddr_addr[2]}]
set_output_delay -clock ddr_tdqss_clk -reference_pin [get_ports {ddr_tdqss_clk~CLKOUT~333~384}] -min -0.140 [get_ports {ddr_addr[2]}]
set_output_delay -clock ddr_tdqss_clk -reference_pin [get_ports {ddr_tdqss_clk~CLKOUT~333~385}] -max 0.263 [get_ports {ddr_addr[3]}]
set_output_delay -clock ddr_tdqss_clk -reference_pin [get_ports {ddr_tdqss_clk~CLKOUT~333~385}] -min -0.140 [get_ports {ddr_addr[3]}]
set_output_delay -clock ddr_tdqss_clk -reference_pin [get_ports {ddr_tdqss_clk~CLKOUT~333~360}] -max 0.263 [get_ports {ddr_addr[4]}]
set_output_delay -clock ddr_tdqss_clk -reference_pin [get_ports {ddr_tdqss_clk~CLKOUT~333~360}] -min -0.140 [get_ports {ddr_addr[4]}]
set_output_delay -clock ddr_tdqss_clk -reference_pin [get_ports {ddr_tdqss_clk~CLKOUT~333~359}] -max 0.263 [get_ports {ddr_addr[5]}]
set_output_delay -clock ddr_tdqss_clk -reference_pin [get_ports {ddr_tdqss_clk~CLKOUT~333~359}] -min -0.140 [get_ports {ddr_addr[5]}]
set_output_delay -clock ddr_tdqss_clk -reference_pin [get_ports {ddr_tdqss_clk~CLKOUT~333~349}] -max 0.263 [get_ports {ddr_addr[6]}]
set_output_delay -clock ddr_tdqss_clk -reference_pin [get_ports {ddr_tdqss_clk~CLKOUT~333~349}] -min -0.140 [get_ports {ddr_addr[6]}]
set_output_delay -clock ddr_tdqss_clk -reference_pin [get_ports {ddr_tdqss_clk~CLKOUT~333~348}] -max 0.263 [get_ports {ddr_addr[7]}]
set_output_delay -clock ddr_tdqss_clk -reference_pin [get_ports {ddr_tdqss_clk~CLKOUT~333~348}] -min -0.140 [get_ports {ddr_addr[7]}]
set_output_delay -clock ddr_tdqss_clk -reference_pin [get_ports {ddr_tdqss_clk~CLKOUT~333~336}] -max 0.263 [get_ports {ddr_addr[8]}]
set_output_delay -clock ddr_tdqss_clk -reference_pin [get_ports {ddr_tdqss_clk~CLKOUT~333~336}] -min -0.140 [get_ports {ddr_addr[8]}]
set_output_delay -clock ddr_tdqss_clk -reference_pin [get_ports {ddr_tdqss_clk~CLKOUT~333~337}] -max 0.263 [get_ports {ddr_addr[9]}]
set_output_delay -clock ddr_tdqss_clk -reference_pin [get_ports {ddr_tdqss_clk~CLKOUT~333~337}] -min -0.140 [get_ports {ddr_addr[9]}]
set_output_delay -clock ddr_tdqss_clk -reference_pin [get_ports {ddr_tdqss_clk~CLKOUT~333~329}] -max 0.263 [get_ports {ddr_addr[10]}]
set_output_delay -clock ddr_tdqss_clk -reference_pin [get_ports {ddr_tdqss_clk~CLKOUT~333~329}] -min -0.140 [get_ports {ddr_addr[10]}]
set_output_delay -clock ddr_tdqss_clk -reference_pin [get_ports {ddr_tdqss_clk~CLKOUT~333~328}] -max 0.263 [get_ports {ddr_addr[11]}]
set_output_delay -clock ddr_tdqss_clk -reference_pin [get_ports {ddr_tdqss_clk~CLKOUT~333~328}] -min -0.140 [get_ports {ddr_addr[11]}]
set_output_delay -clock ddr_tdqss_clk -reference_pin [get_ports {ddr_tdqss_clk~CLKOUT~333~305}] -max 0.263 [get_ports {ddr_addr[12]}]
set_output_delay -clock ddr_tdqss_clk -reference_pin [get_ports {ddr_tdqss_clk~CLKOUT~333~305}] -min -0.140 [get_ports {ddr_addr[12]}]
set_output_delay -clock ddr_tdqss_clk -reference_pin [get_ports {ddr_tdqss_clk~CLKOUT~333~304}] -max 0.263 [get_ports {ddr_addr[13]}]
set_output_delay -clock ddr_tdqss_clk -reference_pin [get_ports {ddr_tdqss_clk~CLKOUT~333~304}] -min -0.140 [get_ports {ddr_addr[13]}]
set_output_delay -clock ddr_tdqss_clk -reference_pin [get_ports {ddr_tdqss_clk~CLKOUT~333~294}] -max 0.263 [get_ports {ddr_addr[14]}]
set_output_delay -clock ddr_tdqss_clk -reference_pin [get_ports {ddr_tdqss_clk~CLKOUT~333~294}] -min -0.140 [get_ports {ddr_addr[14]}]
set_output_delay -clock ddr_tdqss_clk -reference_pin [get_ports {ddr_tdqss_clk~CLKOUT~333~293}] -max 0.263 [get_ports {ddr_addr[15]}]
set_output_delay -clock ddr_tdqss_clk -reference_pin [get_ports {ddr_tdqss_clk~CLKOUT~333~293}] -min -0.140 [get_ports {ddr_addr[15]}]
set_output_delay -clock ddr_tdqss_clk -reference_pin [get_ports {ddr_tdqss_clk~CLKOUT~333~279}] -max 0.263 [get_ports {ddr_ba[0]}]
set_output_delay -clock ddr_tdqss_clk -reference_pin [get_ports {ddr_tdqss_clk~CLKOUT~333~279}] -min -0.140 [get_ports {ddr_ba[0]}]
set_output_delay -clock ddr_tdqss_clk -reference_pin [get_ports {ddr_tdqss_clk~CLKOUT~333~280}] -max 0.263 [get_ports {ddr_ba[1]}]
set_output_delay -clock ddr_tdqss_clk -reference_pin [get_ports {ddr_tdqss_clk~CLKOUT~333~280}] -min -0.140 [get_ports {ddr_ba[1]}]
set_output_delay -clock ddr_tdqss_clk -reference_pin [get_ports {ddr_tdqss_clk~CLKOUT~333~269}] -max 0.263 [get_ports {ddr_ba[2]}]
set_output_delay -clock ddr_tdqss_clk -reference_pin [get_ports {ddr_tdqss_clk~CLKOUT~333~269}] -min -0.140 [get_ports {ddr_ba[2]}]
# set_output_delay -clock <CLOCK> [-reference_pin <clkout_pad>] -max <MAX CALCULATION> [get_ports {ddr_cal_done}]
# set_output_delay -clock <CLOCK> [-reference_pin <clkout_pad>] -min <MIN CALCULATION> [get_ports {ddr_cal_done}]
# set_output_delay -clock <CLOCK> [-reference_pin <clkout_pad>] -max <MAX CALCULATION> [get_ports {ddr_cal_pass}]
# set_output_delay -clock <CLOCK> [-reference_pin <clkout_pad>] -min <MIN CALCULATION> [get_ports {ddr_cal_pass}]
set_output_delay -clock ddr_tdqss_clk -reference_pin [get_ports {ddr_tdqss_clk~CLKOUT~333~257}] -max 0.263 [get_ports {ddr_cas}]
set_output_delay -clock ddr_tdqss_clk -reference_pin [get_ports {ddr_tdqss_clk~CLKOUT~333~257}] -min -0.140 [get_ports {ddr_cas}]
set_output_delay -clock ddr_tdqss_clk -reference_pin [get_ports {ddr_tdqss_clk~CLKOUT~333~245}] -max 0.263 [get_ports {ddr_cke}]
set_output_delay -clock ddr_tdqss_clk -reference_pin [get_ports {ddr_tdqss_clk~CLKOUT~333~245}] -min -0.140 [get_ports {ddr_cke}]
set_output_delay -clock ddr_tdqss_clk -reference_pin [get_ports {ddr_tdqss_clk~CLKOUT~333~246}] -max 0.263 [get_ports {ddr_cs}]
set_output_delay -clock ddr_tdqss_clk -reference_pin [get_ports {ddr_tdqss_clk~CLKOUT~333~246}] -min -0.140 [get_ports {ddr_cs}]
set_output_delay -clock ddr_twd_clk -reference_pin [get_ports {ddr_twd_clk~CLKOUT~253~1}] -max 0.263 [get_ports {o_ddr_dm_lo[0] o_ddr_dm_hi[0]}]
set_output_delay -clock ddr_twd_clk -reference_pin [get_ports {ddr_twd_clk~CLKOUT~253~1}] -min -0.140 [get_ports {o_ddr_dm_lo[0] o_ddr_dm_hi[0]}]
set_output_delay -clock ddr_twd_clk -reference_pin [get_ports {ddr_twd_clk~CLKOUT~229~1}] -max 0.263 [get_ports {o_ddr_dm_lo[1] o_ddr_dm_hi[1]}]
set_output_delay -clock ddr_twd_clk -reference_pin [get_ports {ddr_twd_clk~CLKOUT~229~1}] -min -0.140 [get_ports {o_ddr_dm_lo[1] o_ddr_dm_hi[1]}]
# set_output_delay -clock <CLOCK> [-reference_pin <clkout_pad>] -max <MAX CALCULATION> [get_ports {done}]
# set_output_delay -clock <CLOCK> [-reference_pin <clkout_pad>] -min <MIN CALCULATION> [get_ports {done}]
set_output_delay -clock ddr_tdqss_clk -reference_pin [get_ports {ddr_tdqss_clk~CLKOUT~333~234}] -max 0.263 [get_ports {ddr_odt}]
set_output_delay -clock ddr_tdqss_clk -reference_pin [get_ports {ddr_tdqss_clk~CLKOUT~333~234}] -min -0.140 [get_ports {ddr_odt}]
# set_output_delay -clock <CLOCK> [-reference_pin <clkout_pad>] -max <MAX CALCULATION> [get_ports {pass}]
# set_output_delay -clock <CLOCK> [-reference_pin <clkout_pad>] -min <MIN CALCULATION> [get_ports {pass}]
set_output_delay -clock ddr_tdqss_clk -reference_pin [get_ports {ddr_tdqss_clk~CLKOUT~333~256}] -max 0.263 [get_ports {ddr_ras}]
set_output_delay -clock ddr_tdqss_clk -reference_pin [get_ports {ddr_tdqss_clk~CLKOUT~333~256}] -min -0.140 [get_ports {ddr_ras}]
set_output_delay -clock ddr_tdqss_clk -reference_pin [get_ports {ddr_tdqss_clk~CLKOUT~333~235}] -max 0.263 [get_ports {ddr_reset}]
set_output_delay -clock ddr_tdqss_clk -reference_pin [get_ports {ddr_tdqss_clk~CLKOUT~333~235}] -min -0.140 [get_ports {ddr_reset}]
set_output_delay -clock ddr_tdqss_clk -reference_pin [get_ports {ddr_tdqss_clk~CLKOUT~333~268}] -max 0.263 [get_ports {ddr_we}]
set_output_delay -clock ddr_tdqss_clk -reference_pin [get_ports {ddr_tdqss_clk~CLKOUT~333~268}] -min -0.140 [get_ports {ddr_we}]
set_input_delay -clock ddr_tac_clk -reference_pin [get_ports {ddr_tac_clk~CLKOUT~322~1}] -max 0.414 [get_ports {i_ddr_dq_lo[0] i_ddr_dq_hi[0]}]
set_input_delay -clock ddr_tac_clk -reference_pin [get_ports {ddr_tac_clk~CLKOUT~322~1}] -min 0.276 [get_ports {i_ddr_dq_lo[0] i_ddr_dq_hi[0]}]
set_output_delay -clock ddr_twd_clk -reference_pin [get_ports {ddr_twd_clk~CLKOUT~324~1}] -max 0.263 [get_ports {o_ddr_dq_lo[0] o_ddr_dq_hi[0]}]
set_output_delay -clock ddr_twd_clk -reference_pin [get_ports {ddr_twd_clk~CLKOUT~324~1}] -min -0.140 [get_ports {o_ddr_dq_lo[0] o_ddr_dq_hi[0]}]
set_output_delay -clock ddr_twd_clk -reference_pin [get_ports {ddr_twd_clk~CLKOUT~324~1}] -max 0.263 [get_ports {o_ddr_dq_oe[0]}]
set_output_delay -clock ddr_twd_clk -reference_pin [get_ports {ddr_twd_clk~CLKOUT~324~1}] -min -0.140 [get_ports {o_ddr_dq_oe[0]}]
set_input_delay -clock ddr_tac_clk -reference_pin [get_ports {ddr_tac_clk~CLKOUT~323~1}] -max 0.414 [get_ports {i_ddr_dq_lo[1] i_ddr_dq_hi[1]}]
set_input_delay -clock ddr_tac_clk -reference_pin [get_ports {ddr_tac_clk~CLKOUT~323~1}] -min 0.276 [get_ports {i_ddr_dq_lo[1] i_ddr_dq_hi[1]}]
set_output_delay -clock ddr_twd_clk -reference_pin [get_ports {ddr_twd_clk~CLKOUT~325~1}] -max 0.263 [get_ports {o_ddr_dq_lo[1] o_ddr_dq_hi[1]}]
set_output_delay -clock ddr_twd_clk -reference_pin [get_ports {ddr_twd_clk~CLKOUT~325~1}] -min -0.140 [get_ports {o_ddr_dq_lo[1] o_ddr_dq_hi[1]}]
set_output_delay -clock ddr_twd_clk -reference_pin [get_ports {ddr_twd_clk~CLKOUT~325~1}] -max 0.263 [get_ports {o_ddr_dq_oe[1]}]
set_output_delay -clock ddr_twd_clk -reference_pin [get_ports {ddr_twd_clk~CLKOUT~325~1}] -min -0.140 [get_ports {o_ddr_dq_oe[1]}]
set_input_delay -clock ddr_tac_clk -reference_pin [get_ports {ddr_tac_clk~CLKOUT~313~1}] -max 0.414 [get_ports {i_ddr_dq_lo[2] i_ddr_dq_hi[2]}]
set_input_delay -clock ddr_tac_clk -reference_pin [get_ports {ddr_tac_clk~CLKOUT~313~1}] -min 0.276 [get_ports {i_ddr_dq_lo[2] i_ddr_dq_hi[2]}]
set_output_delay -clock ddr_twd_clk -reference_pin [get_ports {ddr_twd_clk~CLKOUT~315~1}] -max 0.263 [get_ports {o_ddr_dq_lo[2] o_ddr_dq_hi[2]}]
set_output_delay -clock ddr_twd_clk -reference_pin [get_ports {ddr_twd_clk~CLKOUT~315~1}] -min -0.140 [get_ports {o_ddr_dq_lo[2] o_ddr_dq_hi[2]}]
set_output_delay -clock ddr_twd_clk -reference_pin [get_ports {ddr_twd_clk~CLKOUT~315~1}] -max 0.263 [get_ports {o_ddr_dq_oe[2]}]
set_output_delay -clock ddr_twd_clk -reference_pin [get_ports {ddr_twd_clk~CLKOUT~315~1}] -min -0.140 [get_ports {o_ddr_dq_oe[2]}]
set_input_delay -clock ddr_tac_clk -reference_pin [get_ports {ddr_tac_clk~CLKOUT~314~1}] -max 0.414 [get_ports {i_ddr_dq_lo[3] i_ddr_dq_hi[3]}]
set_input_delay -clock ddr_tac_clk -reference_pin [get_ports {ddr_tac_clk~CLKOUT~314~1}] -min 0.276 [get_ports {i_ddr_dq_lo[3] i_ddr_dq_hi[3]}]
set_output_delay -clock ddr_twd_clk -reference_pin [get_ports {ddr_twd_clk~CLKOUT~316~1}] -max 0.263 [get_ports {o_ddr_dq_lo[3] o_ddr_dq_hi[3]}]
set_output_delay -clock ddr_twd_clk -reference_pin [get_ports {ddr_twd_clk~CLKOUT~316~1}] -min -0.140 [get_ports {o_ddr_dq_lo[3] o_ddr_dq_hi[3]}]
set_output_delay -clock ddr_twd_clk -reference_pin [get_ports {ddr_twd_clk~CLKOUT~316~1}] -max 0.263 [get_ports {o_ddr_dq_oe[3]}]
set_output_delay -clock ddr_twd_clk -reference_pin [get_ports {ddr_twd_clk~CLKOUT~316~1}] -min -0.140 [get_ports {o_ddr_dq_oe[3]}]
set_input_delay -clock ddr_tac_clk -reference_pin [get_ports {ddr_tac_clk~CLKOUT~305~1}] -max 0.414 [get_ports {i_ddr_dq_lo[4] i_ddr_dq_hi[4]}]
set_input_delay -clock ddr_tac_clk -reference_pin [get_ports {ddr_tac_clk~CLKOUT~305~1}] -min 0.276 [get_ports {i_ddr_dq_lo[4] i_ddr_dq_hi[4]}]
set_output_delay -clock ddr_twd_clk -reference_pin [get_ports {ddr_twd_clk~CLKOUT~307~1}] -max 0.263 [get_ports {o_ddr_dq_lo[4] o_ddr_dq_hi[4]}]
set_output_delay -clock ddr_twd_clk -reference_pin [get_ports {ddr_twd_clk~CLKOUT~307~1}] -min -0.140 [get_ports {o_ddr_dq_lo[4] o_ddr_dq_hi[4]}]
set_output_delay -clock ddr_twd_clk -reference_pin [get_ports {ddr_twd_clk~CLKOUT~307~1}] -max 0.263 [get_ports {o_ddr_dq_oe[4]}]
set_output_delay -clock ddr_twd_clk -reference_pin [get_ports {ddr_twd_clk~CLKOUT~307~1}] -min -0.140 [get_ports {o_ddr_dq_oe[4]}]
set_input_delay -clock ddr_tac_clk -reference_pin [get_ports {ddr_tac_clk~CLKOUT~304~1}] -max 0.414 [get_ports {i_ddr_dq_lo[5] i_ddr_dq_hi[5]}]
set_input_delay -clock ddr_tac_clk -reference_pin [get_ports {ddr_tac_clk~CLKOUT~304~1}] -min 0.276 [get_ports {i_ddr_dq_lo[5] i_ddr_dq_hi[5]}]
set_output_delay -clock ddr_twd_clk -reference_pin [get_ports {ddr_twd_clk~CLKOUT~306~1}] -max 0.263 [get_ports {o_ddr_dq_lo[5] o_ddr_dq_hi[5]}]
set_output_delay -clock ddr_twd_clk -reference_pin [get_ports {ddr_twd_clk~CLKOUT~306~1}] -min -0.140 [get_ports {o_ddr_dq_lo[5] o_ddr_dq_hi[5]}]
set_output_delay -clock ddr_twd_clk -reference_pin [get_ports {ddr_twd_clk~CLKOUT~306~1}] -max 0.263 [get_ports {o_ddr_dq_oe[5]}]
set_output_delay -clock ddr_twd_clk -reference_pin [get_ports {ddr_twd_clk~CLKOUT~306~1}] -min -0.140 [get_ports {o_ddr_dq_oe[5]}]
set_input_delay -clock ddr_tac_clk -reference_pin [get_ports {ddr_tac_clk~CLKOUT~295~1}] -max 0.414 [get_ports {i_ddr_dq_lo[6] i_ddr_dq_hi[6]}]
set_input_delay -clock ddr_tac_clk -reference_pin [get_ports {ddr_tac_clk~CLKOUT~295~1}] -min 0.276 [get_ports {i_ddr_dq_lo[6] i_ddr_dq_hi[6]}]
set_output_delay -clock ddr_twd_clk -reference_pin [get_ports {ddr_twd_clk~CLKOUT~297~1}] -max 0.263 [get_ports {o_ddr_dq_lo[6] o_ddr_dq_hi[6]}]
set_output_delay -clock ddr_twd_clk -reference_pin [get_ports {ddr_twd_clk~CLKOUT~297~1}] -min -0.140 [get_ports {o_ddr_dq_lo[6] o_ddr_dq_hi[6]}]
set_output_delay -clock ddr_twd_clk -reference_pin [get_ports {ddr_twd_clk~CLKOUT~297~1}] -max 0.263 [get_ports {o_ddr_dq_oe[6]}]
set_output_delay -clock ddr_twd_clk -reference_pin [get_ports {ddr_twd_clk~CLKOUT~297~1}] -min -0.140 [get_ports {o_ddr_dq_oe[6]}]
set_input_delay -clock ddr_tac_clk -reference_pin [get_ports {ddr_tac_clk~CLKOUT~296~1}] -max 0.414 [get_ports {i_ddr_dq_lo[7] i_ddr_dq_hi[7]}]
set_input_delay -clock ddr_tac_clk -reference_pin [get_ports {ddr_tac_clk~CLKOUT~296~1}] -min 0.276 [get_ports {i_ddr_dq_lo[7] i_ddr_dq_hi[7]}]
set_output_delay -clock ddr_twd_clk -reference_pin [get_ports {ddr_twd_clk~CLKOUT~298~1}] -max 0.263 [get_ports {o_ddr_dq_lo[7] o_ddr_dq_hi[7]}]
set_output_delay -clock ddr_twd_clk -reference_pin [get_ports {ddr_twd_clk~CLKOUT~298~1}] -min -0.140 [get_ports {o_ddr_dq_lo[7] o_ddr_dq_hi[7]}]
set_output_delay -clock ddr_twd_clk -reference_pin [get_ports {ddr_twd_clk~CLKOUT~298~1}] -max 0.263 [get_ports {o_ddr_dq_oe[7]}]
set_output_delay -clock ddr_twd_clk -reference_pin [get_ports {ddr_twd_clk~CLKOUT~298~1}] -min -0.140 [get_ports {o_ddr_dq_oe[7]}]
set_input_delay -clock ddr_tac_clk -reference_pin [get_ports {ddr_tac_clk~CLKOUT~287~1}] -max 0.414 [get_ports {i_ddr_dq_lo[8] i_ddr_dq_hi[8]}]
set_input_delay -clock ddr_tac_clk -reference_pin [get_ports {ddr_tac_clk~CLKOUT~287~1}] -min 0.276 [get_ports {i_ddr_dq_lo[8] i_ddr_dq_hi[8]}]
set_output_delay -clock ddr_twd_clk -reference_pin [get_ports {ddr_twd_clk~CLKOUT~289~1}] -max 0.263 [get_ports {o_ddr_dq_lo[8] o_ddr_dq_hi[8]}]
set_output_delay -clock ddr_twd_clk -reference_pin [get_ports {ddr_twd_clk~CLKOUT~289~1}] -min -0.140 [get_ports {o_ddr_dq_lo[8] o_ddr_dq_hi[8]}]
set_output_delay -clock ddr_twd_clk -reference_pin [get_ports {ddr_twd_clk~CLKOUT~289~1}] -max 0.263 [get_ports {o_ddr_dq_oe[8]}]
set_output_delay -clock ddr_twd_clk -reference_pin [get_ports {ddr_twd_clk~CLKOUT~289~1}] -min -0.140 [get_ports {o_ddr_dq_oe[8]}]
set_input_delay -clock ddr_tac_clk -reference_pin [get_ports {ddr_tac_clk~CLKOUT~288~1}] -max 0.414 [get_ports {i_ddr_dq_lo[9] i_ddr_dq_hi[9]}]
set_input_delay -clock ddr_tac_clk -reference_pin [get_ports {ddr_tac_clk~CLKOUT~288~1}] -min 0.276 [get_ports {i_ddr_dq_lo[9] i_ddr_dq_hi[9]}]
set_output_delay -clock ddr_twd_clk -reference_pin [get_ports {ddr_twd_clk~CLKOUT~290~1}] -max 0.263 [get_ports {o_ddr_dq_lo[9] o_ddr_dq_hi[9]}]
set_output_delay -clock ddr_twd_clk -reference_pin [get_ports {ddr_twd_clk~CLKOUT~290~1}] -min -0.140 [get_ports {o_ddr_dq_lo[9] o_ddr_dq_hi[9]}]
set_output_delay -clock ddr_twd_clk -reference_pin [get_ports {ddr_twd_clk~CLKOUT~290~1}] -max 0.263 [get_ports {o_ddr_dq_oe[9]}]
set_output_delay -clock ddr_twd_clk -reference_pin [get_ports {ddr_twd_clk~CLKOUT~290~1}] -min -0.140 [get_ports {o_ddr_dq_oe[9]}]
set_input_delay -clock ddr_tac_clk -reference_pin [get_ports {ddr_tac_clk~CLKOUT~279~1}] -max 0.414 [get_ports {i_ddr_dq_lo[10] i_ddr_dq_hi[10]}]
set_input_delay -clock ddr_tac_clk -reference_pin [get_ports {ddr_tac_clk~CLKOUT~279~1}] -min 0.276 [get_ports {i_ddr_dq_lo[10] i_ddr_dq_hi[10]}]
set_output_delay -clock ddr_twd_clk -reference_pin [get_ports {ddr_twd_clk~CLKOUT~281~1}] -max 0.263 [get_ports {o_ddr_dq_lo[10] o_ddr_dq_hi[10]}]
set_output_delay -clock ddr_twd_clk -reference_pin [get_ports {ddr_twd_clk~CLKOUT~281~1}] -min -0.140 [get_ports {o_ddr_dq_lo[10] o_ddr_dq_hi[10]}]
set_output_delay -clock ddr_twd_clk -reference_pin [get_ports {ddr_twd_clk~CLKOUT~281~1}] -max 0.263 [get_ports {o_ddr_dq_oe[10]}]
set_output_delay -clock ddr_twd_clk -reference_pin [get_ports {ddr_twd_clk~CLKOUT~281~1}] -min -0.140 [get_ports {o_ddr_dq_oe[10]}]
set_input_delay -clock ddr_tac_clk -reference_pin [get_ports {ddr_tac_clk~CLKOUT~278~1}] -max 0.414 [get_ports {i_ddr_dq_lo[11] i_ddr_dq_hi[11]}]
set_input_delay -clock ddr_tac_clk -reference_pin [get_ports {ddr_tac_clk~CLKOUT~278~1}] -min 0.276 [get_ports {i_ddr_dq_lo[11] i_ddr_dq_hi[11]}]
set_output_delay -clock ddr_twd_clk -reference_pin [get_ports {ddr_twd_clk~CLKOUT~280~1}] -max 0.263 [get_ports {o_ddr_dq_lo[11] o_ddr_dq_hi[11]}]
set_output_delay -clock ddr_twd_clk -reference_pin [get_ports {ddr_twd_clk~CLKOUT~280~1}] -min -0.140 [get_ports {o_ddr_dq_lo[11] o_ddr_dq_hi[11]}]
set_output_delay -clock ddr_twd_clk -reference_pin [get_ports {ddr_twd_clk~CLKOUT~280~1}] -max 0.263 [get_ports {o_ddr_dq_oe[11]}]
set_output_delay -clock ddr_twd_clk -reference_pin [get_ports {ddr_twd_clk~CLKOUT~280~1}] -min -0.140 [get_ports {o_ddr_dq_oe[11]}]
set_input_delay -clock ddr_tac_clk -reference_pin [get_ports {ddr_tac_clk~CLKOUT~270~1}] -max 0.414 [get_ports {i_ddr_dq_lo[12] i_ddr_dq_hi[12]}]
set_input_delay -clock ddr_tac_clk -reference_pin [get_ports {ddr_tac_clk~CLKOUT~270~1}] -min 0.276 [get_ports {i_ddr_dq_lo[12] i_ddr_dq_hi[12]}]
set_output_delay -clock ddr_twd_clk -reference_pin [get_ports {ddr_twd_clk~CLKOUT~272~1}] -max 0.263 [get_ports {o_ddr_dq_lo[12] o_ddr_dq_hi[12]}]
set_output_delay -clock ddr_twd_clk -reference_pin [get_ports {ddr_twd_clk~CLKOUT~272~1}] -min -0.140 [get_ports {o_ddr_dq_lo[12] o_ddr_dq_hi[12]}]
set_output_delay -clock ddr_twd_clk -reference_pin [get_ports {ddr_twd_clk~CLKOUT~272~1}] -max 0.263 [get_ports {o_ddr_dq_oe[12]}]
set_output_delay -clock ddr_twd_clk -reference_pin [get_ports {ddr_twd_clk~CLKOUT~272~1}] -min -0.140 [get_ports {o_ddr_dq_oe[12]}]
set_input_delay -clock ddr_tac_clk -reference_pin [get_ports {ddr_tac_clk~CLKOUT~260~1}] -max 0.414 [get_ports {i_ddr_dq_lo[13] i_ddr_dq_hi[13]}]
set_input_delay -clock ddr_tac_clk -reference_pin [get_ports {ddr_tac_clk~CLKOUT~260~1}] -min 0.276 [get_ports {i_ddr_dq_lo[13] i_ddr_dq_hi[13]}]
set_output_delay -clock ddr_twd_clk -reference_pin [get_ports {ddr_twd_clk~CLKOUT~262~1}] -max 0.263 [get_ports {o_ddr_dq_lo[13] o_ddr_dq_hi[13]}]
set_output_delay -clock ddr_twd_clk -reference_pin [get_ports {ddr_twd_clk~CLKOUT~262~1}] -min -0.140 [get_ports {o_ddr_dq_lo[13] o_ddr_dq_hi[13]}]
set_output_delay -clock ddr_twd_clk -reference_pin [get_ports {ddr_twd_clk~CLKOUT~262~1}] -max 0.263 [get_ports {o_ddr_dq_oe[13]}]
set_output_delay -clock ddr_twd_clk -reference_pin [get_ports {ddr_twd_clk~CLKOUT~262~1}] -min -0.140 [get_ports {o_ddr_dq_oe[13]}]
set_input_delay -clock ddr_tac_clk -reference_pin [get_ports {ddr_tac_clk~CLKOUT~261~1}] -max 0.414 [get_ports {i_ddr_dq_lo[14] i_ddr_dq_hi[14]}]
set_input_delay -clock ddr_tac_clk -reference_pin [get_ports {ddr_tac_clk~CLKOUT~261~1}] -min 0.276 [get_ports {i_ddr_dq_lo[14] i_ddr_dq_hi[14]}]
set_output_delay -clock ddr_twd_clk -reference_pin [get_ports {ddr_twd_clk~CLKOUT~263~1}] -max 0.263 [get_ports {o_ddr_dq_lo[14] o_ddr_dq_hi[14]}]
set_output_delay -clock ddr_twd_clk -reference_pin [get_ports {ddr_twd_clk~CLKOUT~263~1}] -min -0.140 [get_ports {o_ddr_dq_lo[14] o_ddr_dq_hi[14]}]
set_output_delay -clock ddr_twd_clk -reference_pin [get_ports {ddr_twd_clk~CLKOUT~263~1}] -max 0.263 [get_ports {o_ddr_dq_oe[14]}]
set_output_delay -clock ddr_twd_clk -reference_pin [get_ports {ddr_twd_clk~CLKOUT~263~1}] -min -0.140 [get_ports {o_ddr_dq_oe[14]}]
set_input_delay -clock ddr_tac_clk -reference_pin [get_ports {ddr_tac_clk~CLKOUT~252~1}] -max 0.414 [get_ports {i_ddr_dq_lo[15] i_ddr_dq_hi[15]}]
set_input_delay -clock ddr_tac_clk -reference_pin [get_ports {ddr_tac_clk~CLKOUT~252~1}] -min 0.276 [get_ports {i_ddr_dq_lo[15] i_ddr_dq_hi[15]}]
set_output_delay -clock ddr_twd_clk -reference_pin [get_ports {ddr_twd_clk~CLKOUT~254~1}] -max 0.263 [get_ports {o_ddr_dq_lo[15] o_ddr_dq_hi[15]}]
set_output_delay -clock ddr_twd_clk -reference_pin [get_ports {ddr_twd_clk~CLKOUT~254~1}] -min -0.140 [get_ports {o_ddr_dq_lo[15] o_ddr_dq_hi[15]}]
set_output_delay -clock ddr_twd_clk -reference_pin [get_ports {ddr_twd_clk~CLKOUT~254~1}] -max 0.263 [get_ports {o_ddr_dq_oe[15]}]
set_output_delay -clock ddr_twd_clk -reference_pin [get_ports {ddr_twd_clk~CLKOUT~254~1}] -min -0.140 [get_ports {o_ddr_dq_oe[15]}]
set_input_delay -clock ddr_tac_clk -reference_pin [get_ports {ddr_tac_clk~CLKOUT~243~1}] -max 0.414 [get_ports {i_ddr_dqs_lo[0] i_ddr_dqs_hi[0]}]
set_input_delay -clock ddr_tac_clk -reference_pin [get_ports {ddr_tac_clk~CLKOUT~243~1}] -min 0.276 [get_ports {i_ddr_dqs_lo[0] i_ddr_dqs_hi[0]}]
set_output_delay -clock ddr_tdqss_clk -reference_pin [get_ports {ddr_tdqss_clk~CLKOUT~245~1}] -max 0.263 [get_ports {o_ddr_dqs_lo[0] o_ddr_dqs_hi[0]}]
set_output_delay -clock ddr_tdqss_clk -reference_pin [get_ports {ddr_tdqss_clk~CLKOUT~245~1}] -min -0.140 [get_ports {o_ddr_dqs_lo[0] o_ddr_dqs_hi[0]}]
set_output_delay -clock ddr_tdqss_clk -reference_pin [get_ports {ddr_tdqss_clk~CLKOUT~245~1}] -max 0.263 [get_ports {o_ddr_dqs_oe[0]}]
set_output_delay -clock ddr_tdqss_clk -reference_pin [get_ports {ddr_tdqss_clk~CLKOUT~245~1}] -min -0.140 [get_ports {o_ddr_dqs_oe[0]}]
set_output_delay -clock ddr_tdqss_clk -reference_pin [get_ports {ddr_tdqss_clk~CLKOUT~246~1}] -max 0.263 [get_ports {o_ddr_dqs_n_oe[0]}]
set_output_delay -clock ddr_tdqss_clk -reference_pin [get_ports {ddr_tdqss_clk~CLKOUT~246~1}] -min -0.140 [get_ports {o_ddr_dqs_n_oe[0]}]
set_input_delay -clock ddr_tac_clk -reference_pin [get_ports {ddr_tac_clk~CLKOUT~234~1}] -max 0.414 [get_ports {i_ddr_dqs_lo[1] i_ddr_dqs_hi[1]}]
set_input_delay -clock ddr_tac_clk -reference_pin [get_ports {ddr_tac_clk~CLKOUT~234~1}] -min 0.276 [get_ports {i_ddr_dqs_lo[1] i_ddr_dqs_hi[1]}]
set_output_delay -clock ddr_tdqss_clk -reference_pin [get_ports {ddr_tdqss_clk~CLKOUT~236~1}] -max 0.263 [get_ports {o_ddr_dqs_lo[1] o_ddr_dqs_hi[1]}]
set_output_delay -clock ddr_tdqss_clk -reference_pin [get_ports {ddr_tdqss_clk~CLKOUT~236~1}] -min -0.140 [get_ports {o_ddr_dqs_lo[1] o_ddr_dqs_hi[1]}]
set_output_delay -clock ddr_tdqss_clk -reference_pin [get_ports {ddr_tdqss_clk~CLKOUT~236~1}] -max 0.263 [get_ports {o_ddr_dqs_oe[1]}]
set_output_delay -clock ddr_tdqss_clk -reference_pin [get_ports {ddr_tdqss_clk~CLKOUT~236~1}] -min -0.140 [get_ports {o_ddr_dqs_oe[1]}]
set_output_delay -clock ddr_tdqss_clk -reference_pin [get_ports {ddr_tdqss_clk~CLKOUT~237~1}] -max 0.263 [get_ports {o_ddr_dqs_n_oe[1]}]
set_output_delay -clock ddr_tdqss_clk -reference_pin [get_ports {ddr_tdqss_clk~CLKOUT~237~1}] -min -0.140 [get_ports {o_ddr_dqs_n_oe[1]}]
