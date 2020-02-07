function [ t,w ] = ModifiedEulerMethod( f, a, b, N, alpha)

h = (b-a)/N;
t(1) = a;
w(1) = alpha;
t = a:h:b;

for i = 2:N+1
     w(i) = w(i-1)+(h/2)* (f(t(i-1),w(i-1)) + f(t(i),w(i-1) + h * f(t(i-1),w(i-1))));
end

end
