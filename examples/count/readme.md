## GM-STUDY-E1 Example "count"

This Verilog example program is a binary counter, displayed in binary on the ten LED's. The count is shown hexadecimal on 7-Segment digits HEX0/HHEX1. and as 3 digits decimal on HEX3-5. The hex digits can be enabled or disabled by slide switches SW0 and SW1. The counter runs at 1Hz, and the 7-segment decimal points pulse the counter clock. The counter clock is derived from the 10MHz system clock of the evaluation board.

### Usage

```
fm@nuc7vm2204:~/fpga/hardware/gm-study-e1/examples/count$ make all
/home/fm/cc-toolchain-linux/bin/yosys/yosys -ql log/synth.log -p 'read -sv src/count.v src/hexdigit.v; synth_gatemate -top count -vlog net/count_synth.v'
/home/fm/cc-toolchain-linux/bin/p_r/p_r -i net/count_synth.v -o count -ccf ../gm-study-e1.ccf > log/impl.log
/usr/local/bin/openFPGALoader  -b gatemate_evb_jtag count_00.cfg
Jtag frequency : requested 6.00MHz   -> real 6.00MHz
Load SRAM via JTAG: [==================================================] 100.00%
Done
Wait for CFG_DONE DONE
```

### Example

<img src="sim/gm-study-max-count.jpg" width="780px">