#!/usr/bin/env python
# coding: utf-8

# In[84]:


'''
Student Name: Animesh Chaudhry 
Class: Math 440

Quiz 1  
Problem 3

10/22/19
'''

import numpy as np
import random
import decimal

def sor(m, w=1.0299999999999996, x0=None, eps=1e-5, max_itr=100):
  """
  m  : coefficient matrix
  w  : omega
  x0 : initial vector
  eps: tolerance
  max_iter: max iterations 
  
  Returns 
      solution to the system of linear equation
  """
  n  = len(m)
  x0 = [0] * n if x0 == None else x0
  x1 = x0[:]
  itr = 0
  for __ in range(max_itr):
    for i in range(n):
      s = sum(-m[i][j] * x1[j] for j in range(n) if i != j)
      x1[i] = w*(m[i][n]+s)/m[i][i] + (1-w)*x0[i]
    itr+=1
    if all(abs(x1[i]-x0[i]) < eps for i in range(n)):
      return x1, itr
    x0 = x1[:]
  #raise ValueError('Solution does not converge')
  
  return [], 101

def find_optimal_omega():
    '''
    Tries random omega values between 0 and 2
    '''
    omega_vals = []
    for i in np.arange(0.1, 2, 0.01):
        omega_vals.append(i)
    sor_itr = {}
    for i in omega_vals:
        sor_itr[sor(m, i)[1]] = i
    return min(sor_itr), sor_itr[min(sor_itr)]




if __name__ == '__main__':

  m = [[4,1,1,0,1, 6], [-1,-3,1,1,0, 6], [2,1,5,-1, -1, 6], [-1,-1,-1,4,0,6],[0,2,-1,1,4,6]]

  print("Solution:", sor(m))
  print("\nOptimal Omega value is {1} with {0} iterations.".format(find_optimal_omega()[0], find_optimal_omega()[1])) 

