function [ t,w ] = MidpointMethod(f, a, b, N, alpha )

h = 0.01;
t(1) = a;
w(1) = alpha;
t = a:h:b;

for i = 2:N+1
    w(i) = w(i-1)+h*f(t(i-1)+(h/2),w(i-1)+(h/2)*f(t(i-1),w(i-1)));
end


end