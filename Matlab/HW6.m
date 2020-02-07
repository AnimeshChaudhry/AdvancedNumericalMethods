%%Animesh Chaudhry
% Math 340
% Homework 6
% April 20, 2018


%% Clear Everything
clc; clear all; close all;

%% Problem 1
f = @(t,y) y*cos(t);
N = [40 80 160 320];
fTrue = @(t) exp(sin(t));

%(a)
%Forward Euler 
[t, w] = ForwardEuler(f, 0, 10, 40, 1);

%Error forward Euler: 
for i = 1:N+1
        y(i) = fTrue(t(i));
        feErrorr(i) = abs(y(i) - w(i));
end
    
% Plotting Forward Euler
 figure (1);
 plot(t,w, '-.b')
 title('Forward Euler') %Forward Euler in blue dotted
 xlabel('t_i')
 ylabel('w_i')
 hold on;
 plot (t, y, '-r'); %Original in red


%% Problem 1(b)
%Backward Euler
[t1,w1] = BackwardEuler(f,0,10,40, 1);

% Error Backward Euler
    for i = 1:N+1
        y1(i) = fTrue(t1(i));
        beError(i) = abs(y1(i) - w1(i));
    end

    
figure (2);
plot(t1,w1,'-.b')%Backward Euler in blue Dotted
xlabel('t_i')
ylabel('w_i')
title('Backwards Euler')%Original in red
hold on;
plot (t1, y1,'-r');


%% Problem 1(c)
%Midpoint Method
[t2,w2] = MidpointMethod(f,0,10,40,1);

    % Midpoint Method Error
    for i = 1:N+1
        y2(i) = fTrue(t2(i));
        mmError(i) = abs(y2(i) - w2(i));
    end
    
figure (3);
plot(t2,w2, '-.b') %Midpoint Method in blue
title('Midpoint Method')
xlabel('t_i')
ylabel('w_i')
hold on;
plot (t2, y2, '-r');


%% Problem 1(d)
[t3,w3] = RungeKutta(f,0,10,40,1);

    for i = 1:N+1
        y3(i) = fTrue(t3(i));
        rkError(i) = abs(y3(i) - w3(i));
    end
    
figure(4);
plot (t3,w3, '-.b')
title('Runge-Kutta')
xlabel('t_i')
ylabel('w_i')
hold on;
plot (t3, y3, '-r')


%%Table 
N_Values = {'40'; '80'; '160'; '320'};
%REPEAT EVERYTHING FOR ALL N VALUES
N = [40 80 160 320];
for i = 1:4
    [t,w] = ForwardEuler(f,0,10,N(i), 1);
    [t1,w1] = BackwardEuler(f,0,10,N(i), 1);
    [t2,w2] = MidpointMethod(f,0,10,N(i),1);
    [t3,w3] = RungeKutta(f,0,10,N(i),1);
    
    for j = 1:N(i)+1
        y(j) = fTrue(t(j));
    end
    fe1Error(i,1) = abs(y(N(i))-w(N(i)));
    be1Error(i,1) = abs(y(N(i))-w1(N(i)));
    mm1Error(i,1) = abs(y(N(i))-w2(N(i)));
    rk1Error(i,1) = abs(y(N(i))-w3(N(i)));
end

T = table(N_Values, fe1Error, be1Error, mm1Error, rk1Error)


%% Problem 2

True = @(t) 2*exp(2*t)-exp(t)+exp(-t);



%% Problem 3

A = [1 1 0 1 2; 
     2 1 -1 1 1;
    -1 2 3 -1 4;
    3 -1 -1 2 -3];
X = GuassianElimination(4, A)