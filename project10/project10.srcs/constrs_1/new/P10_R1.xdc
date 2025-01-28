

#Seven Segmen Display Cathodes
set_property -dict { PACKAGE_PIN K14   IOSTANDARD LVCMOS33 } [get_ports { F[0] }]; #IO_L20P_T3_AD6P_35 Schematic=SSEG_CA
set_property -dict { PACKAGE_PIN H15   IOSTANDARD LVCMOS33 } [get_ports { F[1] }]; #IO_L19P_T3_35 Schematic=SSEG_CB
set_property -dict { PACKAGE_PIN J18   IOSTANDARD LVCMOS33 } [get_ports { F[2] }]; #IO_L14P_T2_AD4P_SRCC_35 Schematic=SSEG_CC
set_property -dict { PACKAGE_PIN J15   IOSTANDARD LVCMOS33 } [get_ports { F[3] }]; #IO_25_35 Schematic=SSEG_CD
set_property -dict { PACKAGE_PIN M17   IOSTANDARD LVCMOS33 } [get_ports { F[4] }]; #IO_L8P_T1_AD10P_35 Schematic=SSEG_CE
set_property -dict { PACKAGE_PIN J16   IOSTANDARD LVCMOS33 } [get_ports { F[5] }]; #IO_L24N_T3_AD15N_35 Schematic=SSEG_CF
set_property -dict { PACKAGE_PIN H18   IOSTANDARD LVCMOS33 } [get_ports { F[6] }]; #IO_L8P_T1_AD10P_35 Schematic=SSEG_CG
set_property -dict { PACKAGE_PIN K18   IOSTANDARD LVCMOS33 } [get_ports { F[7] }]; #IO_L12N_T1_MRCC_35 Schematic=SSEG_DP

//LEFT MOST SW
set_property -dict { PACKAGE_PIN T12   IOSTANDARD LVCMOS33 } [get_ports { OpCode[0] }]; #IO_L10N_T1_34 Sch=VGA_R5_CON
set_property -dict { PACKAGE_PIN T11   IOSTANDARD LVCMOS33 } [get_ports { OpCode[1] }]; #IO_L18P_T2_34 Sch=VGA_R6_CON
set_property -dict { PACKAGE_PIN T14   IOSTANDARD LVCMOS33 } [get_ports { OpCode[2] }]; #IO_L18N_T2_AD13N_35 Sch=VGA_R7_CON


set_property -dict { PACKAGE_PIN U20   IOSTANDARD LVCMOS33 } [get_ports { sw[0] }]; #IO_L15N_T2_DQS_34 Schematic=SW1
set_property -dict { PACKAGE_PIN R16   IOSTANDARD LVCMOS33 } [get_ports { sw[1] }]; #IO_L19P_T3_34 Schematic=SW2
set_property -dict { PACKAGE_PIN N16   IOSTANDARD LVCMOS33 } [get_ports { sw[2] }]; #IO_L21N_T3_DQS_AD14N_35 Schematic=SW3
set_property -dict { PACKAGE_PIN R14   IOSTANDARD LVCMOS33 } [get_ports { sw[3] }]; #IO_L6N_T0_VREF_34 Schematic=SW4
set_property -dict { PACKAGE_PIN P14   IOSTANDARD LVCMOS33 } [get_ports { sw[4] }]; #IO_L6P_T0_34 Schematic=SW5
set_property -dict { PACKAGE_PIN L15   IOSTANDARD LVCMOS33 } [get_ports { sw[5] }]; #IO_L22N_T3_AD7N_35 Schematic=SW6
set_property -dict { PACKAGE_PIN M15   IOSTANDARD LVCMOS33 } [get_ports { sw[6] }]; #IO_L23N_T3_35 Schematic=SW7
set_property -dict { PACKAGE_PIN T10   IOSTANDARD LVCMOS33 } [get_ports { sw[7] }]; #IO_L10P_T1_34 Sch=VGA_R4_CON

//right most sw - determines if 8 bit input is A(0) or B(1) 
set_property -dict { PACKAGE_PIN R17   IOSTANDARD LVCMOS33 } [get_ports { sw[0] }]; #IO_L19N_T3_VREF_34 Schematic=SW0