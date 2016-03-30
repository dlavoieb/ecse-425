# MIPS 5 Stage Pipeline

Author: 

 - Wei-Di Chang
 - David Lavoie-Boutin
 - Muhammad Ali Lashari
 - Sitara Sherrif

VHDL description of a 5-stage mips pipeline implementing early branch resolution, forwarding and hazard detection. This processor was implemented as a project deliverable for ECSE 425, Computer Organisation and Architecture.

## Assembler

The assembler translates a program written in MIPS assembly to its binary format, ready to be executed by our processor. 

### Requirements

The assembler requires Python version 2.7 which can be downloaded [from here](https://www.python.org/downloads)

### Usage

The assembler is executed from the command line, so open a terminal window and navigate to the location of the executable `Assembler.py`. Make sure you have downloaded the file `mips-isa.json` which contains the list of supported mips operations and their structure.

So simply call the executable with the proper arguments

```
Assembler.py -i mips-ias.json -a fib.asm
```

*The `-i` flag specifies the path to the isa description. The `-a` flag specifies the path to the assembly program to assemble.*

The output of the assembler is a file, which will be at the same location as the input assembly file. Its name will be the same as the assembly with the `.bin` suffix added.

## Processor