blinky_noir:
	mkdir -p output
	yosys -q -p "synth_ecp5 -top blinky -json output/blinky_noir.json" rtl/blinky_noir.v
	nextpnr-ecp5 --12k --package CABGA256 --lpf noir_v0.lpf --json output/blinky_noir.json --textcfg output/noir_blinky_out.config
	ecppack -v --compress --freq 2.4 output/noir_blinky_out.config --bit output/noir.bit

prog:
	openFPGALoader -c usb-blaster output/noir.bit
