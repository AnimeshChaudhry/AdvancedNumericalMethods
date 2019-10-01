'''
Student Name: Animesh Chaudhry 
Class: Math 440

Chapter 2 
Section 2 
Problem 3

Use the Bisection method to find solutions accurate to within 10^−2 for x^3 − 7x^2 + 14x − 6 = 0 on
each interval.
a. [0, 1]
b. [1, 3.2]
c. [3.2, 4]
'''

import numpy as np 

def f(x):
    return  x**3 - 7*(x**2) + 14*x - 6

def print_answer(a, b, part):
    print('Bisection Method on [{}, {}] gives root: {}'.format(a, b, part))    

def bisection(a, b, tol):
    fl = a
    fr = b
    
    while(np.abs(fl-fr)>=tol):
        c = (fl+fr)/2
        check = f(fl)*f(c)
        
        if check > tol:
            fl = c
        else:
            if check < tol:
                fr = c
                
    return c

print_answer(0, 1, bisection(0, 1, 1e-2))
print_answer(1, 3.2, bisection(1, 3.2, 1e-2))
print_answer(3.2, 4, bisection(3.2, 4, 1e-2))


