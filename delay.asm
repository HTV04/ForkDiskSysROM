;Fritters away 131 cycles.
API_ENTRYPOINT $e149
Delay131:
	CLC
	PHA
	LDA #$E9
	;Now let's waste some cycles!
	@loop:
		ADC #1
		BCC @loop
	PLA
	RTS

; Delays roughly Y ms, affects X, Y
; If y == 0, then delay 256 ms
API_ENTRYPOINT $e153
Delayms:
	;Every cycle is 1/1789.7725 ms. Each iteration of the outer loop spins 1790 cycles to delay 1 ms
	LDX #255
	;First inner loop burns 1274 cycles
	@inner1:
		DEX
		BNE @inner1
	LDX #102
	;second inner loop burns 509 cycles (ideal would be 507)
	@inner2:
		DEX
		BNE @inner2
	DEY
	BNE Delayms
	RTS
