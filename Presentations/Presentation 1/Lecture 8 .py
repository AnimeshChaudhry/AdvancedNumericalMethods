#!/usr/bin/env python
# coding: utf-8

# In[1]:


'''
Name: Animesh Chaudhry 

Class: Math 440

Presentation 1

Lecture 7: Approximating Eigenvalues

'''


# In[60]:


'''
Use Python to show that a matrix A nxn is orthogonal
An orthogonal matrix is a square matrix whose columns form an orthonormal set
'''

import numpy as np

def printArray(arr):
    for row in arr:
        for item in row:
            print("{:8.3f}".format(item), end = " ")
        print("")
        
def print_Message(A):
    if (isOrthogonal(A)) : 
        print("The following matrix is Orthogonal: ")
        printArray(A) 
    else : 
        print("The following matrix is NOT Orthogonal: ")
        printArray(A)

def isOrthogonal(a) : 
    
    A = np.array(a)
    
    m = A.shape[0]
    n = A.shape[1]
    
    if (m != n) : 
        return False
      
    trans = [[0 for x in range(n)]  
                for y in range(n)]  
                  
    # Find transpose 
    for i in range(0, n) : 
        for j in range(0, n) : 
            trans[i][j] = a[j][i] 
              
    prod = [[0 for x in range(n)] 
               for y in range(n)]  
                 
    # Find product of a[][]  
    # and its transpose 
    for i in range(0, n) : 
        for j in range(0, n) : 
      
            sum = 0
            for k in range(0, n) : 
          
                # Since we are multiplying  
                # with transpose of itself. 
                # We use 
                sum = sum + (a[i][k] * 
                             a[j][k]) 
      
            prod[i][j] = sum
  
    # Check if product is  
    # identity matrix 
    for i in range(0, n) : 
        for j in range(0, n) : 
  
            if ((i != j and int(prod[i][j]) != 0) or (i == j and int(prod[i][j]) != 1)) : 
                return False
  
    return True


  
# Matrix 
A = [[2/3, 1/3, 2/3], 
    [-2/3, 2/3, 1/3], 
    [-1/3, 2/3, -2/3]] 

print_Message(A)

          
    
    


# In[80]:


'''
Determine if a user given square matrix is orthogonal
'''

def get_Matrix():
    n=int(input("Enter the matrix size "))
    
    #initialise nxn matrix with zeroes
    mat=np.zeros((n,n))
    
    #input each row at a time,with each element separated by a space
    for i in range(n):
        mat[i]=input().split(" ")
    return mat


print_Message(get_Matrix())


# In[173]:


from numpy.linalg import inv
from numpy import linalg as LA
import numpy as np

'''
Use Python to check i and ii for A 

i) Q^-1 = Q^T
ii) ||Q||2 = ||x||2
'''


Q = [[2/3, 1/3, 2/3], 
    [-2/3, 2/3, 1/3], 
    [-1/3, 2/3, -2/3]] 

x = [1, 2, 3]

# if(inv(Q) == np.transpose(Q)):
#     print("HI")

print(np.transpose(Q) == inv(Q))

print(LA.norm(np.dot(Q, np.transpose(x))))

print(LA.norm(np.transpose(x)))


# In[148]:


from numpy.linalg import inv


a = [[4, -3, 0],
    [0, -2, 0],
    [1, 1, -2]]

b = [[1, 3, 0],
    [3, 1, 0],
    [1, 0, -2]]

s = [[1, 1, 0],
    [1, -2, 0],
    [0, 0, 1]]


# while(True):
#     print("\nMatrix A")
#     A = get_Matrix()
    
#     print("\nMatrix B")
#     B = get_Matrix()
    
#     print("\nMatrix S")
#     S = get_Matrix()
    
#     if (A.shape == B.shape == S.shape):
#         break
#     else:
#         print("All matrices must be of the same dimension.")


pf= np.matmul(np.matmul(inv(s), b), s)

if(np.array_equal(a, pf)):
    print("A = (S^-1)BS valid")
else:
    print("Invalid")



# In[174]:


import numpy as np

def check_symmetric(a, rtol=1e-05, atol=1e-08):
    a = np.array(a)
    return np.allclose(a, a.T, rtol=rtol, atol=atol)


def transpose(mat, tr):
    N = np.array(mat).shape[0]
    for i in range(N): 
        for j in range(N): 
            tr[i][j] = mat[j][i] 
    
def isSymmetric(mat): 
    
    N = np.array(mat).shape[0]  
    tr = [ [0 for j in range(len(mat[0])) ] for i in range(len(mat)) ] 
    transpose(mat, tr) 
    for i in range(N): 
        for j in range(N): 
            if (mat[i][j] != tr[i][j]): 
                return False
    return True


def is_pos_def(x):
    if (isSymmetric(x)):
        return np.all(np.linalg.eigvals(x) > 0)
    else:
        return False

p = get_Matrix()
    
is_pos_def(p)


# print(check_symmetric(a))


