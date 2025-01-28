##Clock
set_property -dict { PACKAGE_PIN H16   IOSTANDARD LVCMOS33 } [get_ports { clk }];


#Push Buttons
set_property -dict { PACKAGE_PIN W14   IOSTANDARD LVCMOS33 } [get_ports { rst }]; #IO_L8P_T1_34 Schematic=BTN0


set_property -dict { PACKAGE_PIN M14   IOSTANDARD LVCMOS33 } [get_ports { raw_input }]; #IO_L23P_T3_35 Schematic=BTN3


#RGB_LEDS
set_property -dict { PACKAGE_PIN W18   IOSTANDARD LVCMOS33 } [get_ports { clean_output }]; #IO_L22P_T3_34  Schematic=LD10_R

