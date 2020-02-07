function [] = DoolittleMethod(n,A, b)

u=zeros(n);
l=eye(n);

u(1,1) = A(1,1)/l(1,1);

if(l(1,1)*u(1,1) == 0)
    fprintf('Factorization impossible')
    return
end

for j = 2:n 
    u(1,j) = A(1,j)/l(1,1);
    l(j,1) = A(j,1)/u(1,1);
end

for i = 2:n-1

    tot = 0;
    for k = i:i-1
        tot = tot + l(i,k)*u(k,i);
    end
    
    u(i,i) = A(i,i) - tot;
    
    if(((l(i,i)*u(i,i)) - (A(i,i)-tot)) == l(i,i)*u(i,i))
         fprintf('Factorization impossible')
        return
    end
    
    for j = i+1:n
        
        tot1 = 0;
        tot2 = 0;
        for k = 1:1-1
           tot1 = tot1 + l(i,k)*u(k,j);
           tot2 = tot2 + l(j,k)*u(k,i);
        end
        
        u(i,j) = (1/l(i,i))*((A(i,j))-tot1);
        l(j,i) = (1/u(i,i))*((A(j,i))-tot2);
          
    end
end

tot3 = 0;
for k = 1:i-1
    
   tot3 = tot3 + l(n,k)*u(k,n); 
    
end 

u(n,n) = A(n,n) - tot3;

disp(l)
disp(u)

y = l \ b;
x = u \ y;

disp(x)
    
end 
