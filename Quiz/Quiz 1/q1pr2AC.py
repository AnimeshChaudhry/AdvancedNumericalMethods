#!/usr/bin/env python
# coding: utf-8

# In[2]:


'''
Student Name: Animesh Chaudhry 
Class: Math 440

Quiz 1  
Problem 2

10/22/19
'''

import numpy as np
from numpy import array, zeros, diag, diagflat, dot
from numpy.core.numeric import (asarray, empty, promote_types,multiply)


# In[4]:


def vander(x, N, increasing):
    '''
    Inputs: 
        
        x: One-dimensional vector 
        N: Can choose how many columns of the matrix you want. 
            None: The full vandermonde matrix will be constructed
        increasing: 
            True: The 1's will be the first column and the matrix columns will be increasing 
            False: Vice Versa
    '''    
        
        
    # Convert the input to an array.
    x = asarray(x)
    
    # Make sure that x is a column vector
    if x.ndim != 1:
        raise ValueError("x must be a one-dimensional vector")
    if N is None:
        N = len(x)

    # Return a new array of given shape and type, without initializing entries.
    v = empty((len(x), N), dtype=promote_types(x.dtype, float))
    
    # If the user does not want an increasing matrix created
    tmp = v[:, ::-1] if not increasing else v

    if N > 0:
        tmp[:, 0] = 1
    if N > 1:
        tmp[:, 1:] = x[:, None]
        multiply.accumulate(tmp[:, 1:], out=tmp[:, 1:], axis=1)

    return v


# In[6]:


'''Obtain Two column vectors (b and the second column of A) from user'''

while(True):
    print("\nEnter the second column for A (entries followed by a space): ")
    a = [float(x) for x in input().split()] 
    print("Enter the b column vector: ")
    b = [float(x) for x in input().split()]
    
    if (len(a) == len(b)):
        break
    else: 
        print("The two column vectors must be the same length! Please Try again.")

A = vander(a, None, True)


# In[7]:


# prints the system
print("System:" )
for i in range(A.shape[0]):
 row = ["{}*x{}" .format(A[i, j], j + 1) for j in range(A.shape[1])]
 print(" + ".join(row), "=", b[i])
print()


# In[8]:


def jacobi(A,b,N=25,x=None):
    """Solves the equation Ax=b via the Jacobi iterative method."""
    # Create an initial guess if needed                                                                                                                                                            
    if x is None:
        x = zeros(len(A[0]))

    # Create a vector of the diagonal elements of A                                                                                                                                                
    # and subtract them from A                                                                                                                                                                     
    D = diag(A)
    R = A - diagflat(D)

    # Iterate for N times                                                                                                                                                                          
    for i in range(N):
        x = (b - dot(R,x)) / D
    return x


# In[9]:


print("Solution:" )
print(jacobi(A, b))

