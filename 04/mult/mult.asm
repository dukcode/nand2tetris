// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/04/Mult.asm

// Multiplies R0 and R1 and stores the result in R2.
// Assumes that R0 >= 0, R1 >= 0, and R0 * R1 < 32768.
// (R0, R1, R2 refer to RAM[0], RAM[1], and RAM[2], respectively.)

// RAM[2] = 0
// n = RAM[1]
// for (int i = 0; i < n; ++i) {
//     RAM[2] += RAM[0];
// }

// RAM[2] = 0
// n = RAM[1]
// i = 0
// 
// LOOP:
//     if i==RAM[1] goto END
//     RAM[2] = RAM[2] + RAM[0]
//     i = i + 1
//     goto LOOP
//
// END:
//     goto END

@R2
M=0 // RAM[2] = 0

@R1
D=M
@n
M=D // i = RAM[1]

@i
M=0 // i = 0

(LOOP)
@n
D=M
@i
D=D-M
@END
D;JEQ // if i==RAM[1] goto END

@R0
D=M
@R2
M=M+D // RAM[2] = RAM[2] + RAM[0]

@i
M=M+1 // i = i + 1;

@LOOP
0;JEQ // goto LOOP

(END)
@END
0;JMP
