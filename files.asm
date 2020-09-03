API_ENTRYPOINT $e1f8

LoadFiles:
;$e1f8-$e219
	lda #$00
	sta $000e
	lda #$ff
	jsr $e3e7
	lda $0101
	pha
	lda #$02
	sta $05
	beq $e212
	dec $0005
	bne $e209
	pla
	sta $0101
	ldy $000e
	txa
	rts

;$e21a-e236
	jsr $e445
	jsr $e484
	lda $0006
	beq $e233
	lda #$03
	jsr $e68f
	jsr $e4a0
	jsr $e4f9
	dec $0006
	bne $e224
	jsr $e778
	rts

;e237
AppendFile:
	lda #$ff

;$e239-$e243
WriteFile:
	sta $000e
	lda #$ff
	jsr $e3ea
	lda $0101
	pha

;$e244-$e24f
	lda #$03
	sta $0005
	dec $0005
	beq $e265
	jsr $e26b
	bne $e248

;$e251-$e25c
	lda #$02
	sta $0005
	jsr $e290
	beq $e265
	dec $0005
	bne $e255

;$e25e-$e263
	stx $05
	jsr $e2ab
	ldx $05

;$e265-$e26a
	pla
	sta $0101
	txa
	rts
