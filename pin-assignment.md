## GM-STUDY-MAX Board - Pin Assignment

Components are prefixed with "st" to identify them belonging to the gm-study-max application board. The board's hardware constrains file is available in the examples folder: [gm-study-max.ccf](examples/gm-study-max.ccf)

### 16x LED output "stled" on IO Banks SA, SB

Name      | Location | Direction | Standard | comment
----------|----------|-----------|----------|---------
stled[0]  | IO_SB_A0 | output    | 2.5V     |
stled[1]  | IO_SA_B0 | output    | 2.5V     |
stled[2]  | IO_SA_B1 | output    | 2.5V     |
stled[3]  | IO_SA_B2 | output    | 2.5V     |
stled[4]  | IO_SA_B3 | output    | 2.5V     |
stled[5]  | IO_SA_B4 | output    | 2.5V     |
stled[6]  | IO_SA_B5 | output    | 2.5V     |
stled[7]  | IO_SA_B6 | output    | 2.5V     |
stled[8]  | IO_SA_B7 | output    | 2.5V     |
stled[9]  | IO_SA_B8 | output    | 2.5V     |
stled[10] | IO_SA_A8 | output    | 2.5V     |
stled[11] | IO_SA_A7 | output    | 2.5V     |
stled[12] | IO_SA_A6 | output    | 2.5V     |
stled[13] | IO_SA_A5 | output    | 2.5V     |
stled[14] | IO_SA_A4 | output    | 2.5V     |
stled[15] | IO_SA_A3 | output    | 2.5V     |

### 6x 7-Segment Digits "sthex" on Banks EA, NA, WC

#### Segment 0 on IO Bank EA

Name      | Location | Direction | Standard | comment
----------|----------|-----------|----------|-----------
sthex0[0] | IO_EA_A1 | output    | 2.5V     | hex0 - DP
sthex0[1] | IO_EA_A2 | output    | 2.5V     | hex0 - A
sthex0[2] | IO_EA_A3 | output    | 2.5V     | hex0 - B
sthex0[3] | IO_EA_A4 | output    | 2.5V     | hex0 - C
sthex0[4] | IO_EA_A5 | output    | 2.5V     | hex0 - D
sthex0[5] | IO_EA_A6 | output    | 2.5V     | hex0 - E
sthex0[6] | IO_EA_A7 | output    | 2.5V     | hex0 - F
sthex0[7] | IO_EA_A8 | output    | 2.5V     | hex0 - G

#### Segment 1 on IO Bank EA

Name      | Location | Direction | Standard | comment
----------|----------|-----------|----------|--------
sthex1[0] | IO_EA_B8 | output    | 2.5V     | hex1 - DP
sthex1[1] | IO_EA_B7 | output    | 2.5V     | hex1 - A
sthex1[2] | IO_EA_B6 | output    | 2.5V     | hex1 - B
sthex1[3] | IO_EA_B5 | output    | 2.5V     | hex1 - C
sthex1[4] | IO_EA_B4 | output    | 2.5V     | hex1 - D
sthex1[5] | IO_EA_B3 | output    | 2.5V     | hex1 - E
sthex1[6] | IO_EA_B2 | output    | 2.5V     | hex1 - F
sthex1[7] | IO_EA_B1 | output    | 2.5V     | hex1 - G

#### Segment 2 on IO Bank NA

Name      | Location | Direction | Standard | comment
----------|----------|-----------|----------|--------
sthex2[0] | IO_NA_B1 | output    | 2.5V     | hex2 - DP
sthex2[1] | IO_NA_B2 | output    | 2.5V     | hex2 - A
sthex2[2] | IO_NA_B3 | output    | 2.5V     | hex2 - B
sthex2[3] | IO_NA_B4 | output    | 2.5V     | hex2 - C
sthex2[4] | IO_NA_B5 | output    | 2.5V     | hex2 - D
sthex2[5] | IO_NA_B6 | output    | 2.5V     | hex2 - E
sthex2[6] | IO_NA_B7 | output    | 2.5V     | hex2 - F
sthex2[7] | IO_NA_B8 | output    | 2.5V     | hex2 - G

#### Segment 3 on IO Bank NA

Name      | Location | Direction | Standard | comment
----------|----------|-----------|----------|--------
sthex3[0] | IO_NA_A8 | output    | 2.5V     | hex3 - DP
sthex3[1] | IO_NA_A7 | output    | 2.5V     | hex3 - A
sthex3[2] | IO_NA_A6 | output    | 2.5V     | hex3 - B
sthex3[3] | IO_NA_A5 | output    | 2.5V     | hex3 - C
sthex3[4] | IO_NA_A4 | output    | 2.5V     | hex3 - D
sthex3[5] | IO_NA_A3 | output    | 2.5V     | hex3 - E
sthex3[6] | IO_NA_A2 | output    | 2.5V     | hex3 - F
sthex3[7] | IO_NA_A1 | output    | 2.5V     | hex3 - G

#### Segment 4 on IO Bank WC

Name      | Location | Direction | Standard | comment
----------|----------|-----------|----------|--------
sthex4[0] | IO_WC_B1 | output    | 2.5V     | hex4 - DP
sthex4[1] | IO_WC_B2 | output    | 2.5V     | hex4 - A
sthex4[2] | IO_WC_B3 | output    | 2.5V     | hex4 - B
sthex4[3] | IO_WC_B4 | output    | 2.5V     | hex4 - C
sthex4[4] | IO_WC_B5 | output    | 2.5V     | hex4 - D
sthex4[5] | IO_WC_B6 | output    | 2.5V     | hex4 - E
sthex4[6] | IO_WC_B7 | output    | 2.5V     | hex4 - F
sthex4[7] | IO_WC_B8 | output    | 2.5V     | hex4 - G

#### Segment 5 on IO Bank WC

Name      | Location | Direction | Standard | comment
----------|----------|-----------|----------|--------
sthex5[0] | IO_WC_A8 | output    | 2.5V     | hex5 - DP
sthex5[1] | IO_WC_A7 | output    | 2.5V     | hex5 - A
sthex5[2] | IO_WC_A6 | output    | 2.5V     | hex5 - B
sthex5[3] | IO_WC_A5 | output    | 2.5V     | hex5 - C
sthex5[4] | IO_WC_A4 | output    | 2.5V     | hex5 - D
sthex5[5] | IO_WC_A3 | output    | 2.5V     | hex5 - E
sthex5[6] | IO_WC_A2 | output    | 2.5V     | hex5 - F
sthex5[7] | IO_WC_A1 | output    | 2.5V     | hex5 - G

### 1x Buzzer output "stbuz" on IO Bank SA

Name      | Location | Direction | Standard | comment
----------|----------|-----------|----------|--------
stbuz     | IO_SA_A2 | output    | 2.5V     |

### 1x Audio output "stau_l", "stau_r" on IO Bank WC

Name      | Location | Direction | Standard | comment
----------|----------|-----------|----------|--------
stau_l    | IO_WC_B0 | output    | 2.5V     |
stau_r    | IO_WC_A0 | output    | 2.5V     |

### 16x Slide Switch input "stswi" on IO Bank SB

Name      | Location | Direction | Standard | comment
----------|----------|-----------|----------|--------
stswi[0]  | IO_SB_B0 | input     | 2.5V     |
stswi[1]  | IO_SB_B1 | input     | 2.5V     |
stswi[2]  | IO_SB_B2 | input     | 2.5V     |
stswi[3]  | IO_SB_B3 | input     | 2.5V     |
stswi[4]  | IO_SB_B4 | input     | 2.5V     |
stswi[5]  | IO_SB_B5 | input     | 2.5V     |
stswi[6]  | IO_SB_B6 | input     | 2.5V     |
stswi[7]  | IO_SB_B7 | input     | 2.5V     |
stswi[8]  | IO_SB_B8 | input     | 2.5V     |
stswi[9]  | IO_SB_A7 | input     | 2.5V     |
stswi[10] | IO_SB_A6 | input     | 2.5V     |
stswi[11] | IO_SB_A5 | input     | 2.5V     |
stswi[12] | IO_SB_A4 | input     | 2.5V     |
stswi[13] | IO_SB_A3 | input     | 2.5V     |
stswi[14] | IO_SB_A2 | input     | 2.5V     |
stswi[15] | IO_SB_A1 | input     | 2.5V     |

### 4x Push Buttons "stbtn" on IO Bank SA, EA

Name     | Location | Direction | Standard | comment
---------|----------|-----------|----------|--------
stbtn[0] | IO_SA_A0 | input     | 2.5V     |
stbtn[1] | IO_SA_A1 | input     | 2.5V     |
stbtn[2] | IO_EA_A0 | input     | 2.5V     |
stbtn[3] | IO_EA_B0 | input     | 2.5V     |

### 11-pin connector J1, 2.54mm pitch

- The FPGA signals are boosted up to 3.3V or 5V
- HD44780 character LCD-compatible pinout, e.g. Sunlike SD1602

Name      | Location | Direction | Standard | comment
----------|----------|-----------|----------|---------------
st_d[7]   | IO_NA_A0 | output    | 3.3V/5V  | pin-14, data-7
st_d[6]   | IO_NA_B0 | output    | 3.3V/5V  | pin-13, data-6
st_d[5]   | IO_EB_A8 | output    | 3.3V/5V  | pin-12, data-5
st_d[4]   | IO_EB_A7 | output    | 3.3V/5V  | pin-11, data-4
st_d[3]   | IO_EB_A6 | output    | 3.3V/5V  | pin-10, data-3
st_d[2]   | IO_EB_A5 | output    | 3.3V/5V  | pin-9,  data-2
st_d[1]   | IO_EB_A4 | output    | 3.3V/5V  | pin-8,  data-1
st_d[0]   | IO_EB_A3 | output    | 3.3V/5V  | pin-7,  data-0
st_en     | IO_SB_A2 | output    | 3.3V/5V  | pin-6,  enable
st_rw     | IO_EB_A1 | input     | 3.3V/5V  | pin-5,  read/write
st_rs     | IO_EB_A0 | output    | 3.3V/5V  | pin-4,  register select
