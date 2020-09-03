;ForkDiskSysROM

;Fritters away 131 cycles.
API_ENTRYPOINT $e149
Delay131:
  CLC ;1 byte, 2 cycles
  PHA ;1 byte, 3 cycles
  LDA #$E9 ;2 bytes, 2 cycles
  ;Now let's waste some cycles!
  @loop:
    ADC #1 ;2 bytes, 2 cycles
    BCC @loop ;2 bytes, 3 cycles except for last time when it's 2
  PLA ;1 byte, 4 cycles
  RTS ;1 byte, 6 cycles

; Delays roughly Y ms, affects X, Y
; If y == 0, then delay 256 ms
API_ENTRYPOINT $e153
Delayms:
  ;Every cycle is 1/1789.7725 ms. Each iteration of the outer loop spins 1790 cycles to delay 1 ms
  LDX #255 ;2 bytes, 2 cycles
  ;First inner loop burns 1274 cycles
  @inner1:
    DEX ;1 byte, 2 cycles
    BNE @inner1 ;2 bytes, 3 cycles except for the last time when it's 2
  LDX #102 ;2 bytes, 2 cycles
  ;second inner loop burns 509 cycles (ideal would be 507)
  @inner2:
    DEX ;1 byte, 2 cycles
    BNE @inner2 ;2 bytes, 3 cycles except for the last time when it's 2
  DEY ;1 byte, 2 cycles
  BNE Delayms ;2 bytes, 3 cycles except for the last time when it's 2
  RTS ;1 byte, 6 cycles
