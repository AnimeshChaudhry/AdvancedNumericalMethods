%%Animesh Chaudhry
% Math 340
% Homework 7
% May 11, 2018


%% Clear Everything
clc; clear all; close all;

%% Problem 1a
%Doolittle’s method for LU factorization
A = [6 2 1 -1; 1 4 1 0; 1 1 4 -1; -1 0 -1 3]
b = [0; 7; -1; -2]
DoolittleMethod(4,A, b)

%% Problem 1b


%% Problem 1c/d
%LDL^T factorization
b = [1; -1; 2;  -2]
LTLtfactorization(4, A, b)


%% Problem 1e/f
%Cholesky LL^T factorization
b = [3; 1; 2; -1]
CholeskyFactorization(4, A, b)


%% Problem 3c
%JacobiIterative
A = [4 1 -1 1; 1 4 -1 -1; -1 -1 5 1; 1 -1 1 3.5]
b = [2; -1; 0; 1]
JacobiIterative(4, A, b, [0.1 -0.3 0.2  0.1], 10^-5, 5)

%% Problem 3d
%GaussSeidelIterative
GaussSeidelIterative(4, A, b, [0 0 0 0], 10^-5, 11)


%% Problem 3e
%SORMethod

x0 = [0 0 0 0];
%A = [3 1 0; 0 2 -1; 1 0 1];
%b = [5 1 4];
A = [4 1 -1 1; 1 4 -1 -1; -1 -1 5 1; 1 -1 1 3.5]
b = [2 -1 0 1]
SORMethod(4, A, b, x0, 10^-5, 16, 0.9)
SORMethod(4, A, b, x0, 10^-5, 9, 1.1)
SORMethod(4, A, b, x0, 10^-5, 10, 1.2)
SORMethod(4, A, b, x0, 10^-5, 20, 1.5)
SORMethod(4, A, b, x0, 10^-5, 126, 1.9)

%SORMethod(3, A, b, x0, 10^-5, 25, 0.8)
%SORMethod(4, A, b, x0, 10^-5, 9, 1.1)



