'''
Student Name: Animesh Chaudhry 
Class: Math 440

Chapter 2 
Section 4 
Problem 3

Use the Newton method to find solutions accurate to within 10 −4 for the following problems:

a) x 3 − 2x 2 − 5 = 0, on [1, 4]
b) x 3 + 3x 2 − 1 = 0, on [−3, −2]
c) x − cos x = 0, on [0, π/2]
d) x − 0.8 − 0.2 sin x = 0, on [0, π/2]
'''



import math
from sympy import *
# from autograd import grad

func_a = lambda x: x**3 - 2*(x**2) - 5
f_div_a = lambda x: 3*x**2 - 4*x

func_b = lambda x: x**3 + 3*(x**2) - 1
f_div_b = lambda x: 3*x**2 + 6*x

func_c = lambda x: x - math.cos(x)
f_div_c = lambda x: 1 + math.sin(x)

func_d = lambda x: x - 0.8 - 0.2*(math.sin(x))
f_div_d = lambda x: 1 - 0.2*(math.sin(x))

'''Finds Derivative. Cannot use with lambda because of some kind of object callable issue. Temporary hardcoded derivatives :(.
    Will Make this nicer in future. Tried libraries such as autograd and sym, but it did not work
'''
def find_deriv(f): 
    x = Symbol('x')
    yprime = f.diff(x)
    return yprime



def print_answer(part, a, b, i, sol):
    if i > 0:    # Solution found
        print('Part {}: Newton Method on [{:f}, {:f}] gives root: {:f} using {} iterations'.format(part, a, b, sol, i))
    else:
        print("No Solution found!")
    


def Newton(f, dfdx, x, eps):
    f_value = f(x)
    i = 1
    while abs(f_value) > eps and i < 100:
        try:
            x = x - float(f_value)/dfdx(x)
        except ZeroDivisionError:
            print("Derivative zero for x = ", x)
            sys.exit(1)     # Exit with error

        f_value = f(x)
        i += 1
        
    return x, i


'''PART A'''
print_answer('a', 1, 4, Newton(func_a, f_div_a, x=3, eps=1.0e-4)[1], Newton(func_a, f_div_a, x=3, eps=1.0e-4)[0])

'''PART B'''
print_answer('b', -3, -2, Newton(func_b, f_div_b, x=-3, eps=1.0e-4)[1], Newton(func_b, f_div_b, x=-3, eps=1.0e-4)[0])

'''PART C'''
print_answer('c', 0, math.pi/2, Newton(func_c, f_div_c, x=math.pi/2, eps=1.0e-4)[1], Newton(func_c, f_div_c, x=math.pi/2, eps=1.0e-4)[0])

'''PART D'''
print_answer('c', 0, math.pi/2, Newton(func_d, f_div_d, x=math.pi/2, eps=1.0e-4)[1], Newton(func_d, f_div_d, x=math.pi/2, eps=1.0e-4)[0])



