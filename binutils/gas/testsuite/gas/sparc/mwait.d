#as: -Av9m
#objdump: -dr
#name: sparc OSA2015 %mwait asr and MWAIT instruction

.*: +file format .*sparc.*

Disassembly of section .text:

0+ <.text>:
   0:	83 47 00 00 	rd  %mwait, %g1
   4:	b9 80 a0 03 	wr  %g2, 3, %mwait
   8:	b9 80 00 01 	mwait  %g1
   c:	b9 80 20 03 	mwait  3
