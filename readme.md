# PICO200
This is an esoteric programming language designed to be very small.<br>

This repository contains a **204-byte interpreter** for the language written in the boot sector.<br>

The user-written source code is in a different sector (of the `disk.img`), which the program reads and executes

## Instructions
The program gives 32 registers, each having their ascii character ids from `32`-`64` (`<space>`-`@`)

| Syntax        | Description                                             | Example |
|---------------|---------------------------------------------------------|---------|
| I<reg>        | Increments register                                     | I#      |
| D<reg>        | Decrements register                                     | D#      |
| L<reg>        | Adds the instruction pointer value to the register      | L!      |
| J<reg>        | Jumps to the pointer stored in the register             | J!      |
| Z<reg1><reg2> | Jumps to the pointer in the register2 if register1 is 0 | Z*%     |
| E<reg>        | Ends execution if register is 0                         | E*      |
| K             | Ends Execution                                          | K       |
| P<reg>        | Prints the register value as an ASCII char              | P!      |

## Simple Example
This simple Pico200 program prints the alphabet from `A`-`Z`
```p200
I!I!I!I!I!I!I!I!I!I!
I!I!I!I!I!I!I!I!I!I!
I!I!I!I!I!I!I!I!I!I!
I!I!I!I!I!I!I!I!I!I!
I!I!I!I!I!I!I!I!I!I!
I!I!I!I!I!I!I!I!I!I!
I!I!I!I!I!

I*I*I*I*I*I*I*I*I*I*
I*I*I*I*I*I*I*I*I*I*
I*I*I*I*I*

I%I%I%I%I%I%I%I%I%I%I%I%I%I%
L%
L#
P!
I!
Z*%
D*
J#
K
```

## Run
To compile and run PICO200, you need to have **NASM** (for assembly compilation) and **QEMU** (for running the image from a VM)<br>
This repo also contains a simple `compile.sh` file that compiles the assembly to binary, combines the binary and the source code `program.p200` to a single `disk.img` file and runs with QEMU.<br><br>
*Tested with Ubuntu 24.04.1 LTS, NASM version 2.16.01, QEMU emulator version 8.2.2)*