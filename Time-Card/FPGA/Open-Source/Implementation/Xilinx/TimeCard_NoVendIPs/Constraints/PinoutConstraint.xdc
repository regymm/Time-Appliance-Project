#CLOCK DCXO 1 and 2
set_property PACKAGE_PIN W21 [get_ports Mhz10ClkDcxo1_ClkIn]
set_property IOSTANDARD LVCMOS33 [get_ports Mhz10ClkDcxo1_ClkIn]
set_property PULLDOWN true [get_ports Mhz10ClkDcxo1_ClkIn]

set_property CLOCK_DEDICATED_ROUTE FALSE [get_nets Mhz10ClkDcxo1_ClkIn_IBUF]

#MAC RF Out
set_property PACKAGE_PIN V13 [get_ports Mhz10Clk0_ClkIn]
set_property IOSTANDARD LVCMOS33 [get_ports Mhz10Clk0_ClkIn]
set_property PACKAGE_PIN V14 [get_ports Mhz10Clk1_ClkIn]
set_property IOSTANDARD LVCMOS33 [get_ports Mhz10Clk1_ClkIn]

#Reset
set_property PACKAGE_PIN T6 [get_ports RstN_RstIn]
set_property IOSTANDARD LVCMOS15 [get_ports RstN_RstIn]

#200Hz
set_property IOSTANDARD DIFF_SSTL15 [get_ports Mhz200ClkP_ClkIn]
set_property PACKAGE_PIN R4 [get_ports Mhz200ClkP_ClkIn]
set_property PACKAGE_PIN T4 [get_ports Mhz200ClkN_ClkIn]
set_property IOSTANDARD DIFF_SSTL15 [get_ports Mhz200ClkN_ClkIn]

#125MHz
#set_property IOSTANDARD LVDS_25 [get_ports Mhz125ClkP_ClkIn]
set_property PACKAGE_PIN F6 [get_ports Mhz125ClkP_ClkIn]
set_property PACKAGE_PIN E6 [get_ports Mhz125ClkN_ClkIn]
#set_property IOSTANDARD LVDS_25 [get_ports Mhz125ClkN_ClkIn]

#Buttons
set_property PACKAGE_PIN J21 [get_ports {Key_DatIn[0]}]
set_property IOSTANDARD LVCMOS33 [get_ports {Key_DatIn[0]}]
set_property PACKAGE_PIN E13 [get_ports {Key_DatIn[1]}]
set_property IOSTANDARD LVCMOS33 [get_ports {Key_DatIn[1]}]

#LEDs
set_property PACKAGE_PIN B13 [get_ports {Led_DatOut[0]}]
set_property IOSTANDARD LVCMOS33 [get_ports {Led_DatOut[0]}]
set_property PACKAGE_PIN C13 [get_ports {Led_DatOut[1]}]
set_property IOSTANDARD LVCMOS33 [get_ports {Led_DatOut[1]}]
set_property PACKAGE_PIN D14 [get_ports {Led_DatOut[2]}]
set_property IOSTANDARD LVCMOS33 [get_ports {Led_DatOut[2]}]
set_property PACKAGE_PIN D15 [get_ports {Led_DatOut[3]}]
set_property IOSTANDARD LVCMOS33 [get_ports {Led_DatOut[3]}]

#IO LEDs
#set_property PACKAGE_PIN E21 [get_ports {IoLed_DatOut[0]}]
#set_property IOSTANDARD LVCMOS33 [get_ports {IoLed_DatOut[0]}]
#set_property PACKAGE_PIN D21 [get_ports {IoLed_DatOut[1]}]
#set_property IOSTANDARD LVCMOS33 [get_ports {IoLed_DatOut[1]}]
#set_property PACKAGE_PIN E22 [get_ports {IoLed_DatOut[2]}]
#set_property IOSTANDARD LVCMOS33 [get_ports {IoLed_DatOut[2]}]
#set_property PACKAGE_PIN D22 [get_ports {IoLed_DatOut[3]}]
#set_property IOSTANDARD LVCMOS33 [get_ports {IoLed_DatOut[3]}]

#PMOD
#set_property PACKAGE_PIN M22 [get_ports {Pmod_DatOut[0]}]
#set_property IOSTANDARD LVCMOS33 [get_ports {Pmod_DatOut[0]}]
#set_property PACKAGE_PIN N22 [get_ports {Pmod_DatOut[1]}]
#set_property IOSTANDARD LVCMOS33 [get_ports {Pmod_DatOut[1]}]
#set_property PACKAGE_PIN H18 [get_ports {Pmod_DatOut[2]}]
#set_property IOSTANDARD LVCMOS33 [get_ports {Pmod_DatOut[2]}]
#set_property PACKAGE_PIN H17 [get_ports {Pmod_DatOut[3]}]
#set_property IOSTANDARD LVCMOS33 [get_ports {Pmod_DatOut[3]}]
#set_property PACKAGE_PIN H22 [get_ports {Pmod_DatOut[4]}]
#set_property IOSTANDARD LVCMOS33 [get_ports {Pmod_DatOut[4]}]
#set_property PACKAGE_PIN J22 [get_ports {Pmod_DatOut[5]}]
#set_property IOSTANDARD LVCMOS33 [get_ports {Pmod_DatOut[5]}]
#set_property PACKAGE_PIN K21 [get_ports {Pmod_DatOut[6]}]
#set_property IOSTANDARD LVCMOS33 [get_ports {Pmod_DatOut[6]}]
#set_property PACKAGE_PIN K22 [get_ports {Pmod_DatOut[7]}]
#set_property IOSTANDARD LVCMOS33 [get_ports {Pmod_DatOut[7]}]

#EEPROM
set_property PACKAGE_PIN V9 [get_ports EepromWp_DatOut]
set_property IOSTANDARD LVCMOS15 [get_ports EepromWp_DatOut]

#QSPI Flash
set_property PACKAGE_PIN P22 [get_ports SpiFlashDq0_DatInOut]
set_property IOSTANDARD LVCMOS33 [get_ports SpiFlashDq0_DatInOut]
set_property PACKAGE_PIN R22 [get_ports SpiFlashDq1_DatInOut]
set_property IOSTANDARD LVCMOS33 [get_ports SpiFlashDq1_DatInOut]
set_property PACKAGE_PIN P21 [get_ports SpiFlashDq2_DatInOut]
set_property IOSTANDARD LVCMOS33 [get_ports SpiFlashDq2_DatInOut]
set_property PACKAGE_PIN R21 [get_ports SpiFlashDq3_DatInOut]
set_property IOSTANDARD LVCMOS33 [get_ports SpiFlashDq3_DatInOut]
set_property PACKAGE_PIN T19 [get_ports SpiFlashCsN_EnaOut]
set_property IOSTANDARD LVCMOS33 [get_ports SpiFlashCsN_EnaOut]

#I2C
set_property PACKAGE_PIN N17 [get_ports I2cScl_ClkInOut]
set_property IOSTANDARD LVCMOS33 [get_ports I2cScl_ClkInOut]
set_property PULLUP true [get_ports I2cScl_ClkInOut]
set_property PACKAGE_PIN T16 [get_ports I2cSda_DatInOut]
set_property IOSTANDARD LVCMOS33 [get_ports I2cSda_DatInOut]
set_property PULLUP true [get_ports I2cSda_DatInOut]

#SMA Inputs/Outputs
# INPUTS
# ANT1 Y11
# ANT2 Y12
# ANT3 AA21
# ANT4 AA20
# ANT1_IN_EN H15
# ANT2_IN_EN J14
# ANT3_IN_EN K14
# ANT4_IN_EN L13
# OUTPUTS
# ANT1 W11
# ANT2 W12
# ANT3 V10
# ANT4 W10
# ANT1_OUT_EN J15
# ANT2_OUT_EN H14
# ANT3_OUT_EN K13
# ANT4_OUT_EN M13

set_property PACKAGE_PIN Y11 [get_ports SmaIn1_DatIn]
set_property IOSTANDARD LVCMOS33 [get_ports SmaIn1_DatIn]
set_property PULLDOWN true [get_ports SmaIn1_DatIn]
set_property PACKAGE_PIN Y12 [get_ports SmaIn2_DatIn]
set_property IOSTANDARD LVCMOS33 [get_ports SmaIn2_DatIn]
set_property PULLDOWN true [get_ports SmaIn2_DatIn]
set_property PACKAGE_PIN AA21 [get_ports SmaIn3_DatIn]
set_property IOSTANDARD LVCMOS33 [get_ports SmaIn3_DatIn]
set_property PULLDOWN true [get_ports SmaIn3_DatIn]
set_property PACKAGE_PIN AA20 [get_ports SmaIn4_DatIn]
set_property IOSTANDARD LVCMOS33 [get_ports SmaIn4_DatIn]
set_property PULLDOWN true [get_ports SmaIn4_DatIn]

set_property PACKAGE_PIN H15 [get_ports Sma1InBufEnableN_EnOut]
set_property IOSTANDARD LVCMOS33 [get_ports Sma1InBufEnableN_EnOut]
set_property PACKAGE_PIN J14 [get_ports Sma2InBufEnableN_EnOut]
set_property IOSTANDARD LVCMOS33 [get_ports Sma2InBufEnableN_EnOut]
set_property PACKAGE_PIN K14 [get_ports Sma3InBufEnableN_EnOut]
set_property IOSTANDARD LVCMOS33 [get_ports Sma3InBufEnableN_EnOut]
set_property PACKAGE_PIN L13 [get_ports Sma4InBufEnableN_EnOut]
set_property IOSTANDARD LVCMOS33 [get_ports Sma4InBufEnableN_EnOut]

set_property PACKAGE_PIN W11 [get_ports SmaOut1_DatOut]
set_property IOSTANDARD LVCMOS33 [get_ports SmaOut1_DatOut]
set_property DRIVE 16 [get_ports SmaOut1_DatOut]
set_property SLEW FAST [get_ports SmaOut1_DatOut]
set_property PACKAGE_PIN W12 [get_ports SmaOut2_DatOut]
set_property IOSTANDARD LVCMOS33 [get_ports SmaOut2_DatOut]
set_property DRIVE 16 [get_ports SmaOut2_DatOut]
set_property SLEW FAST [get_ports SmaOut2_DatOut]
set_property PACKAGE_PIN V10 [get_ports SmaOut3_DatOut]
set_property IOSTANDARD LVCMOS33 [get_ports SmaOut3_DatOut]
set_property DRIVE 16 [get_ports SmaOut3_DatOut]
set_property SLEW FAST [get_ports SmaOut3_DatOut]
set_property PACKAGE_PIN W10 [get_ports SmaOut4_DatOut]
set_property IOSTANDARD LVCMOS33 [get_ports SmaOut4_DatOut]
set_property DRIVE 16 [get_ports SmaOut4_DatOut]
set_property SLEW FAST [get_ports SmaOut4_DatOut]

set_property PACKAGE_PIN J15 [get_ports Sma1OutBufEnableN_EnOut]
set_property IOSTANDARD LVCMOS33 [get_ports Sma1OutBufEnableN_EnOut]
set_property PACKAGE_PIN H14 [get_ports Sma2OutBufEnableN_EnOut]
set_property IOSTANDARD LVCMOS33 [get_ports Sma2OutBufEnableN_EnOut]
set_property PACKAGE_PIN K13 [get_ports Sma3OutBufEnableN_EnOut]
set_property IOSTANDARD LVCMOS33 [get_ports Sma3OutBufEnableN_EnOut]
set_property PACKAGE_PIN M13 [get_ports Sma4OutBufEnableN_EnOut]
set_property IOSTANDARD LVCMOS33 [get_ports Sma4OutBufEnableN_EnOut]

#UART1
set_property PACKAGE_PIN P15 [get_ports Uart1TxDat_DatOut]
set_property IOSTANDARD LVCMOS33 [get_ports Uart1TxDat_DatOut]
set_property PACKAGE_PIN P16 [get_ports Uart1RxDat_DatIn]
set_property IOSTANDARD LVCMOS33 [get_ports Uart1RxDat_DatIn]

#GNSS1
set_property PACKAGE_PIN P20 [get_ports UartGnss1TxDat_DatOut]
set_property IOSTANDARD LVCMOS33 [get_ports UartGnss1TxDat_DatOut]
set_property PACKAGE_PIN N15 [get_ports UartGnss1RxDat_DatIn]
set_property IOSTANDARD LVCMOS33 [get_ports UartGnss1RxDat_DatIn]
set_property PACKAGE_PIN W14 [get_ports {Gnss1Tp_DatIn[0]}]
set_property IOSTANDARD LVCMOS33 [get_ports {Gnss1Tp_DatIn[0]}]
set_property PACKAGE_PIN Y14 [get_ports {Gnss1Tp_DatIn[1]}]
set_property IOSTANDARD LVCMOS33 [get_ports {Gnss1Tp_DatIn[1]}]
set_property PACKAGE_PIN Y16 [get_ports Gnss1RstN_RstOut]
set_property IOSTANDARD LVCMOS33 [get_ports Gnss1RstN_RstOut]

#GNSS2
set_property PACKAGE_PIN M17 [get_ports UartGnss2TxDat_DatOut]
set_property IOSTANDARD LVCMOS33 [get_ports UartGnss2TxDat_DatOut]
set_property PACKAGE_PIN J16 [get_ports UartGnss2RxDat_DatIn]
set_property IOSTANDARD LVCMOS33 [get_ports UartGnss2RxDat_DatIn]
set_property PACKAGE_PIN G17 [get_ports {Gnss2Tp_DatIn[0]}]
set_property IOSTANDARD LVCMOS33 [get_ports {Gnss2Tp_DatIn[0]}]
set_property PACKAGE_PIN G18 [get_ports {Gnss2Tp_DatIn[1]}]
set_property IOSTANDARD LVCMOS33 [get_ports {Gnss2Tp_DatIn[1]}]
set_property PACKAGE_PIN G15 [get_ports Gnss2RstN_RstOut]
set_property IOSTANDARD LVCMOS33 [get_ports Gnss2RstN_RstOut]

#MAC
set_property PACKAGE_PIN AA18 [get_ports MacTxDat_DatInOut]
set_property IOSTANDARD LVCMOS33 [get_ports MacTxDat_DatInOut]
set_property PACKAGE_PIN AB18 [get_ports MacRxDat_DatInOut]
set_property IOSTANDARD LVCMOS33 [get_ports MacRxDat_DatInOut]

set_property PACKAGE_PIN AA10 [get_ports MacFreqControl_DatOut]
set_property IOSTANDARD LVCMOS33 [get_ports MacFreqControl_DatOut]
set_property PACKAGE_PIN AB10 [get_ports MacAlarm_DatIn]
set_property IOSTANDARD LVCMOS33 [get_ports MacAlarm_DatIn]
set_property PACKAGE_PIN AA9 [get_ports MacBite_DatIn]
set_property IOSTANDARD LVCMOS33 [get_ports MacBite_DatIn]

set_property PACKAGE_PIN V15 [get_ports MacUsbPower_EnOut]
set_property IOSTANDARD LVCMOS33 [get_ports MacUsbPower_EnOut]
set_property PACKAGE_PIN R14 [get_ports MacUsbP_DatOut]
set_property IOSTANDARD LVCMOS33 [get_ports MacUsbP_DatOut]
set_property PACKAGE_PIN P14 [get_ports MacUsbN_DatOut]
set_property IOSTANDARD LVCMOS33 [get_ports MacUsbN_DatOut]

set_property PACKAGE_PIN U20 [get_ports MacPps_EvtIn]
set_property IOSTANDARD LVCMOS33 [get_ports MacPps_EvtIn]
set_property PACKAGE_PIN V18 [get_ports MacPps0_EvtOut]
set_property IOSTANDARD LVCMOS33 [get_ports MacPps0_EvtOut]
set_property PACKAGE_PIN P19 [get_ports MacPps1_EvtOut]
set_property IOSTANDARD LVCMOS33 [get_ports MacPps1_EvtOut]

#PCIe
set_property PACKAGE_PIN J20 [get_ports PciePerst_RstIn]
set_property IOSTANDARD LVCMOS33 [get_ports PciePerst_RstIn]
set_property PULLUP true [get_ports PciePerst_RstIn]

set_property PACKAGE_PIN F10 [get_ports PcieRefClkP_ClkIn]
#set_property LOC GTPE2_CHANNEL_X0Y5 [get_cells {Bd_Inst/TimeCard_i/axi_pcie_0/inst/comp_axi_enhanced_pcie/comp_enhanced_core_top_wrap/axi_pcie_enhanced_core_top_i/pcie_7x_v2_0_2_inst/pcie_top_with_gt_top.gt_ges.gt_top_i/pipe_wrapper_i/pipe_lane[0].gt_wrapper_i/gtp_channel.gtpe2_channel_i}]
set_property PACKAGE_PIN D11 [get_ports {pcie_7x_mgt_0_rxp[0]}]
set_property PACKAGE_PIN D5 [get_ports {pcie_7x_mgt_0_txp[0]}]


create_debug_core u_ila_0 ila
set_property ALL_PROBE_SAME_MU true [get_debug_cores u_ila_0]
set_property ALL_PROBE_SAME_MU_CNT 4 [get_debug_cores u_ila_0]
set_property C_ADV_TRIGGER true [get_debug_cores u_ila_0]
set_property C_DATA_DEPTH 1024 [get_debug_cores u_ila_0]
set_property C_EN_STRG_QUAL true [get_debug_cores u_ila_0]
set_property C_INPUT_PIPE_STAGES 0 [get_debug_cores u_ila_0]
set_property C_TRIGIN_EN false [get_debug_cores u_ila_0]
set_property C_TRIGOUT_EN false [get_debug_cores u_ila_0]
set_property port_width 1 [get_debug_ports u_ila_0/clk]
connect_debug_port u_ila_0/clk [get_nets [list TimeCard_NoBd_Inst/TimeCard_i/clk_wiz_0/inst/clk_out1]]
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe0]
set_property port_width 2 [get_debug_ports u_ila_0/probe0]
connect_debug_port u_ila_0/probe0 [get_nets [list {TimeCard_NoBd_Inst/TimeCard_i/axi_uart16550_gnss1/inst/axil2mm_inst/s_axi_rresp[0]} {TimeCard_NoBd_Inst/TimeCard_i/axi_uart16550_gnss1/inst/axil2mm_inst/s_axi_rresp[1]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe1]
set_property port_width 32 [get_debug_ports u_ila_0/probe1]
connect_debug_port u_ila_0/probe1 [get_nets [list {TimeCard_NoBd_Inst/TimeCard_i/axi_uart16550_gnss1/inst/axil2mm_inst/s_axi_araddr[0]} {TimeCard_NoBd_Inst/TimeCard_i/axi_uart16550_gnss1/inst/axil2mm_inst/s_axi_araddr[1]} {TimeCard_NoBd_Inst/TimeCard_i/axi_uart16550_gnss1/inst/axil2mm_inst/s_axi_araddr[2]} {TimeCard_NoBd_Inst/TimeCard_i/axi_uart16550_gnss1/inst/axil2mm_inst/s_axi_araddr[3]} {TimeCard_NoBd_Inst/TimeCard_i/axi_uart16550_gnss1/inst/axil2mm_inst/s_axi_araddr[4]} {TimeCard_NoBd_Inst/TimeCard_i/axi_uart16550_gnss1/inst/axil2mm_inst/s_axi_araddr[5]} {TimeCard_NoBd_Inst/TimeCard_i/axi_uart16550_gnss1/inst/axil2mm_inst/s_axi_araddr[6]} {TimeCard_NoBd_Inst/TimeCard_i/axi_uart16550_gnss1/inst/axil2mm_inst/s_axi_araddr[7]} {TimeCard_NoBd_Inst/TimeCard_i/axi_uart16550_gnss1/inst/axil2mm_inst/s_axi_araddr[8]} {TimeCard_NoBd_Inst/TimeCard_i/axi_uart16550_gnss1/inst/axil2mm_inst/s_axi_araddr[9]} {TimeCard_NoBd_Inst/TimeCard_i/axi_uart16550_gnss1/inst/axil2mm_inst/s_axi_araddr[10]} {TimeCard_NoBd_Inst/TimeCard_i/axi_uart16550_gnss1/inst/axil2mm_inst/s_axi_araddr[11]} {TimeCard_NoBd_Inst/TimeCard_i/axi_uart16550_gnss1/inst/axil2mm_inst/s_axi_araddr[12]} {TimeCard_NoBd_Inst/TimeCard_i/axi_uart16550_gnss1/inst/axil2mm_inst/s_axi_araddr[13]} {TimeCard_NoBd_Inst/TimeCard_i/axi_uart16550_gnss1/inst/axil2mm_inst/s_axi_araddr[14]} {TimeCard_NoBd_Inst/TimeCard_i/axi_uart16550_gnss1/inst/axil2mm_inst/s_axi_araddr[15]} {TimeCard_NoBd_Inst/TimeCard_i/axi_uart16550_gnss1/inst/axil2mm_inst/s_axi_araddr[16]} {TimeCard_NoBd_Inst/TimeCard_i/axi_uart16550_gnss1/inst/axil2mm_inst/s_axi_araddr[17]} {TimeCard_NoBd_Inst/TimeCard_i/axi_uart16550_gnss1/inst/axil2mm_inst/s_axi_araddr[18]} {TimeCard_NoBd_Inst/TimeCard_i/axi_uart16550_gnss1/inst/axil2mm_inst/s_axi_araddr[19]} {TimeCard_NoBd_Inst/TimeCard_i/axi_uart16550_gnss1/inst/axil2mm_inst/s_axi_araddr[20]} {TimeCard_NoBd_Inst/TimeCard_i/axi_uart16550_gnss1/inst/axil2mm_inst/s_axi_araddr[21]} {TimeCard_NoBd_Inst/TimeCard_i/axi_uart16550_gnss1/inst/axil2mm_inst/s_axi_araddr[22]} {TimeCard_NoBd_Inst/TimeCard_i/axi_uart16550_gnss1/inst/axil2mm_inst/s_axi_araddr[23]} {TimeCard_NoBd_Inst/TimeCard_i/axi_uart16550_gnss1/inst/axil2mm_inst/s_axi_araddr[24]} {TimeCard_NoBd_Inst/TimeCard_i/axi_uart16550_gnss1/inst/axil2mm_inst/s_axi_araddr[25]} {TimeCard_NoBd_Inst/TimeCard_i/axi_uart16550_gnss1/inst/axil2mm_inst/s_axi_araddr[26]} {TimeCard_NoBd_Inst/TimeCard_i/axi_uart16550_gnss1/inst/axil2mm_inst/s_axi_araddr[27]} {TimeCard_NoBd_Inst/TimeCard_i/axi_uart16550_gnss1/inst/axil2mm_inst/s_axi_araddr[28]} {TimeCard_NoBd_Inst/TimeCard_i/axi_uart16550_gnss1/inst/axil2mm_inst/s_axi_araddr[29]} {TimeCard_NoBd_Inst/TimeCard_i/axi_uart16550_gnss1/inst/axil2mm_inst/s_axi_araddr[30]} {TimeCard_NoBd_Inst/TimeCard_i/axi_uart16550_gnss1/inst/axil2mm_inst/s_axi_araddr[31]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe2]
set_property port_width 8 [get_debug_ports u_ila_0/probe2]
connect_debug_port u_ila_0/probe2 [get_nets [list {TimeCard_NoBd_Inst/TimeCard_i/axi_uart16550_gnss1/inst/uart16550_inst/dll[0]} {TimeCard_NoBd_Inst/TimeCard_i/axi_uart16550_gnss1/inst/uart16550_inst/dll[1]} {TimeCard_NoBd_Inst/TimeCard_i/axi_uart16550_gnss1/inst/uart16550_inst/dll[2]} {TimeCard_NoBd_Inst/TimeCard_i/axi_uart16550_gnss1/inst/uart16550_inst/dll[3]} {TimeCard_NoBd_Inst/TimeCard_i/axi_uart16550_gnss1/inst/uart16550_inst/dll[4]} {TimeCard_NoBd_Inst/TimeCard_i/axi_uart16550_gnss1/inst/uart16550_inst/dll[5]} {TimeCard_NoBd_Inst/TimeCard_i/axi_uart16550_gnss1/inst/uart16550_inst/dll[6]} {TimeCard_NoBd_Inst/TimeCard_i/axi_uart16550_gnss1/inst/uart16550_inst/dll[7]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe3]
set_property port_width 8 [get_debug_ports u_ila_0/probe3]
connect_debug_port u_ila_0/probe3 [get_nets [list {TimeCard_NoBd_Inst/TimeCard_i/axi_uart16550_gnss1/inst/uart16550_inst/dlm[0]} {TimeCard_NoBd_Inst/TimeCard_i/axi_uart16550_gnss1/inst/uart16550_inst/dlm[1]} {TimeCard_NoBd_Inst/TimeCard_i/axi_uart16550_gnss1/inst/uart16550_inst/dlm[2]} {TimeCard_NoBd_Inst/TimeCard_i/axi_uart16550_gnss1/inst/uart16550_inst/dlm[3]} {TimeCard_NoBd_Inst/TimeCard_i/axi_uart16550_gnss1/inst/uart16550_inst/dlm[4]} {TimeCard_NoBd_Inst/TimeCard_i/axi_uart16550_gnss1/inst/uart16550_inst/dlm[5]} {TimeCard_NoBd_Inst/TimeCard_i/axi_uart16550_gnss1/inst/uart16550_inst/dlm[6]} {TimeCard_NoBd_Inst/TimeCard_i/axi_uart16550_gnss1/inst/uart16550_inst/dlm[7]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe4]
set_property port_width 8 [get_debug_ports u_ila_0/probe4]
connect_debug_port u_ila_0/probe4 [get_nets [list {TimeCard_NoBd_Inst/TimeCard_i/axi_uart16550_gnss1/inst/uart16550_inst/fcr[0]} {TimeCard_NoBd_Inst/TimeCard_i/axi_uart16550_gnss1/inst/uart16550_inst/fcr[1]} {TimeCard_NoBd_Inst/TimeCard_i/axi_uart16550_gnss1/inst/uart16550_inst/fcr[2]} {TimeCard_NoBd_Inst/TimeCard_i/axi_uart16550_gnss1/inst/uart16550_inst/fcr[3]} {TimeCard_NoBd_Inst/TimeCard_i/axi_uart16550_gnss1/inst/uart16550_inst/fcr[4]} {TimeCard_NoBd_Inst/TimeCard_i/axi_uart16550_gnss1/inst/uart16550_inst/fcr[5]} {TimeCard_NoBd_Inst/TimeCard_i/axi_uart16550_gnss1/inst/uart16550_inst/fcr[6]} {TimeCard_NoBd_Inst/TimeCard_i/axi_uart16550_gnss1/inst/uart16550_inst/fcr[7]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe5]
set_property port_width 8 [get_debug_ports u_ila_0/probe5]
connect_debug_port u_ila_0/probe5 [get_nets [list {TimeCard_NoBd_Inst/TimeCard_i/axi_uart16550_gnss1/inst/uart16550_inst/lcr[0]} {TimeCard_NoBd_Inst/TimeCard_i/axi_uart16550_gnss1/inst/uart16550_inst/lcr[1]} {TimeCard_NoBd_Inst/TimeCard_i/axi_uart16550_gnss1/inst/uart16550_inst/lcr[2]} {TimeCard_NoBd_Inst/TimeCard_i/axi_uart16550_gnss1/inst/uart16550_inst/lcr[3]} {TimeCard_NoBd_Inst/TimeCard_i/axi_uart16550_gnss1/inst/uart16550_inst/lcr[4]} {TimeCard_NoBd_Inst/TimeCard_i/axi_uart16550_gnss1/inst/uart16550_inst/lcr[5]} {TimeCard_NoBd_Inst/TimeCard_i/axi_uart16550_gnss1/inst/uart16550_inst/lcr[6]} {TimeCard_NoBd_Inst/TimeCard_i/axi_uart16550_gnss1/inst/uart16550_inst/lcr[7]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe6]
set_property port_width 8 [get_debug_ports u_ila_0/probe6]
connect_debug_port u_ila_0/probe6 [get_nets [list {TimeCard_NoBd_Inst/TimeCard_i/axi_uart16550_gnss1/inst/uart16550_inst/iir[0]} {TimeCard_NoBd_Inst/TimeCard_i/axi_uart16550_gnss1/inst/uart16550_inst/iir[1]} {TimeCard_NoBd_Inst/TimeCard_i/axi_uart16550_gnss1/inst/uart16550_inst/iir[2]} {TimeCard_NoBd_Inst/TimeCard_i/axi_uart16550_gnss1/inst/uart16550_inst/iir[3]} {TimeCard_NoBd_Inst/TimeCard_i/axi_uart16550_gnss1/inst/uart16550_inst/iir[4]} {TimeCard_NoBd_Inst/TimeCard_i/axi_uart16550_gnss1/inst/uart16550_inst/iir[5]} {TimeCard_NoBd_Inst/TimeCard_i/axi_uart16550_gnss1/inst/uart16550_inst/iir[6]} {TimeCard_NoBd_Inst/TimeCard_i/axi_uart16550_gnss1/inst/uart16550_inst/iir[7]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe7]
set_property port_width 32 [get_debug_ports u_ila_0/probe7]
connect_debug_port u_ila_0/probe7 [get_nets [list {TimeCard_NoBd_Inst/TimeCard_i/axi_uart16550_gnss1/inst/axil2mm_inst/s_axi_awaddr[0]} {TimeCard_NoBd_Inst/TimeCard_i/axi_uart16550_gnss1/inst/axil2mm_inst/s_axi_awaddr[1]} {TimeCard_NoBd_Inst/TimeCard_i/axi_uart16550_gnss1/inst/axil2mm_inst/s_axi_awaddr[2]} {TimeCard_NoBd_Inst/TimeCard_i/axi_uart16550_gnss1/inst/axil2mm_inst/s_axi_awaddr[3]} {TimeCard_NoBd_Inst/TimeCard_i/axi_uart16550_gnss1/inst/axil2mm_inst/s_axi_awaddr[4]} {TimeCard_NoBd_Inst/TimeCard_i/axi_uart16550_gnss1/inst/axil2mm_inst/s_axi_awaddr[5]} {TimeCard_NoBd_Inst/TimeCard_i/axi_uart16550_gnss1/inst/axil2mm_inst/s_axi_awaddr[6]} {TimeCard_NoBd_Inst/TimeCard_i/axi_uart16550_gnss1/inst/axil2mm_inst/s_axi_awaddr[7]} {TimeCard_NoBd_Inst/TimeCard_i/axi_uart16550_gnss1/inst/axil2mm_inst/s_axi_awaddr[8]} {TimeCard_NoBd_Inst/TimeCard_i/axi_uart16550_gnss1/inst/axil2mm_inst/s_axi_awaddr[9]} {TimeCard_NoBd_Inst/TimeCard_i/axi_uart16550_gnss1/inst/axil2mm_inst/s_axi_awaddr[10]} {TimeCard_NoBd_Inst/TimeCard_i/axi_uart16550_gnss1/inst/axil2mm_inst/s_axi_awaddr[11]} {TimeCard_NoBd_Inst/TimeCard_i/axi_uart16550_gnss1/inst/axil2mm_inst/s_axi_awaddr[12]} {TimeCard_NoBd_Inst/TimeCard_i/axi_uart16550_gnss1/inst/axil2mm_inst/s_axi_awaddr[13]} {TimeCard_NoBd_Inst/TimeCard_i/axi_uart16550_gnss1/inst/axil2mm_inst/s_axi_awaddr[14]} {TimeCard_NoBd_Inst/TimeCard_i/axi_uart16550_gnss1/inst/axil2mm_inst/s_axi_awaddr[15]} {TimeCard_NoBd_Inst/TimeCard_i/axi_uart16550_gnss1/inst/axil2mm_inst/s_axi_awaddr[16]} {TimeCard_NoBd_Inst/TimeCard_i/axi_uart16550_gnss1/inst/axil2mm_inst/s_axi_awaddr[17]} {TimeCard_NoBd_Inst/TimeCard_i/axi_uart16550_gnss1/inst/axil2mm_inst/s_axi_awaddr[18]} {TimeCard_NoBd_Inst/TimeCard_i/axi_uart16550_gnss1/inst/axil2mm_inst/s_axi_awaddr[19]} {TimeCard_NoBd_Inst/TimeCard_i/axi_uart16550_gnss1/inst/axil2mm_inst/s_axi_awaddr[20]} {TimeCard_NoBd_Inst/TimeCard_i/axi_uart16550_gnss1/inst/axil2mm_inst/s_axi_awaddr[21]} {TimeCard_NoBd_Inst/TimeCard_i/axi_uart16550_gnss1/inst/axil2mm_inst/s_axi_awaddr[22]} {TimeCard_NoBd_Inst/TimeCard_i/axi_uart16550_gnss1/inst/axil2mm_inst/s_axi_awaddr[23]} {TimeCard_NoBd_Inst/TimeCard_i/axi_uart16550_gnss1/inst/axil2mm_inst/s_axi_awaddr[24]} {TimeCard_NoBd_Inst/TimeCard_i/axi_uart16550_gnss1/inst/axil2mm_inst/s_axi_awaddr[25]} {TimeCard_NoBd_Inst/TimeCard_i/axi_uart16550_gnss1/inst/axil2mm_inst/s_axi_awaddr[26]} {TimeCard_NoBd_Inst/TimeCard_i/axi_uart16550_gnss1/inst/axil2mm_inst/s_axi_awaddr[27]} {TimeCard_NoBd_Inst/TimeCard_i/axi_uart16550_gnss1/inst/axil2mm_inst/s_axi_awaddr[28]} {TimeCard_NoBd_Inst/TimeCard_i/axi_uart16550_gnss1/inst/axil2mm_inst/s_axi_awaddr[29]} {TimeCard_NoBd_Inst/TimeCard_i/axi_uart16550_gnss1/inst/axil2mm_inst/s_axi_awaddr[30]} {TimeCard_NoBd_Inst/TimeCard_i/axi_uart16550_gnss1/inst/axil2mm_inst/s_axi_awaddr[31]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe8]
set_property port_width 8 [get_debug_ports u_ila_0/probe8]
connect_debug_port u_ila_0/probe8 [get_nets [list {TimeCard_NoBd_Inst/TimeCard_i/axi_uart16550_gnss1/inst/uart16550_inst/lsr[0]} {TimeCard_NoBd_Inst/TimeCard_i/axi_uart16550_gnss1/inst/uart16550_inst/lsr[1]} {TimeCard_NoBd_Inst/TimeCard_i/axi_uart16550_gnss1/inst/uart16550_inst/lsr[2]} {TimeCard_NoBd_Inst/TimeCard_i/axi_uart16550_gnss1/inst/uart16550_inst/lsr[3]} {TimeCard_NoBd_Inst/TimeCard_i/axi_uart16550_gnss1/inst/uart16550_inst/lsr[4]} {TimeCard_NoBd_Inst/TimeCard_i/axi_uart16550_gnss1/inst/uart16550_inst/lsr[5]} {TimeCard_NoBd_Inst/TimeCard_i/axi_uart16550_gnss1/inst/uart16550_inst/lsr[6]} {TimeCard_NoBd_Inst/TimeCard_i/axi_uart16550_gnss1/inst/uart16550_inst/lsr[7]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe9]
set_property port_width 32 [get_debug_ports u_ila_0/probe9]
connect_debug_port u_ila_0/probe9 [get_nets [list {TimeCard_NoBd_Inst/TimeCard_i/axi_uart16550_gnss1/inst/axil2mm_inst/s_axi_rdata[0]} {TimeCard_NoBd_Inst/TimeCard_i/axi_uart16550_gnss1/inst/axil2mm_inst/s_axi_rdata[1]} {TimeCard_NoBd_Inst/TimeCard_i/axi_uart16550_gnss1/inst/axil2mm_inst/s_axi_rdata[2]} {TimeCard_NoBd_Inst/TimeCard_i/axi_uart16550_gnss1/inst/axil2mm_inst/s_axi_rdata[3]} {TimeCard_NoBd_Inst/TimeCard_i/axi_uart16550_gnss1/inst/axil2mm_inst/s_axi_rdata[4]} {TimeCard_NoBd_Inst/TimeCard_i/axi_uart16550_gnss1/inst/axil2mm_inst/s_axi_rdata[5]} {TimeCard_NoBd_Inst/TimeCard_i/axi_uart16550_gnss1/inst/axil2mm_inst/s_axi_rdata[6]} {TimeCard_NoBd_Inst/TimeCard_i/axi_uart16550_gnss1/inst/axil2mm_inst/s_axi_rdata[7]} {TimeCard_NoBd_Inst/TimeCard_i/axi_uart16550_gnss1/inst/axil2mm_inst/s_axi_rdata[8]} {TimeCard_NoBd_Inst/TimeCard_i/axi_uart16550_gnss1/inst/axil2mm_inst/s_axi_rdata[9]} {TimeCard_NoBd_Inst/TimeCard_i/axi_uart16550_gnss1/inst/axil2mm_inst/s_axi_rdata[10]} {TimeCard_NoBd_Inst/TimeCard_i/axi_uart16550_gnss1/inst/axil2mm_inst/s_axi_rdata[11]} {TimeCard_NoBd_Inst/TimeCard_i/axi_uart16550_gnss1/inst/axil2mm_inst/s_axi_rdata[12]} {TimeCard_NoBd_Inst/TimeCard_i/axi_uart16550_gnss1/inst/axil2mm_inst/s_axi_rdata[13]} {TimeCard_NoBd_Inst/TimeCard_i/axi_uart16550_gnss1/inst/axil2mm_inst/s_axi_rdata[14]} {TimeCard_NoBd_Inst/TimeCard_i/axi_uart16550_gnss1/inst/axil2mm_inst/s_axi_rdata[15]} {TimeCard_NoBd_Inst/TimeCard_i/axi_uart16550_gnss1/inst/axil2mm_inst/s_axi_rdata[16]} {TimeCard_NoBd_Inst/TimeCard_i/axi_uart16550_gnss1/inst/axil2mm_inst/s_axi_rdata[17]} {TimeCard_NoBd_Inst/TimeCard_i/axi_uart16550_gnss1/inst/axil2mm_inst/s_axi_rdata[18]} {TimeCard_NoBd_Inst/TimeCard_i/axi_uart16550_gnss1/inst/axil2mm_inst/s_axi_rdata[19]} {TimeCard_NoBd_Inst/TimeCard_i/axi_uart16550_gnss1/inst/axil2mm_inst/s_axi_rdata[20]} {TimeCard_NoBd_Inst/TimeCard_i/axi_uart16550_gnss1/inst/axil2mm_inst/s_axi_rdata[21]} {TimeCard_NoBd_Inst/TimeCard_i/axi_uart16550_gnss1/inst/axil2mm_inst/s_axi_rdata[22]} {TimeCard_NoBd_Inst/TimeCard_i/axi_uart16550_gnss1/inst/axil2mm_inst/s_axi_rdata[23]} {TimeCard_NoBd_Inst/TimeCard_i/axi_uart16550_gnss1/inst/axil2mm_inst/s_axi_rdata[24]} {TimeCard_NoBd_Inst/TimeCard_i/axi_uart16550_gnss1/inst/axil2mm_inst/s_axi_rdata[25]} {TimeCard_NoBd_Inst/TimeCard_i/axi_uart16550_gnss1/inst/axil2mm_inst/s_axi_rdata[26]} {TimeCard_NoBd_Inst/TimeCard_i/axi_uart16550_gnss1/inst/axil2mm_inst/s_axi_rdata[27]} {TimeCard_NoBd_Inst/TimeCard_i/axi_uart16550_gnss1/inst/axil2mm_inst/s_axi_rdata[28]} {TimeCard_NoBd_Inst/TimeCard_i/axi_uart16550_gnss1/inst/axil2mm_inst/s_axi_rdata[29]} {TimeCard_NoBd_Inst/TimeCard_i/axi_uart16550_gnss1/inst/axil2mm_inst/s_axi_rdata[30]} {TimeCard_NoBd_Inst/TimeCard_i/axi_uart16550_gnss1/inst/axil2mm_inst/s_axi_rdata[31]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe10]
set_property port_width 8 [get_debug_ports u_ila_0/probe10]
connect_debug_port u_ila_0/probe10 [get_nets [list {TimeCard_NoBd_Inst/TimeCard_i/axi_uart16550_gnss1/inst/uart16550_inst/rbr[0]} {TimeCard_NoBd_Inst/TimeCard_i/axi_uart16550_gnss1/inst/uart16550_inst/rbr[1]} {TimeCard_NoBd_Inst/TimeCard_i/axi_uart16550_gnss1/inst/uart16550_inst/rbr[2]} {TimeCard_NoBd_Inst/TimeCard_i/axi_uart16550_gnss1/inst/uart16550_inst/rbr[3]} {TimeCard_NoBd_Inst/TimeCard_i/axi_uart16550_gnss1/inst/uart16550_inst/rbr[4]} {TimeCard_NoBd_Inst/TimeCard_i/axi_uart16550_gnss1/inst/uart16550_inst/rbr[5]} {TimeCard_NoBd_Inst/TimeCard_i/axi_uart16550_gnss1/inst/uart16550_inst/rbr[6]} {TimeCard_NoBd_Inst/TimeCard_i/axi_uart16550_gnss1/inst/uart16550_inst/rbr[7]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe11]
set_property port_width 32 [get_debug_ports u_ila_0/probe11]
connect_debug_port u_ila_0/probe11 [get_nets [list {TimeCard_NoBd_Inst/TimeCard_i/axi_uart16550_gnss1/inst/uart16550_inst/spo[0]} {TimeCard_NoBd_Inst/TimeCard_i/axi_uart16550_gnss1/inst/uart16550_inst/spo[1]} {TimeCard_NoBd_Inst/TimeCard_i/axi_uart16550_gnss1/inst/uart16550_inst/spo[2]} {TimeCard_NoBd_Inst/TimeCard_i/axi_uart16550_gnss1/inst/uart16550_inst/spo[3]} {TimeCard_NoBd_Inst/TimeCard_i/axi_uart16550_gnss1/inst/uart16550_inst/spo[4]} {TimeCard_NoBd_Inst/TimeCard_i/axi_uart16550_gnss1/inst/uart16550_inst/spo[5]} {TimeCard_NoBd_Inst/TimeCard_i/axi_uart16550_gnss1/inst/uart16550_inst/spo[6]} {TimeCard_NoBd_Inst/TimeCard_i/axi_uart16550_gnss1/inst/uart16550_inst/spo[7]} {TimeCard_NoBd_Inst/TimeCard_i/axi_uart16550_gnss1/inst/uart16550_inst/spo[8]} {TimeCard_NoBd_Inst/TimeCard_i/axi_uart16550_gnss1/inst/uart16550_inst/spo[9]} {TimeCard_NoBd_Inst/TimeCard_i/axi_uart16550_gnss1/inst/uart16550_inst/spo[10]} {TimeCard_NoBd_Inst/TimeCard_i/axi_uart16550_gnss1/inst/uart16550_inst/spo[11]} {TimeCard_NoBd_Inst/TimeCard_i/axi_uart16550_gnss1/inst/uart16550_inst/spo[12]} {TimeCard_NoBd_Inst/TimeCard_i/axi_uart16550_gnss1/inst/uart16550_inst/spo[13]} {TimeCard_NoBd_Inst/TimeCard_i/axi_uart16550_gnss1/inst/uart16550_inst/spo[14]} {TimeCard_NoBd_Inst/TimeCard_i/axi_uart16550_gnss1/inst/uart16550_inst/spo[15]} {TimeCard_NoBd_Inst/TimeCard_i/axi_uart16550_gnss1/inst/uart16550_inst/spo[16]} {TimeCard_NoBd_Inst/TimeCard_i/axi_uart16550_gnss1/inst/uart16550_inst/spo[17]} {TimeCard_NoBd_Inst/TimeCard_i/axi_uart16550_gnss1/inst/uart16550_inst/spo[18]} {TimeCard_NoBd_Inst/TimeCard_i/axi_uart16550_gnss1/inst/uart16550_inst/spo[19]} {TimeCard_NoBd_Inst/TimeCard_i/axi_uart16550_gnss1/inst/uart16550_inst/spo[20]} {TimeCard_NoBd_Inst/TimeCard_i/axi_uart16550_gnss1/inst/uart16550_inst/spo[21]} {TimeCard_NoBd_Inst/TimeCard_i/axi_uart16550_gnss1/inst/uart16550_inst/spo[22]} {TimeCard_NoBd_Inst/TimeCard_i/axi_uart16550_gnss1/inst/uart16550_inst/spo[23]} {TimeCard_NoBd_Inst/TimeCard_i/axi_uart16550_gnss1/inst/uart16550_inst/spo[24]} {TimeCard_NoBd_Inst/TimeCard_i/axi_uart16550_gnss1/inst/uart16550_inst/spo[25]} {TimeCard_NoBd_Inst/TimeCard_i/axi_uart16550_gnss1/inst/uart16550_inst/spo[26]} {TimeCard_NoBd_Inst/TimeCard_i/axi_uart16550_gnss1/inst/uart16550_inst/spo[27]} {TimeCard_NoBd_Inst/TimeCard_i/axi_uart16550_gnss1/inst/uart16550_inst/spo[28]} {TimeCard_NoBd_Inst/TimeCard_i/axi_uart16550_gnss1/inst/uart16550_inst/spo[29]} {TimeCard_NoBd_Inst/TimeCard_i/axi_uart16550_gnss1/inst/uart16550_inst/spo[30]} {TimeCard_NoBd_Inst/TimeCard_i/axi_uart16550_gnss1/inst/uart16550_inst/spo[31]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe12]
set_property port_width 4 [get_debug_ports u_ila_0/probe12]
connect_debug_port u_ila_0/probe12 [get_nets [list {TimeCard_NoBd_Inst/TimeCard_i/axi_uart16550_gnss1/inst/uart16550_inst/bitpos_rx[0]} {TimeCard_NoBd_Inst/TimeCard_i/axi_uart16550_gnss1/inst/uart16550_inst/bitpos_rx[1]} {TimeCard_NoBd_Inst/TimeCard_i/axi_uart16550_gnss1/inst/uart16550_inst/bitpos_rx[2]} {TimeCard_NoBd_Inst/TimeCard_i/axi_uart16550_gnss1/inst/uart16550_inst/bitpos_rx[3]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe13]
set_property port_width 8 [get_debug_ports u_ila_0/probe13]
connect_debug_port u_ila_0/probe13 [get_nets [list {TimeCard_NoBd_Inst/TimeCard_i/axi_uart16550_gnss1/inst/uart16550_inst/mcr[0]} {TimeCard_NoBd_Inst/TimeCard_i/axi_uart16550_gnss1/inst/uart16550_inst/mcr[1]} {TimeCard_NoBd_Inst/TimeCard_i/axi_uart16550_gnss1/inst/uart16550_inst/mcr[2]} {TimeCard_NoBd_Inst/TimeCard_i/axi_uart16550_gnss1/inst/uart16550_inst/mcr[3]} {TimeCard_NoBd_Inst/TimeCard_i/axi_uart16550_gnss1/inst/uart16550_inst/mcr[4]} {TimeCard_NoBd_Inst/TimeCard_i/axi_uart16550_gnss1/inst/uart16550_inst/mcr[5]} {TimeCard_NoBd_Inst/TimeCard_i/axi_uart16550_gnss1/inst/uart16550_inst/mcr[6]} {TimeCard_NoBd_Inst/TimeCard_i/axi_uart16550_gnss1/inst/uart16550_inst/mcr[7]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe14]
set_property port_width 8 [get_debug_ports u_ila_0/probe14]
connect_debug_port u_ila_0/probe14 [get_nets [list {TimeCard_NoBd_Inst/TimeCard_i/axi_uart16550_gnss1/inst/uart16550_inst/tmp_rx[0]} {TimeCard_NoBd_Inst/TimeCard_i/axi_uart16550_gnss1/inst/uart16550_inst/tmp_rx[1]} {TimeCard_NoBd_Inst/TimeCard_i/axi_uart16550_gnss1/inst/uart16550_inst/tmp_rx[2]} {TimeCard_NoBd_Inst/TimeCard_i/axi_uart16550_gnss1/inst/uart16550_inst/tmp_rx[3]} {TimeCard_NoBd_Inst/TimeCard_i/axi_uart16550_gnss1/inst/uart16550_inst/tmp_rx[4]} {TimeCard_NoBd_Inst/TimeCard_i/axi_uart16550_gnss1/inst/uart16550_inst/tmp_rx[5]} {TimeCard_NoBd_Inst/TimeCard_i/axi_uart16550_gnss1/inst/uart16550_inst/tmp_rx[6]} {TimeCard_NoBd_Inst/TimeCard_i/axi_uart16550_gnss1/inst/uart16550_inst/tmp_rx[7]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe15]
set_property port_width 16 [get_debug_ports u_ila_0/probe15]
connect_debug_port u_ila_0/probe15 [get_nets [list {TimeCard_NoBd_Inst/TimeCard_i/axi_uart16550_gnss1/inst/uart16550_inst/rx_count[0]} {TimeCard_NoBd_Inst/TimeCard_i/axi_uart16550_gnss1/inst/uart16550_inst/rx_count[1]} {TimeCard_NoBd_Inst/TimeCard_i/axi_uart16550_gnss1/inst/uart16550_inst/rx_count[2]} {TimeCard_NoBd_Inst/TimeCard_i/axi_uart16550_gnss1/inst/uart16550_inst/rx_count[3]} {TimeCard_NoBd_Inst/TimeCard_i/axi_uart16550_gnss1/inst/uart16550_inst/rx_count[4]} {TimeCard_NoBd_Inst/TimeCard_i/axi_uart16550_gnss1/inst/uart16550_inst/rx_count[5]} {TimeCard_NoBd_Inst/TimeCard_i/axi_uart16550_gnss1/inst/uart16550_inst/rx_count[6]} {TimeCard_NoBd_Inst/TimeCard_i/axi_uart16550_gnss1/inst/uart16550_inst/rx_count[7]} {TimeCard_NoBd_Inst/TimeCard_i/axi_uart16550_gnss1/inst/uart16550_inst/rx_count[8]} {TimeCard_NoBd_Inst/TimeCard_i/axi_uart16550_gnss1/inst/uart16550_inst/rx_count[9]} {TimeCard_NoBd_Inst/TimeCard_i/axi_uart16550_gnss1/inst/uart16550_inst/rx_count[10]} {TimeCard_NoBd_Inst/TimeCard_i/axi_uart16550_gnss1/inst/uart16550_inst/rx_count[11]} {TimeCard_NoBd_Inst/TimeCard_i/axi_uart16550_gnss1/inst/uart16550_inst/rx_count[12]} {TimeCard_NoBd_Inst/TimeCard_i/axi_uart16550_gnss1/inst/uart16550_inst/rx_count[13]} {TimeCard_NoBd_Inst/TimeCard_i/axi_uart16550_gnss1/inst/uart16550_inst/rx_count[14]} {TimeCard_NoBd_Inst/TimeCard_i/axi_uart16550_gnss1/inst/uart16550_inst/rx_count[15]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe16]
set_property port_width 4 [get_debug_ports u_ila_0/probe16]
connect_debug_port u_ila_0/probe16 [get_nets [list {TimeCard_NoBd_Inst/TimeCard_i/axi_uart16550_gnss1/inst/axil2mm_inst/s_axi_wstrb[0]} {TimeCard_NoBd_Inst/TimeCard_i/axi_uart16550_gnss1/inst/axil2mm_inst/s_axi_wstrb[1]} {TimeCard_NoBd_Inst/TimeCard_i/axi_uart16550_gnss1/inst/axil2mm_inst/s_axi_wstrb[2]} {TimeCard_NoBd_Inst/TimeCard_i/axi_uart16550_gnss1/inst/axil2mm_inst/s_axi_wstrb[3]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe17]
set_property port_width 2 [get_debug_ports u_ila_0/probe17]
connect_debug_port u_ila_0/probe17 [get_nets [list {TimeCard_NoBd_Inst/TimeCard_i/axi_uart16550_gnss1/inst/axil2mm_inst/s_axi_bresp[0]} {TimeCard_NoBd_Inst/TimeCard_i/axi_uart16550_gnss1/inst/axil2mm_inst/s_axi_bresp[1]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe18]
set_property port_width 2 [get_debug_ports u_ila_0/probe18]
connect_debug_port u_ila_0/probe18 [get_nets [list {TimeCard_NoBd_Inst/TimeCard_i/axi_uart16550_gnss1/inst/uart16550_inst/state_rx[0]} {TimeCard_NoBd_Inst/TimeCard_i/axi_uart16550_gnss1/inst/uart16550_inst/state_rx[1]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe19]
set_property port_width 16 [get_debug_ports u_ila_0/probe19]
connect_debug_port u_ila_0/probe19 [get_nets [list {TimeCard_NoBd_Inst/TimeCard_i/axi_uart16550_gnss1/inst/uart16550_inst/d[8]} {TimeCard_NoBd_Inst/TimeCard_i/axi_uart16550_gnss1/inst/uart16550_inst/d[9]} {TimeCard_NoBd_Inst/TimeCard_i/axi_uart16550_gnss1/inst/uart16550_inst/d[10]} {TimeCard_NoBd_Inst/TimeCard_i/axi_uart16550_gnss1/inst/uart16550_inst/d[11]} {TimeCard_NoBd_Inst/TimeCard_i/axi_uart16550_gnss1/inst/uart16550_inst/d[12]} {TimeCard_NoBd_Inst/TimeCard_i/axi_uart16550_gnss1/inst/uart16550_inst/d[13]} {TimeCard_NoBd_Inst/TimeCard_i/axi_uart16550_gnss1/inst/uart16550_inst/d[14]} {TimeCard_NoBd_Inst/TimeCard_i/axi_uart16550_gnss1/inst/uart16550_inst/d[15]} {TimeCard_NoBd_Inst/TimeCard_i/axi_uart16550_gnss1/inst/uart16550_inst/d[16]} {TimeCard_NoBd_Inst/TimeCard_i/axi_uart16550_gnss1/inst/uart16550_inst/d[17]} {TimeCard_NoBd_Inst/TimeCard_i/axi_uart16550_gnss1/inst/uart16550_inst/d[18]} {TimeCard_NoBd_Inst/TimeCard_i/axi_uart16550_gnss1/inst/uart16550_inst/d[19]} {TimeCard_NoBd_Inst/TimeCard_i/axi_uart16550_gnss1/inst/uart16550_inst/d[20]} {TimeCard_NoBd_Inst/TimeCard_i/axi_uart16550_gnss1/inst/uart16550_inst/d[21]} {TimeCard_NoBd_Inst/TimeCard_i/axi_uart16550_gnss1/inst/uart16550_inst/d[22]} {TimeCard_NoBd_Inst/TimeCard_i/axi_uart16550_gnss1/inst/uart16550_inst/d[23]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe20]
set_property port_width 8 [get_debug_ports u_ila_0/probe20]
connect_debug_port u_ila_0/probe20 [get_nets [list {TimeCard_NoBd_Inst/TimeCard_i/axi_uart16550_gnss1/inst/uart16550_inst/tx_fifo_data[0]} {TimeCard_NoBd_Inst/TimeCard_i/axi_uart16550_gnss1/inst/uart16550_inst/tx_fifo_data[1]} {TimeCard_NoBd_Inst/TimeCard_i/axi_uart16550_gnss1/inst/uart16550_inst/tx_fifo_data[2]} {TimeCard_NoBd_Inst/TimeCard_i/axi_uart16550_gnss1/inst/uart16550_inst/tx_fifo_data[3]} {TimeCard_NoBd_Inst/TimeCard_i/axi_uart16550_gnss1/inst/uart16550_inst/tx_fifo_data[4]} {TimeCard_NoBd_Inst/TimeCard_i/axi_uart16550_gnss1/inst/uart16550_inst/tx_fifo_data[5]} {TimeCard_NoBd_Inst/TimeCard_i/axi_uart16550_gnss1/inst/uart16550_inst/tx_fifo_data[6]} {TimeCard_NoBd_Inst/TimeCard_i/axi_uart16550_gnss1/inst/uart16550_inst/tx_fifo_data[7]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe21]
set_property port_width 8 [get_debug_ports u_ila_0/probe21]
connect_debug_port u_ila_0/probe21 [get_nets [list {TimeCard_NoBd_Inst/TimeCard_i/axi_uart16550_gnss1/inst/uart16550_inst/msr[0]} {TimeCard_NoBd_Inst/TimeCard_i/axi_uart16550_gnss1/inst/uart16550_inst/msr[1]} {TimeCard_NoBd_Inst/TimeCard_i/axi_uart16550_gnss1/inst/uart16550_inst/msr[2]} {TimeCard_NoBd_Inst/TimeCard_i/axi_uart16550_gnss1/inst/uart16550_inst/msr[3]} {TimeCard_NoBd_Inst/TimeCard_i/axi_uart16550_gnss1/inst/uart16550_inst/msr[4]} {TimeCard_NoBd_Inst/TimeCard_i/axi_uart16550_gnss1/inst/uart16550_inst/msr[5]} {TimeCard_NoBd_Inst/TimeCard_i/axi_uart16550_gnss1/inst/uart16550_inst/msr[6]} {TimeCard_NoBd_Inst/TimeCard_i/axi_uart16550_gnss1/inst/uart16550_inst/msr[7]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe22]
set_property port_width 3 [get_debug_ports u_ila_0/probe22]
connect_debug_port u_ila_0/probe22 [get_nets [list {TimeCard_NoBd_Inst/TimeCard_i/axi_uart16550_gnss1/inst/uart16550_inst/a[0]} {TimeCard_NoBd_Inst/TimeCard_i/axi_uart16550_gnss1/inst/uart16550_inst/a[1]} {TimeCard_NoBd_Inst/TimeCard_i/axi_uart16550_gnss1/inst/uart16550_inst/a[2]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe23]
set_property port_width 8 [get_debug_ports u_ila_0/probe23]
connect_debug_port u_ila_0/probe23 [get_nets [list {TimeCard_NoBd_Inst/TimeCard_i/axi_uart16550_gnss1/inst/uart16550_inst/spr[0]} {TimeCard_NoBd_Inst/TimeCard_i/axi_uart16550_gnss1/inst/uart16550_inst/spr[1]} {TimeCard_NoBd_Inst/TimeCard_i/axi_uart16550_gnss1/inst/uart16550_inst/spr[2]} {TimeCard_NoBd_Inst/TimeCard_i/axi_uart16550_gnss1/inst/uart16550_inst/spr[3]} {TimeCard_NoBd_Inst/TimeCard_i/axi_uart16550_gnss1/inst/uart16550_inst/spr[4]} {TimeCard_NoBd_Inst/TimeCard_i/axi_uart16550_gnss1/inst/uart16550_inst/spr[5]} {TimeCard_NoBd_Inst/TimeCard_i/axi_uart16550_gnss1/inst/uart16550_inst/spr[6]} {TimeCard_NoBd_Inst/TimeCard_i/axi_uart16550_gnss1/inst/uart16550_inst/spr[7]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe24]
set_property port_width 4 [get_debug_ports u_ila_0/probe24]
connect_debug_port u_ila_0/probe24 [get_nets [list {TimeCard_NoBd_Inst/TimeCard_i/axi_uart16550_gnss1/inst/uart16550_inst/rx_filled[0]} {TimeCard_NoBd_Inst/TimeCard_i/axi_uart16550_gnss1/inst/uart16550_inst/rx_filled[1]} {TimeCard_NoBd_Inst/TimeCard_i/axi_uart16550_gnss1/inst/uart16550_inst/rx_filled[2]} {TimeCard_NoBd_Inst/TimeCard_i/axi_uart16550_gnss1/inst/uart16550_inst/rx_filled[3]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe25]
set_property port_width 32 [get_debug_ports u_ila_0/probe25]
connect_debug_port u_ila_0/probe25 [get_nets [list {TimeCard_NoBd_Inst/TimeCard_i/axi_uart16550_gnss1/inst/axil2mm_inst/s_axi_wdata[0]} {TimeCard_NoBd_Inst/TimeCard_i/axi_uart16550_gnss1/inst/axil2mm_inst/s_axi_wdata[1]} {TimeCard_NoBd_Inst/TimeCard_i/axi_uart16550_gnss1/inst/axil2mm_inst/s_axi_wdata[2]} {TimeCard_NoBd_Inst/TimeCard_i/axi_uart16550_gnss1/inst/axil2mm_inst/s_axi_wdata[3]} {TimeCard_NoBd_Inst/TimeCard_i/axi_uart16550_gnss1/inst/axil2mm_inst/s_axi_wdata[4]} {TimeCard_NoBd_Inst/TimeCard_i/axi_uart16550_gnss1/inst/axil2mm_inst/s_axi_wdata[5]} {TimeCard_NoBd_Inst/TimeCard_i/axi_uart16550_gnss1/inst/axil2mm_inst/s_axi_wdata[6]} {TimeCard_NoBd_Inst/TimeCard_i/axi_uart16550_gnss1/inst/axil2mm_inst/s_axi_wdata[7]} {TimeCard_NoBd_Inst/TimeCard_i/axi_uart16550_gnss1/inst/axil2mm_inst/s_axi_wdata[8]} {TimeCard_NoBd_Inst/TimeCard_i/axi_uart16550_gnss1/inst/axil2mm_inst/s_axi_wdata[9]} {TimeCard_NoBd_Inst/TimeCard_i/axi_uart16550_gnss1/inst/axil2mm_inst/s_axi_wdata[10]} {TimeCard_NoBd_Inst/TimeCard_i/axi_uart16550_gnss1/inst/axil2mm_inst/s_axi_wdata[11]} {TimeCard_NoBd_Inst/TimeCard_i/axi_uart16550_gnss1/inst/axil2mm_inst/s_axi_wdata[12]} {TimeCard_NoBd_Inst/TimeCard_i/axi_uart16550_gnss1/inst/axil2mm_inst/s_axi_wdata[13]} {TimeCard_NoBd_Inst/TimeCard_i/axi_uart16550_gnss1/inst/axil2mm_inst/s_axi_wdata[14]} {TimeCard_NoBd_Inst/TimeCard_i/axi_uart16550_gnss1/inst/axil2mm_inst/s_axi_wdata[15]} {TimeCard_NoBd_Inst/TimeCard_i/axi_uart16550_gnss1/inst/axil2mm_inst/s_axi_wdata[16]} {TimeCard_NoBd_Inst/TimeCard_i/axi_uart16550_gnss1/inst/axil2mm_inst/s_axi_wdata[17]} {TimeCard_NoBd_Inst/TimeCard_i/axi_uart16550_gnss1/inst/axil2mm_inst/s_axi_wdata[18]} {TimeCard_NoBd_Inst/TimeCard_i/axi_uart16550_gnss1/inst/axil2mm_inst/s_axi_wdata[19]} {TimeCard_NoBd_Inst/TimeCard_i/axi_uart16550_gnss1/inst/axil2mm_inst/s_axi_wdata[20]} {TimeCard_NoBd_Inst/TimeCard_i/axi_uart16550_gnss1/inst/axil2mm_inst/s_axi_wdata[21]} {TimeCard_NoBd_Inst/TimeCard_i/axi_uart16550_gnss1/inst/axil2mm_inst/s_axi_wdata[22]} {TimeCard_NoBd_Inst/TimeCard_i/axi_uart16550_gnss1/inst/axil2mm_inst/s_axi_wdata[23]} {TimeCard_NoBd_Inst/TimeCard_i/axi_uart16550_gnss1/inst/axil2mm_inst/s_axi_wdata[24]} {TimeCard_NoBd_Inst/TimeCard_i/axi_uart16550_gnss1/inst/axil2mm_inst/s_axi_wdata[25]} {TimeCard_NoBd_Inst/TimeCard_i/axi_uart16550_gnss1/inst/axil2mm_inst/s_axi_wdata[26]} {TimeCard_NoBd_Inst/TimeCard_i/axi_uart16550_gnss1/inst/axil2mm_inst/s_axi_wdata[27]} {TimeCard_NoBd_Inst/TimeCard_i/axi_uart16550_gnss1/inst/axil2mm_inst/s_axi_wdata[28]} {TimeCard_NoBd_Inst/TimeCard_i/axi_uart16550_gnss1/inst/axil2mm_inst/s_axi_wdata[29]} {TimeCard_NoBd_Inst/TimeCard_i/axi_uart16550_gnss1/inst/axil2mm_inst/s_axi_wdata[30]} {TimeCard_NoBd_Inst/TimeCard_i/axi_uart16550_gnss1/inst/axil2mm_inst/s_axi_wdata[31]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe26]
set_property port_width 8 [get_debug_ports u_ila_0/probe26]
connect_debug_port u_ila_0/probe26 [get_nets [list {TimeCard_NoBd_Inst/TimeCard_i/axi_uart16550_gnss1/inst/uart16550_inst/data[0]} {TimeCard_NoBd_Inst/TimeCard_i/axi_uart16550_gnss1/inst/uart16550_inst/data[1]} {TimeCard_NoBd_Inst/TimeCard_i/axi_uart16550_gnss1/inst/uart16550_inst/data[2]} {TimeCard_NoBd_Inst/TimeCard_i/axi_uart16550_gnss1/inst/uart16550_inst/data[3]} {TimeCard_NoBd_Inst/TimeCard_i/axi_uart16550_gnss1/inst/uart16550_inst/data[4]} {TimeCard_NoBd_Inst/TimeCard_i/axi_uart16550_gnss1/inst/uart16550_inst/data[5]} {TimeCard_NoBd_Inst/TimeCard_i/axi_uart16550_gnss1/inst/uart16550_inst/data[6]} {TimeCard_NoBd_Inst/TimeCard_i/axi_uart16550_gnss1/inst/uart16550_inst/data[7]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe27]
set_property port_width 8 [get_debug_ports u_ila_0/probe27]
connect_debug_port u_ila_0/probe27 [get_nets [list {TimeCard_NoBd_Inst/TimeCard_i/axi_uart16550_gnss1/inst/uart16550_inst/ier[0]} {TimeCard_NoBd_Inst/TimeCard_i/axi_uart16550_gnss1/inst/uart16550_inst/ier[1]} {TimeCard_NoBd_Inst/TimeCard_i/axi_uart16550_gnss1/inst/uart16550_inst/ier[2]} {TimeCard_NoBd_Inst/TimeCard_i/axi_uart16550_gnss1/inst/uart16550_inst/ier[3]} {TimeCard_NoBd_Inst/TimeCard_i/axi_uart16550_gnss1/inst/uart16550_inst/ier[4]} {TimeCard_NoBd_Inst/TimeCard_i/axi_uart16550_gnss1/inst/uart16550_inst/ier[5]} {TimeCard_NoBd_Inst/TimeCard_i/axi_uart16550_gnss1/inst/uart16550_inst/ier[6]} {TimeCard_NoBd_Inst/TimeCard_i/axi_uart16550_gnss1/inst/uart16550_inst/ier[7]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe28]
set_property port_width 8 [get_debug_ports u_ila_0/probe28]
connect_debug_port u_ila_0/probe28 [get_nets [list {TimeCard_NoBd_Inst/TimeCard_i/axi_uart16550_gnss1/inst/uart16550_inst/rx_fifo_data[0]} {TimeCard_NoBd_Inst/TimeCard_i/axi_uart16550_gnss1/inst/uart16550_inst/rx_fifo_data[1]} {TimeCard_NoBd_Inst/TimeCard_i/axi_uart16550_gnss1/inst/uart16550_inst/rx_fifo_data[2]} {TimeCard_NoBd_Inst/TimeCard_i/axi_uart16550_gnss1/inst/uart16550_inst/rx_fifo_data[3]} {TimeCard_NoBd_Inst/TimeCard_i/axi_uart16550_gnss1/inst/uart16550_inst/rx_fifo_data[4]} {TimeCard_NoBd_Inst/TimeCard_i/axi_uart16550_gnss1/inst/uart16550_inst/rx_fifo_data[5]} {TimeCard_NoBd_Inst/TimeCard_i/axi_uart16550_gnss1/inst/uart16550_inst/rx_fifo_data[6]} {TimeCard_NoBd_Inst/TimeCard_i/axi_uart16550_gnss1/inst/uart16550_inst/rx_fifo_data[7]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe29]
set_property port_width 16 [get_debug_ports u_ila_0/probe29]
connect_debug_port u_ila_0/probe29 [get_nets [list {TimeCard_NoBd_Inst/TimeCard_i/axi_uart16550_gnss1/inst/uart16550_inst/sample[0]} {TimeCard_NoBd_Inst/TimeCard_i/axi_uart16550_gnss1/inst/uart16550_inst/sample[1]} {TimeCard_NoBd_Inst/TimeCard_i/axi_uart16550_gnss1/inst/uart16550_inst/sample[2]} {TimeCard_NoBd_Inst/TimeCard_i/axi_uart16550_gnss1/inst/uart16550_inst/sample[3]} {TimeCard_NoBd_Inst/TimeCard_i/axi_uart16550_gnss1/inst/uart16550_inst/sample[4]} {TimeCard_NoBd_Inst/TimeCard_i/axi_uart16550_gnss1/inst/uart16550_inst/sample[5]} {TimeCard_NoBd_Inst/TimeCard_i/axi_uart16550_gnss1/inst/uart16550_inst/sample[6]} {TimeCard_NoBd_Inst/TimeCard_i/axi_uart16550_gnss1/inst/uart16550_inst/sample[7]} {TimeCard_NoBd_Inst/TimeCard_i/axi_uart16550_gnss1/inst/uart16550_inst/sample[8]} {TimeCard_NoBd_Inst/TimeCard_i/axi_uart16550_gnss1/inst/uart16550_inst/sample[9]} {TimeCard_NoBd_Inst/TimeCard_i/axi_uart16550_gnss1/inst/uart16550_inst/sample[10]} {TimeCard_NoBd_Inst/TimeCard_i/axi_uart16550_gnss1/inst/uart16550_inst/sample[11]} {TimeCard_NoBd_Inst/TimeCard_i/axi_uart16550_gnss1/inst/uart16550_inst/sample[12]} {TimeCard_NoBd_Inst/TimeCard_i/axi_uart16550_gnss1/inst/uart16550_inst/sample[13]} {TimeCard_NoBd_Inst/TimeCard_i/axi_uart16550_gnss1/inst/uart16550_inst/sample[14]} {TimeCard_NoBd_Inst/TimeCard_i/axi_uart16550_gnss1/inst/uart16550_inst/sample[15]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe30]
set_property port_width 8 [get_debug_ports u_ila_0/probe30]
connect_debug_port u_ila_0/probe30 [get_nets [list {TimeCard_NoBd_Inst/TimeCard_i/axi_uart16550_gnss1/inst/uart16550_inst/thr[0]} {TimeCard_NoBd_Inst/TimeCard_i/axi_uart16550_gnss1/inst/uart16550_inst/thr[1]} {TimeCard_NoBd_Inst/TimeCard_i/axi_uart16550_gnss1/inst/uart16550_inst/thr[2]} {TimeCard_NoBd_Inst/TimeCard_i/axi_uart16550_gnss1/inst/uart16550_inst/thr[3]} {TimeCard_NoBd_Inst/TimeCard_i/axi_uart16550_gnss1/inst/uart16550_inst/thr[4]} {TimeCard_NoBd_Inst/TimeCard_i/axi_uart16550_gnss1/inst/uart16550_inst/thr[5]} {TimeCard_NoBd_Inst/TimeCard_i/axi_uart16550_gnss1/inst/uart16550_inst/thr[6]} {TimeCard_NoBd_Inst/TimeCard_i/axi_uart16550_gnss1/inst/uart16550_inst/thr[7]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe31]
set_property port_width 1 [get_debug_ports u_ila_0/probe31]
connect_debug_port u_ila_0/probe31 [get_nets [list TimeCard_NoBd_Inst/TimeCard_i/axi_iic_clock_iic2intc_irpt]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe32]
set_property port_width 1 [get_debug_ports u_ila_0/probe32]
connect_debug_port u_ila_0/probe32 [get_nets [list TimeCard_NoBd_Inst/TimeCard_i/axi_iic_iic2intc_irpt]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe33]
set_property port_width 1 [get_debug_ports u_ila_0/probe33]
connect_debug_port u_ila_0/probe33 [get_nets [list TimeCard_NoBd_Inst/TimeCard_i/axi_quad_spi_flash_ip2intc_irpt]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe34]
set_property port_width 1 [get_debug_ports u_ila_0/probe34]
connect_debug_port u_ila_0/probe34 [get_nets [list TimeCard_NoBd_Inst/TimeCard_i/axi_uart16550_ext_ip2intc_irpt]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe35]
set_property port_width 1 [get_debug_ports u_ila_0/probe35]
connect_debug_port u_ila_0/probe35 [get_nets [list TimeCard_NoBd_Inst/TimeCard_i/axi_uart16550_gnss2_ip2intc_irpt]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe36]
set_property port_width 1 [get_debug_ports u_ila_0/probe36]
connect_debug_port u_ila_0/probe36 [get_nets [list TimeCard_NoBd_Inst/TimeCard_i/axi_uart16550_mac_ip2intc_irpt]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe37]
set_property port_width 1 [get_debug_ports u_ila_0/probe37]
connect_debug_port u_ila_0/probe37 [get_nets [list TimeCard_NoBd_Inst/TimeCard_i/axi_uart16550_gnss1/inst/uart16550_inst/irq]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe38]
set_property port_width 1 [get_debug_ports u_ila_0/probe38]
connect_debug_port u_ila_0/probe38 [get_nets [list TimeCard_NoBd_Inst/TimeCard_i/axi_uart16550_gnss1/inst/uart16550_inst/rd]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe39]
set_property port_width 1 [get_debug_ports u_ila_0/probe39]
connect_debug_port u_ila_0/probe39 [get_nets [list TimeCard_NoBd_Inst/TimeCard_i/axi_uart16550_gnss1/inst/uart16550_inst/ready]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe40]
set_property port_width 1 [get_debug_ports u_ila_0/probe40]
connect_debug_port u_ila_0/probe40 [get_nets [list TimeCard_NoBd_Inst/TimeCard_i/axi_uart16550_gnss1/inst/uart16550_inst/rx_fifo_deq]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe41]
set_property port_width 1 [get_debug_ports u_ila_0/probe41]
connect_debug_port u_ila_0/probe41 [get_nets [list TimeCard_NoBd_Inst/TimeCard_i/axi_uart16550_gnss1/inst/uart16550_inst/rx_fifo_empty]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe42]
set_property port_width 1 [get_debug_ports u_ila_0/probe42]
connect_debug_port u_ila_0/probe42 [get_nets [list TimeCard_NoBd_Inst/TimeCard_i/axi_uart16550_gnss1/inst/uart16550_inst/rx_fifo_enq]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe43]
set_property port_width 1 [get_debug_ports u_ila_0/probe43]
connect_debug_port u_ila_0/probe43 [get_nets [list TimeCard_NoBd_Inst/TimeCard_i/axi_uart16550_gnss1/inst/uart16550_inst/rx_fifo_full]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe44]
set_property port_width 1 [get_debug_ports u_ila_0/probe44]
connect_debug_port u_ila_0/probe44 [get_nets [list TimeCard_NoBd_Inst/TimeCard_i/axi_uart16550_gnss1/inst/uart16550_inst/rx_r]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe45]
set_property port_width 1 [get_debug_ports u_ila_0/probe45]
connect_debug_port u_ila_0/probe45 [get_nets [list TimeCard_NoBd_Inst/TimeCard_i/axi_uart16550_gnss1/inst/axil2mm_inst/s_axi_arready]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe46]
set_property port_width 1 [get_debug_ports u_ila_0/probe46]
connect_debug_port u_ila_0/probe46 [get_nets [list TimeCard_NoBd_Inst/TimeCard_i/axi_uart16550_gnss1/inst/axil2mm_inst/s_axi_arvalid]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe47]
set_property port_width 1 [get_debug_ports u_ila_0/probe47]
connect_debug_port u_ila_0/probe47 [get_nets [list TimeCard_NoBd_Inst/TimeCard_i/axi_uart16550_gnss1/inst/axil2mm_inst/s_axi_awready]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe48]
set_property port_width 1 [get_debug_ports u_ila_0/probe48]
connect_debug_port u_ila_0/probe48 [get_nets [list TimeCard_NoBd_Inst/TimeCard_i/axi_uart16550_gnss1/inst/axil2mm_inst/s_axi_awvalid]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe49]
set_property port_width 1 [get_debug_ports u_ila_0/probe49]
connect_debug_port u_ila_0/probe49 [get_nets [list TimeCard_NoBd_Inst/TimeCard_i/axi_uart16550_gnss1/inst/axil2mm_inst/s_axi_bready]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe50]
set_property port_width 1 [get_debug_ports u_ila_0/probe50]
connect_debug_port u_ila_0/probe50 [get_nets [list TimeCard_NoBd_Inst/TimeCard_i/axi_uart16550_gnss1/inst/axil2mm_inst/s_axi_bvalid]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe51]
set_property port_width 1 [get_debug_ports u_ila_0/probe51]
connect_debug_port u_ila_0/probe51 [get_nets [list TimeCard_NoBd_Inst/TimeCard_i/axi_uart16550_gnss1/inst/axil2mm_inst/s_axi_rready]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe52]
set_property port_width 1 [get_debug_ports u_ila_0/probe52]
connect_debug_port u_ila_0/probe52 [get_nets [list TimeCard_NoBd_Inst/TimeCard_i/axi_uart16550_gnss1/inst/axil2mm_inst/s_axi_rvalid]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe53]
set_property port_width 1 [get_debug_ports u_ila_0/probe53]
connect_debug_port u_ila_0/probe53 [get_nets [list TimeCard_NoBd_Inst/TimeCard_i/axi_uart16550_gnss1/inst/axil2mm_inst/s_axi_wready]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe54]
set_property port_width 1 [get_debug_ports u_ila_0/probe54]
connect_debug_port u_ila_0/probe54 [get_nets [list TimeCard_NoBd_Inst/TimeCard_i/axi_uart16550_gnss1/inst/axil2mm_inst/s_axi_wvalid]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe55]
set_property port_width 1 [get_debug_ports u_ila_0/probe55]
connect_debug_port u_ila_0/probe55 [get_nets [list TimeCard_NoBd_Inst/TimeCard_i/axi_uart16550_gnss1/inst/uart16550_inst/tx_fifo_empty]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe56]
set_property port_width 1 [get_debug_ports u_ila_0/probe56]
connect_debug_port u_ila_0/probe56 [get_nets [list TimeCard_NoBd_Inst/TimeCard_i/axi_uart16550_gnss1/inst/uart16550_inst/tx_fifo_enq]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe57]
set_property port_width 1 [get_debug_ports u_ila_0/probe57]
connect_debug_port u_ila_0/probe57 [get_nets [list TimeCard_NoBd_Inst/TimeCard_i/axi_uart16550_gnss1/inst/uart16550_inst/tx_fifo_full]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe58]
set_property port_width 1 [get_debug_ports u_ila_0/probe58]
connect_debug_port u_ila_0/probe58 [get_nets [list TimeCard_NoBd_Inst/TimeCard_i/axi_uart16550_gnss1/inst/uart16550_inst/tx_r]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe59]
set_property port_width 1 [get_debug_ports u_ila_0/probe59]
connect_debug_port u_ila_0/probe59 [get_nets [list TimeCard_NoBd_Inst/TimeCard_i/axi_uart16550_gnss1/inst/uart16550_inst/txclk_en]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe60]
set_property port_width 1 [get_debug_ports u_ila_0/probe60]
connect_debug_port u_ila_0/probe60 [get_nets [list TimeCard_NoBd_Inst/TimeCard_i/UartGnss1Rx_DatIn_1]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe61]
set_property port_width 1 [get_debug_ports u_ila_0/probe61]
connect_debug_port u_ila_0/probe61 [get_nets [list TimeCard_NoBd_Inst/TimeCard_i/axi_uart16550_gnss1/inst/uart16550_inst/we]]
create_debug_core u_ila_1 ila
set_property ALL_PROBE_SAME_MU true [get_debug_cores u_ila_1]
set_property ALL_PROBE_SAME_MU_CNT 4 [get_debug_cores u_ila_1]
set_property C_ADV_TRIGGER true [get_debug_cores u_ila_1]
set_property C_DATA_DEPTH 1024 [get_debug_cores u_ila_1]
set_property C_EN_STRG_QUAL true [get_debug_cores u_ila_1]
set_property C_INPUT_PIPE_STAGES 0 [get_debug_cores u_ila_1]
set_property C_TRIGIN_EN false [get_debug_cores u_ila_1]
set_property C_TRIGOUT_EN false [get_debug_cores u_ila_1]
set_property port_width 1 [get_debug_ports u_ila_1/clk]
connect_debug_port u_ila_1/clk [get_nets [list TimeCard_NoBd_Inst/TimeCard_i/clk_wiz_2/inst/clk_out1]]
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_1/probe0]
set_property port_width 1 [get_debug_ports u_ila_1/probe0]
connect_debug_port u_ila_1/probe0 [get_nets [list TimeCard_NoBd_Inst/TimeCard_i/AdjustableClock_v_0_InHoldover_DatOut]]
create_debug_port u_ila_1 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_1/probe1]
set_property port_width 1 [get_debug_ports u_ila_1/probe1]
connect_debug_port u_ila_1/probe1 [get_nets [list TimeCard_NoBd_Inst/TimeCard_i/AdjustableClock_v_0_InSync_DatOut]]
create_debug_port u_ila_1 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_1/probe2]
set_property port_width 1 [get_debug_ports u_ila_1/probe2]
connect_debug_port u_ila_1/probe2 [get_nets [list TimeCard_NoBd_Inst/TimeCard_i/TodSlave_v_0/inst/TodSlave_inst/RxUart_DatReg]]
set_property C_CLK_INPUT_FREQ_HZ 300000000 [get_debug_cores dbg_hub]
set_property C_ENABLE_CLK_DIVIDER false [get_debug_cores dbg_hub]
set_property C_USER_SCAN_CHAIN 1 [get_debug_cores dbg_hub]
connect_debug_port dbg_hub/clk [get_nets Mhz50Clk_Clk]
