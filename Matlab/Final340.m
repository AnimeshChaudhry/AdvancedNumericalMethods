%%
%Animesh Chaudhry
%Math 340 Final Exam 
%May 16, 2018 



%% Problem 1
%
BisectionMethod(@(x) 2^(-x), 0, 1, 10^-5, 17)

%%Problem 2
%SOR
A = [4 -1 0; -1 4 -1; 0 -1 4];
b = [10;4;2];

D = [4 0 0; 0 4 0; 0 0 4];
Di = inv(D);
L = [0 0 0; 1 0 0; 0 1 0];
U = [0 1 0; 0 0 1; 0 0 0];

Tj = Di*(L+U);

p = eig(Tj);
PaSq = 0.3536^2; % Max eigenvalue squared
OptW = 2/(1+sqrt(1-PaSq));

xS = SORMethod(3, A, b, [0 0 0], 1.0e-3, 5, OptW)


%%Problem 3
%Midpoint Method

f = @(t,y) (1/t^(2)) - (y/t) - y^2;
fTrue = @(t) (-(1/t));
[t,w] = MidpointMethod(f,1,2,40,-1);

    % Midpoint Method Error
    N = 40;
    for i = 1:N+1
        y(i) = fTrue(t(i));
        mmError(i) = abs(y(i) - w(i));
    end
    
figure (3);
plot(t,w, '-.b') %Midpoint Method 
title('Midpoint Method, Taylor Order 2')
xlabel('t_i')
ylabel('w_i')
hold on;
plot (t, y, '-r');





