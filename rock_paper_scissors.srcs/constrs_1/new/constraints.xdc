# Constraints File

# Clock
set_property PACKAGE_PIN W5 [get_ports clk]
set_property IOSTANDARD LVCMOS33 [get_ports clk]
create_clock -period 10 -waveform {0 5} [get_ports clk]

# Buttons
set_property PACKAGE_PIN U18 [get_ports btnc]
set_property IOSTANDARD LVCMOS33 [get_ports btnc]
set_property PACKAGE_PIN W19 [get_ports btnl]
set_property IOSTANDARD LVCMOS33 [get_ports btnl]
set_property PACKAGE_PIN T17 [get_ports btnr]
set_property IOSTANDARD LVCMOS33 [get_ports btnr]

# leds
set_property PACKAGE_PIN U16 [get_ports leds[0]]
set_property IOSTANDARD LVCMOS33 [get_ports leds[0]]
set_property PACKAGE_PIN E19 [get_ports leds[1]]
set_property IOSTANDARD LVCMOS33 [get_ports leds[1]]

# Seven Segment Anodes
set_property PACKAGE_PIN U2 [get_ports anode_out[0]]
set_property IOSTANDARD LVCMOS33 [get_ports anode_out[0]]
set_property PACKAGE_PIN U4 [get_ports anode_out[1]]
set_property IOSTANDARD LVCMOS33 [get_ports anode_out[1]]
set_property PACKAGE_PIN V4 [get_ports anode_out[2]]
set_property IOSTANDARD LVCMOS33 [get_ports anode_out[2]]
set_property PACKAGE_PIN W4 [get_ports anode_out[3]] 
set_property IOSTANDARD LVCMOS33 [get_ports anode_out[3]]

# Seven Segment LEDs
set_property PACKAGE_PIN W7 [get_ports seg_out[0]]
set_property IOSTANDARD LVCMOS33 [get_ports seg_out[0]]
set_property PACKAGE_PIN W6 [get_ports seg_out[1]]
set_property IOSTANDARD LVCMOS33 [get_ports seg_out[1]]
set_property PACKAGE_PIN U8 [get_ports seg_out[2]]
set_property IOSTANDARD LVCMOS33 [get_ports seg_out[2]]
set_property PACKAGE_PIN V8 [get_ports seg_out[3]]
set_property IOSTANDARD LVCMOS33 [get_ports seg_out[3]]
set_property PACKAGE_PIN U5 [get_ports seg_out[4]]
set_property IOSTANDARD LVCMOS33 [get_ports seg_out[4]]
set_property PACKAGE_PIN V5 [get_ports seg_out[5]]
set_property IOSTANDARD LVCMOS33 [get_ports seg_out[5]]
set_property PACKAGE_PIN U7 [get_ports seg_out[6]]
set_property IOSTANDARD LVCMOS33 [get_ports seg_out[6]]
set_property PACKAGE_PIN V7 [get_ports seg_out[7]]
set_property IOSTANDARD LVCMOS33 [get_ports seg_out[7]]
