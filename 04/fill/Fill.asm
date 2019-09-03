// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/04/Fill.asm

// Runs an infinite loop that listens to the keyboard input.
// When a key is pressed (any key), the program blackens the screen,
// i.e. writes "black" in every pixel;
// the screen should remain fully black as long as the key is pressed.
// When no key is pressed, the program clears the screen, i.e. writes
// "white" in every pixel;
// the screen should remain fully clear as long as no key is pressed.

(INFINITE)
  @24576  // a keyboard input
  D=M
  @BLACK
  D;JGT // a keyboard key is pressed
(WHITE)
  @color
  M=0
  @FILL
  0;JMP
(BLACK)
  @color
  M=-1
(FILL)
  @8192 // 8K = 32 * 256 (screen size)
  D=A
  @count
  M=D
  @SCREEN
  D=A
  @address
  M=D
(LOOP)
  @count
  D=M
  @END
  D;JEQ // goto END if count == 0
  @count
  M=D-1 // count = count - 1
  @color
  D=M
  @address
  A=M
  M=D
  @address
  M=M+1
  @LOOP
  0;JMP
(END)
  @INFINITE
  0;JMP
