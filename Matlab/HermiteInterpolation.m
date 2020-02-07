function [Q] = HermiteInterpolation(x, f, fPrime, n)

for i = 1:n
    z(2*i-1) = x(i);
    z(2*i) = x(i);
    Q(2*i-1,1) = f(i);
    Q(2*i, 1) = f(i);
    Q(2*i, 2) = fPrime(i);
    
    if (i ~= 1)
        Q(2*i-1,1) = (Q(2*i-1,1)-Q(2*i-2,1))/(z(2*i-1)-z(2*i-2));
    end
end

for i = 3:2*n
    for j = 3:i
         Q(i,j) = (Q(i,j-1) - Q(i-1,j-1))/(z(i)-z(i-j+1));
    end
    
    
    fprintf('%d', Q)
end