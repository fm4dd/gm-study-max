## GM-STUDY-MAX Example "wavplay"

This code has been adopted from Simon Monk "Getting started with Verilog", Chapter 8. It loads a audio sample into RAM, and plays it back through an GPIO pin. On the gm-study-max board, GPIO bank WC pins IO_WC_B0 (right channel) and IO_WC_A0 (left channel) are connected to the 3.5mm audio jack that can be connected to earphones, or to an external amplifier/speaker. If all works, you'll hear a voice speaking the word "one".

### Usage:
```
fm@nuc7vm2204:~/fpga/hardware/gm-study-max/examples/wavplay$ make all
/home/fm/cc-toolchain-linux/bin/yosys/yosys -ql log/synth.log -p 'read -sv src/debounce.v src/hexdigit.v src/wavplay.v; synth_gatemate -top wavplay -nomx8 -vlog net/wavplay_synth.v'
/home/fm/cc-toolchain-linux/bin/p_r/p_r -i net/wavplay_synth.v -o wavplay -ccf ../gm-study-max.ccf > log/impl.log
/usr/local/bin/openFPGALoader  -b gatemate_evb_jtag wavplay_00.cfg
Jtag frequency : requested 6.00MHz   -> real 6.00MHz
Load SRAM via JTAG: [==================================================] 100.00%
Done
Wait for CFG_DONE DONE
```

### Notes:

- A few audio files were provided by the author Simon Monk, they have different lengths ranging from 1..10s.

- Depending on the FPGA architecture and toolchain implementation, larger samples can seriously stress the toolchain. On a ULX3S board (Lattice EPC5 FPGA), the 5s sample took over 6 hours to route.

- The audio signal has a high frequency noise floor ("hiss"). Future board revisions should get a filter.