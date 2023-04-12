#!/bin/sh

. ./t/test_cmp.sh

test_cmp '-e-V' './bin/53mstats -e -V < rsrc/test1.asm' \
'1: .text 
2: # This program attempts to have 1 example for each "type"
3: functionF:
4: add $t0, $t1, $t2
6: done:   lb $s0, 0x0 ($s0)
7: syscall
8: jal functionF
Total number of lines: 7'

test_cmp '-e' './bin/53mstats -e < rsrc/test1.asm' \
'Total number of lines: 7'

test_cmp '-c' './bin/53mstats -c < rsrc/test1.asm' \
'Total number of comments: 1'

test_cmp '-c-V' './bin/53mstats -c -V < rsrc/test1.asm' \
'2: # This program attempts to have 1 example for each "type"
Total number of comments: 1'
