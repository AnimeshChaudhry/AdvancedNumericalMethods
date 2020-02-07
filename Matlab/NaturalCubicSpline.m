function [ output ] = NaturalCubicSpline(x, y, n )

for i = 1:n-1
    h(i) = x(i+1) - x(i); 
end

for i = 2:n-1
    alpha(i) = (3/h(i))*(y(i+1)-y(i)) - (3/h(i-1))*(y(i)-y(i-1));
end

l(1) = 1;
u(1) = 0;
z(1) = 0;

for i = 2:n-1
    l(i) = 2*(x(i+1)-x(i-1))-h(i-1)*u(i-1);
    u(i) = h(i)/l(i);
    z(i) = (alpha(i) - h(i-1)*z(i-1))/l(i);
end

l(n) = 1;
z(n) = 0;
c(n) = 0;

j = n-1;

while (j > 0)
    c(j) = z(j) - u(j)*c(j+1);
    b(j) = ((y(j+1)-y(j))/h(j))-h(j)*((c(j+1)+2*c(j))/3);
    d(j) = (c(j+1)-c(j))/(3*h(j));
    j = j -1;
end

output = {y, b, c, d};

end