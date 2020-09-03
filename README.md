# ForkDiskSysROM

Huge thanks to jamesathey for his [FreeDiskSysROM](https://github.com/jamesathey/FreeDiskSysROM) project.

ForkDiskSysROM does not currently have the same goal as FreeDiskSysROM, which is completely original code. The goal of this fork right now is to create a working clone of the FDS BIOS using both original code and assembled code from the original FDS BIOS. In the end product, all of the code will be original (or at least modfied/optimized from the FDS BIOS), and no graphics from the original FDS BIOS will be needed whatsoever.

The problem that arises from a goal like this is how far "original" code can go. FDS games were made with the FDS BIOS in mind, not the other way around, so the offsets for some functions may only allow for the original FDS BIOS code. I suppose in this case, exceptions will have to be made.

Don't expect the way I format the code to be the best, I'm in between a beginner and an intermediate 6502 programmer.

I've currently semi-implemented some of the code related to files for now. I'm planning to add more later, though.

# Status

## APIs
### Legend
| Symbol | Description |
| --- | --- |
| :green_circle: | Fully implemented, open-source |
| :yellow_circle: | Implemented, but still mainly uses FDS BIOS code |
| :red_circle: | Partially implemented, may not work |
| | Not implemented |

| Address | Name | # of Games | Implemented |
| ------- | ---- | ------- | ----------- |
| $e149 | Delay131 | | :green_circle: |
| $e153 | Delayms | | :green_circle: |
| $e161 | DisPFObj | | :green_circle: |
| $e16b | EnPFObj | | :green_circle: |
| $e171 | DisObj | | :green_circle: |
| $e178 | EnObj | | :green_circle: |
| $e17e | DisPF | | :green_circle: |
| $e185 | EnPF | | :green_circle: |
| $e18b | NMI | | :green_circle: |
| $e1b2 | VINTWait | | :green_circle: |
| $e1c7 | IRQ | | :green_circle: |
| $e1f8 | LoadFiles | | :red_circle: |
| $e237 | AppendFile | | :red_circle: |
| $e239 | WriteFile | | :red_circle: |
| $e2b7 | CheckFileCount | | |
| $e2bb | AdjustFileCount | | |
| $e301 | SetFileCount1 | | |
| $e305 | SetFileCount | | |
| $e32a | GetDiskInfo | | |
| $e3da | AddYtoPtr0A | | |
| $e3e7 | GetHardCodedPointers | | |
| $e3ea | GetHardCodedPointersWriteProtected | | |
| $e445 | CheckDiskHeader | | |
| $e484 | GetNumFiles | | |
| $e492 | SetNumFiles | | |
| $e4a0 | FileMatchTest | 0 | |
| $e4da | SkipFiles | 0 | |
| $e4f9 | LoadData | | |
| $e506 | ReadData | | |
| $e5b5 | SaveData | | |
| $e64d | WaitForDriveReady | | |
| $e685 | StopMotor | | |
| $e68f | CheckBlockType | | |
| $e6b0 | WriteBlockType | | |
| $e6e3 | StartXfer | | |
| $e706 | EndOfBlockRead | | |
| $e729 | EndOfBlkWrite | | |
| $e778 | XferDone | | |
| $e794 | Xfer1stByte | | |
| $e7a3 | XferByte | | |
| $e7bb | VRAMStructWrite | | :green_circle: |
| $e844 | FetchDirectPtr | | :green_circle: |
| $e86a | WriteVRAMBuffers | | :green_circle: |
| $e8b3 | ReadIndividualVRAMBytes | | :green_circle: |
| $e8d2 | PrepareVRAMString | | :green_circle: |
| $e8e1 | PrepareVRAMStrings | | :green_circle: |
| $e94f | GetVRAMBufferByte | | :green_circle: |
| $e97d | Pixel2NamConv | | :green_circle: |
| $e997 | Nam2PixelConv | | :green_circle: |
| $e9b1 | Random | | :green_circle: |
| $e9c8 | SpriteDMA | | :green_circle: |
| $e9d3 | CounterLogic | | :green_circle: |
| $e9eb | ReadPads | | :green_circle: |
| $ea1a | ReadDownPads | | :green_circle: |
| $ea1f | ReadOrDownPads | | :green_circle: |
| $ea36 | ReadDownVerifyPads | | :green_circle: |
| $ea4c | ReadOrDownVerifyPads | | :green_circle: |
| $ea68 | ReadDownExpPads | | :green_circle: |
| $ea84 | VRAMFill | | :green_circle: |
| $ead2 | MemFill | | :green_circle: |
| $eaea | SetScroll | | :green_circle: |
| $eafd | JumpEngine | | :green_circle: |
| $eb13 | ReadKeyboard | 0 | |
| $ebaf | LoadTileset | | :green_circle: |
| $ec22 | unk_EC22 | | |
| $ee17 | StartMotor | | |

## Initialization

# Building

To build, use [asm6f](https://github.com/freem/asm6f).

```asm6f [-l] freedisksys.asm```

The `-l` flag is very useful for development - it shows the addresses assigned
to each instruction, so you can easily see how much room remains for a given
subroutine.
