#!/usr/bin/env python
# coding: utf-8

# In[16]:


'''
Student Name: Animesh Chaudhry 
Class: Math 440

Quiz 1  
Problem 1

10/22/19
'''


import math
import numpy as np

func = lambda x: x**3+ 3*(x**2) - 1


# In[17]:


def bisection(f,a,b,N):
    if f(a)*f(b) >= 0:
        return None
    a_n = a
    b_n = b
    for n in range(1,N+1):
        m_n = (a_n + b_n)/2
        f_m_n = f(m_n)
        if f(a_n)*f_m_n < 0:
            a_n = a_n
            b_n = m_n
        elif f(b_n)*f_m_n < 0:
            a_n = m_n
            b_n = b_n
        elif f_m_n == 0:
            return m_n
        else:
            return None
    return (a_n + b_n)/2

def find_all_roots(a, b):
    vals = []
    for i in np.arange(a, b, 0.1):
        vals.append([i, i+0.1])
    sor_itr = []
    for i in vals:
        #print(bisection(func, i[0], i[1], 25))
        #print(i)
        if bisection(func, i[0], i[1], 25) != None:
            sor_itr.append(bisection(func, i[0], i[1], 25))
    return list(dict.fromkeys(sor_itr))
    

print("All Roots: ",find_all_roots(-5,5))

