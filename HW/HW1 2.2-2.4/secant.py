'''
Student Name: Animesh Chaudhry 
Class: Math 440

Chapter 2 
Section 3 
Problem 3

Use the Secant method to find solutions accurate to within 10 −4 for the following problems:

a) x 3 − 2x 2 − 5 = 0, on [1, 4]
b) x 3 + 3x 2 − 1 = 0, on [−3, −2]
c) x − cos x = 0, on [0, π/2]
d) x − 0.8 − 0.2 sin x = 0, on [0, π/2]
'''


import math

func_a = lambda x: x**3 - 2*(x**2) - 5
func_b = lambda x: x**3 + 3*(x**2) - 1
func_c = lambda x: x - math.cos(x)
func_d = lambda x: x - 0.8 - 0.2*(math.sin(x))


def print_answer(part, a, b, i, sol):
    if i > 0:    # Solution found
        print('Part {}: Secant Method on [{:f}, {:f}] gives root: {:f} using {} iterations'.format(part, a, b, sol, i))
    else:
        print("No Solution found!")
    


def secant(f, a, b, tol):
    f_a = f(a)
    f_b = f(b)
    i = 1
    while abs(f_a) > tol and i < 100:
        try:
            denominator = float(f_b - f_a)/(b - a)
            x = b - float(f_b)/denominator
        except ZeroDivisionError:
            print("Denominator zero for x = ", x)
            sys.exit(1)     # Exit with error
        a = b
        b = x
        f_a = f_b
        f_b = f(b)
        i += 1
    return x, i


'''PART A'''
print_answer('a', 1, 4, secant(func_a, 1, 4, 1.0e-4)[1], secant(func_a, 1, 4, 1.0e-4)[0])

'''PART B'''
print_answer('b', -3, -2, secant(func_b, -3, -2, 1.0e-4)[1], secant(func_b, -3, -2, 1.0e-4)[0])

'''PART C'''
print_answer('c', 0, math.pi/2, secant(func_c, 0, math.pi/2, 1.0e-4)[1], secant(func_c, 0, math.pi/2, 1.0e-4)[0])

'''PART D'''
print_answer('c', 0, math.pi/2, secant(func_d, 0, math.pi/2, 1.0e-4)[1], secant(func_d, 0, math.pi/2, 1.0e-4)[0])

