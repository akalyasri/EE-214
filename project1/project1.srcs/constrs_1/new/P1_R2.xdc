#Map Pin R17 to the net wire sw
set_property -dict { PACKAGE_PIN R17   IOSTANDARD LVCMOS33 } [get_ports { sw }]; 
set_property -dict { PACKAGE_PIN N20   IOSTANDARD LVCMOS33 } [get_ports { led }]; 