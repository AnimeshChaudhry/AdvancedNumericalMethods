%%Animesh Chaudhry 
%Exam 2
%Math 340 

%% Problem 1(b)

X = CompositeSimpson(@(x) x/((x^2)+9), 0, 3, 15)
% X = 0.3344


%% Problem 2(b)
f = @(t,y) 1 + y/t;
fTrue = @(t) (t*log(t)) + (2*t);

[t2,w2] = MidpointMethod(@(t,y) 1 + y/t,1,9,10,2);

    % Midpoint Method Error
    for i = 1:N+1
        y2(i) = fTrue(t2(i));
        mmError(i) = abs(y2(i) - w2(i));
    end
    
figure (1);
plot(t2,w2, '-.b') %Midpoint Method in blue
title('Midpoint Method')
xlabel('t_i')
ylabel('w_i')
hold on;
plot (t2, y2, '-r')



%% Extra Credit
[t1,w1] = BackwardEuler(f,1,9,10, 2)



