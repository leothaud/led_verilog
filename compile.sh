yosys -p 'read_verilog top.v led.v pll.v bram.v; synth_ice40; write_json top.json'
nextpnr-ice40 --up5k --package sg48 --json top.json --pcf led.pcf --asc top.asc --write top_pnr.json
icepack top.asc top.bit
