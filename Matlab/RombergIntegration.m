function [R] = RombergIntegration(f, a, b, n)

h = b - a
R(1,1) = (h/2)*(f(a) + f(b));


for i = 2:n 

    sum =0;
    for j = 1:(2^(i-2))
        
        sum = sum + f(a+(j-0.5*h));
        
    end
    
    R(i,1) = (1/2) * (R(i-1,1) + h*sum);
    
    for k = 2:i 
        
       R(i,k) = R(i, k-1) + ((R(i, k-1) - R(i-1, k-1))/(4^(k-1)-1))  
        
    end
    
    h = h/2;
    
end

fprintf('%d', R)

end 