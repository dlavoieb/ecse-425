#!/usr/bin/env python
import sys

def print_letters(message):
    for letter in message:
        
        print 's_input <= {:08b};'.format(ord(letter))
        print 'wait for 1 * clk_period;' 
        print

f = open(sys.argv[1],'r')
for line in f:
    print_letters(line)
