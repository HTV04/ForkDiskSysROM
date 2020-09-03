;ForkDiskSysROM

;This file currently uses disassembled code from the FDS bios.
;No idea if this works correctly yet.

API_ENTRYPOINT $e1f8
LoadFiles:
  lda #$00
  sta $000e
  lda #$ff
  jsr $e3e7
  lda $0101
  pha
  lda #$02
  sta $0005
  jsr @chkdisk
  beq $e212
  dec $0005
  bne $e209
  pla
  sta $0101
  ldy $000e
  txa
  rts

@chkdisk
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

AppendFile:
  lda #$ff

WriteFile:
  sta $000e
  lda #$ff
  jsr $e3ea
  lda $0101
  pha
  lda #$03
  sta $0005
  dec $0005
  beq $e265
  jsr $e26b
  bne $e248
  lda #$02
  sta $0005
  jsr $e290
  beq $e265
  dec $0005
  bne $e255
  stx $0005
  jsr $e2ab
  ldx $0005
  pla
  sta $0101
  txa
  rts
