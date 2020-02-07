#!/usr/bin/env python
# coding: utf-8

# In[51]:


"""
Animesh Chaudhry 
QR Method
First step
"""


# In[55]:


import numpy as np
import math

A = np.array([[3, 1, 0],[1, 3, 1],[0, 1, 3]])

def QR(A):
    
    # Find the rotation Matrix P_2
    P_2 = np.zeros((3,3))
    c_2 = A[0][0]/math.sqrt(A[0][1]**2 + A[0][0]**2)
    s_2 = A[0][1]/math.sqrt(A[0][1]**2 + A[0][0]**2)
    
    P_2[0][0] = c_2
    P_2[0][1] = s_2
    P_2[1][0] = -s_2
    P_2[1][1] = c_2
    P_2[2][2] = 1
    
    
    # has a zero in the (2, 1) position
    A_2 = np.matmul(P_2,A)
    
    P_3 = np.zeros((3,3))
    c_3 = A_2[1][1]/math.sqrt(A_2[1][1]**2 + A_2[2][1]**2)
    s_3 = A_2[2][1]/math.sqrt(A_2[1][1]**2 + A_2[2][1]**2)
    
    P_3[0][0] = 1
    P_3[1][1] = c_3
    P_3[1][2] = s_3
    P_3[2][1] = -s_3
    P_3[2][2] = c_3
    
    R_1 = np.matmul(P_3,A_2)
    
    Q_1 = np.matmul(np.transpose(P_2), np.transpose(P_3))
    
    A2 = np.matmul(np.round(R_1,5), np.round(Q_1,5))
    
        
    
    print(A2)    
    
QR(A)

