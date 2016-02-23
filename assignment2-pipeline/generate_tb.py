#!/usr/bin/env python

# python script to generate test bench body for testing of the multiplicative pipeline
a = 3
b = 3
c = 3
d = 3
e = 3

op1 = 0
op2 = 0
op3 = 0
op4 = 0
op5 = 0

final = 0
assert_number = 0


def print_step():
    global a, b, c, d, e, op1, op2, op3, op4, op5, final, assert_number

    final = op2 - op5
    op5 = op3 * op4
    op2 = op1 * 42

    op1 = a + b
    op3 = c * d
    op4 = a - e
    print('wait for 1 * clk_period;')

    print 'ASSERT (s_op1 = {0}) REPORT "Error at assert {1}" SEVERITY ERROR;'.format(op1, assert_number)
    assert_number += 1
    print 'ASSERT (s_op2 = {0}) REPORT "Error at assert {1}" SEVERITY ERROR;'.format(op2, assert_number)
    assert_number += 1
    print 'ASSERT (s_op3 = {0}) REPORT "Error at assert {1}" SEVERITY ERROR;'.format(op3, assert_number)
    assert_number += 1
    print 'ASSERT (s_op4 = {0}) REPORT "Error at assert {1}" SEVERITY ERROR;'.format(op4, assert_number)
    assert_number += 1
    print 'ASSERT (s_op5 = {0}) REPORT "Error at assert {1}" SEVERITY ERROR;'.format(op5, assert_number)
    assert_number += 1
    print 'ASSERT (s_final_output = {0}) REPORT "Error at assert {1}" SEVERITY ERROR;'.format(final, assert_number)
    assert_number += 1


def set_values(ia, ib, ic, i_d, ie):
    global a, b, c, d, e
    a = ia
    b = ib
    c = ic
    d = i_d
    e = ie
    print 's_a <= {};'.format(a)
    print 's_b <= {};'.format(b)
    print 's_c <= {};'.format(c)
    print 's_d <= {};'.format(d)
    print 's_e <= {};'.format(e)


print('REPORT "Simple static test";')
set_values(1,2,3,4,5)
print_step()
print_step()
print_step()
print('REPORT "Reseting Pipeline";')
set_values(0,0,0,0,0)
print_step()
print_step()
print_step()

print('REPORT "Test with changing inputs";')
set_values(3,3,3,3,3)
print_step()
set_values(5,5,5,5,5)
print_step()
set_values(3,5,3,5,5)
print_step()
set_values(0,0,0,0,0)
print_step()
print_step()
print_step()
set_values(1,2,3,4,5)
print_step()
set_values(0,0,0,0,0)
print_step()
set_values(1,2,3,4,5)
print_step()
print_step()
print_step()
