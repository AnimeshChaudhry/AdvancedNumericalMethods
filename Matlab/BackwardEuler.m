function [t,w] = BackwardEuler(f, a, b, N, alpha)

h = (b-a)/N;
w(1) = alpha;
t = a:h:b;

for i = 2:N+1
    w(i) = w(i-1)/(1-h*cos(t(i)));
end

end
