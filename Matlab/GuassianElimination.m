function [x] = GuassianElimination(n, A)

disp(A);
for i = 1:n-1
    p = A(i,i);
    for k = i:4
        if (p <= abs(A(k,i)))
            p = k;
        end
    end
    
    if (p ~= i)
        A([i p],:) = A([p i],:);
    end

    
    for j = i+1:n
        m(j,i) = A(j,i)/A(i,i);
        A(j,:) = A(j,:) - m(j,i)*A(i,:);
    end
       
    if (A(n,n) == 0)
        disp("No unique solution exists.");
    end
end

 x(n,1) = A(n,n+1)/A(n,n);

for i = n-1:-1:1
sum = 0;
    for  j = i+1:n
        sum = sum + A(i,j)*x(j,1); 
    end
    x(i) = (A(i,n+1) - sum)/A(i,i);
end
