// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/04/Fill.asm

// Runs an infinite loop that listens to the keyboard input.
// When a key is pressed (any key), the program blackens the screen
// by writing 'black' in every pixel;
// the screen should remain fully black as long as the key is pressed. 
// When no key is pressed, the program clears the screen by writing
// 'white' in every pixel;
// the screen should remain fully clear as long as no key is pressed.

// LOOP:
//     i = 0
//     n = 256 * 512 / 16 = 8192
//     if KBD == 0 goto BLACK
//     else goto WHITE
//
//     BLACK:
//         if i == n goto LOOP
//         RAM[SCREEN + i] = -1
//         i = i + 1
//         goto BLACK
//     goto LOOP
//     WHITE:
//         if i == n goto LOOP
//         RAM[SCREEN + i] = -1
//         i = i + 1
//         goto WHITE
//     goto LOOP


(LOOP)
@i
M=0 // i = 0

@8192
D=A
@n
M=D // n = 8192

@KBD
D=M

@BLACK
D;JGT

@WHITE
0;JMP


(BLACK)
@n
D=M
@i
D=D-M
@LOOP
D;JEQ // if i == n goto LOOP

@SCREEN
D=A
@i
A=D+M
M=-1 // RAM[SCREEN + i] = fill

@i
M=M+1 // i = i + 1

@BLACK
0;JMP // goto FILL_SCREEN_LOOP

@LOOP
0;JMP // goto LOOP

(WHITE)
@n
D=M
@i
D=D-M
@LOOP
D;JEQ // if i == n goto LOOP

@SCREEN
D=A
@i
A=D+M
M=0 // RAM[SCREEN + i] = 0

@i
M=M+1 // i = i + 1

@WHITE
0;JMP // goto FILL_SCREEN_LOOP

@LOOP
0;JMP // goto LOOP
