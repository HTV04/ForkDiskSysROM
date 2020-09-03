# ForkDiskSysROM

Yes, this project is back. No, it's not going to be finished any time soon.

Huge thanks to jamesathey for his [FreeDiskSysROM](https://github.com/jamesathey/FreeDiskSysROM) project.

ForkDiskSysROM does not currently have the same goal as FreeDiskSysROM, which is completely original code. The goal of this fork right now is to create a working clone of the FDS BIOS using both original code and assembled code from the original FDS BIOS. Therefore, none of the commits made in this fork should be pulled into FreeDiskSysROM at the moment. To quote jamesathey on how to contribute to FreeDiskSysROM, "Do not even look at a disassembly of the original FDS BIOS." Oops. Well, that doesn't apply here (*cough* please help me *cough*)!

However, in the end product ~~that will probably never exist~~, all of the code will be original (or at least modfied/optimized from the FDS BIOS), and no graphics from the original FDS BIOS will be needed whatsoever.

The problem that arises from a goal like this is how far "original" code can go. FDS games were made with the FDS BIOS in mind, not the other way around, so the offsets for some functions may only allow for the original FDS BIOS code. I suppose in this case, exceptions will have to be made. Who am I to talk though? This is far from finished.

Also, I don't know what the hell I am supposed to do about the sound samples. ¯\\\_(ツ)\_/¯

I've currently semi-implemented some of the code related to files for now. I *might* add more functions later, though.

No releases are currently given, because this currently doesn't build a valid ROM. However, you can still try to build it to debug it, if you want. I can't guarantee that it will build, though.

tl;dr This sucks rn, come back later (or try to build it, idc)

# Status

## APIs
### Legend
So this is the way I'm formatting the legend for the status ~~totally not a traffic light~~:
| Symbol | Description |
| - | - |
| :green_circle: | Fully implemented, open-source (probably from FreeDiskSysROM) |
| :yellow_circle: | Implemented, but still mainly uses FDS BIOS code |
| :red_circle: | Partially implemented, may not work |
| :black_circle: | Not implemented |

| Address | Name | Status |
| - | - | - |
| $e149 | Delay131 | :green_circle: |
| $e153 | Delayms | :green_circle: |
| $e161 | DisPFObj | :green_circle: |
| $e16b | EnPFObj | :green_circle: |
| $e171 | DisObj | :green_circle: |
| $e178 | EnObj | :green_circle: |
| $e17e | DisPF | :green_circle: |
| $e185 | EnPF | :green_circle: |
| $e18b | NMI | :green_circle: |
| $e1b2 | VINTWait | :green_circle: |
| $e1c7 | IRQ | :green_circle: |
| $e1f8 | LoadFiles | :red_circle: |
| $e237 | AppendFile | :red_circle: |
| $e239 | WriteFile | :red_circle: |
| $e2b7 | CheckFileCount | :black_circle: |
| $e2bb | AdjustFileCount | :black_circle: |
| $e301 | SetFileCount1 | :black_circle: |
| $e305 | SetFileCount | :black_circle: |
| $e32a | GetDiskInfo | :black_circle: |
| $e3da | AddYtoPtr0A | :black_circle: |
| $e3e7 | GetHardCodedPointers | :black_circle: |
| $e3ea | GetHardCodedPointersWriteProtected | :black_circle: |
| $e445 | CheckDiskHeader | :black_circle: |
| $e484 | GetNumFiles | :black_circle: |
| $e492 | SetNumFiles | :black_circle: |
| $e4a0 | FileMatchTest | :black_circle: |
| $e4da | SkipFiles | :black_circle: |
| $e4f9 | LoadData | :black_circle: |
| $e506 | ReadData | :black_circle: |
| $e5b5 | SaveData | :black_circle: |
| $e64d | WaitForDriveReady | :black_circle: |
| $e685 | StopMotor | :black_circle: |
| $e68f | CheckBlockType | :black_circle: |
| $e6b0 | WriteBlockType | :black_circle: |
| $e6e3 | StartXfer | :black_circle: |
| $e706 | EndOfBlockRead | :black_circle: |
| $e729 | EndOfBlkWrite | :black_circle: |
| $e778 | XferDone | :black_circle: |
| $e794 | Xfer1stByte | :black_circle: |
| $e7a3 | XferByte | :black_circle: |
| $e7bb | VRAMStructWrite | :green_circle: |
| $e844 | FetchDirectPtr | :green_circle: |
| $e86a | WriteVRAMBuffers | :green_circle: |
| $e8b3 | ReadIndividualVRAMBytes | :green_circle: |
| $e8d2 | PrepareVRAMString | :green_circle: |
| $e8e1 | PrepareVRAMStrings | :green_circle: |
| $e94f | GetVRAMBufferByte | :green_circle: |
| $e97d | Pixel2NamConv | :green_circle: |
| $e997 | Nam2PixelConv | :green_circle: |
| $e9b1 | Random | :green_circle: |
| $e9c8 | SpriteDMA | :green_circle: |
| $e9d3 | CounterLogic | :green_circle: |
| $e9eb | ReadPads | :green_circle: |
| $ea1a | ReadDownPads | :green_circle: |
| $ea1f | ReadOrDownPads | :green_circle: |
| $ea36 | ReadDownVerifyPads | :green_circle: |
| $ea4c | ReadOrDownVerifyPads | :green_circle: |
| $ea68 | ReadDownExpPads | :green_circle: |
| $ea84 | VRAMFill | :green_circle: |
| $ead2 | MemFill | :green_circle: |
| $eaea | SetScroll | :green_circle: |
| $eafd | JumpEngine | :green_circle: |
| $eb13 | ReadKeyboard | :black_circle: |
| $ebaf | LoadTileset | :green_circle: |
| $ec22 | unk_EC22 | :black_circle: |
| $ee17 | StartMotor | :black_circle: |

# Initialization

## Building

To build, use [asm6f](https://github.com/freem/asm6f).

```asm6f [-l] freedisksys.asm```

The `-l` flag is very useful for development - it shows the addresses assigned
to each instruction, so you can easily see how much room remains for a given
subroutine.
