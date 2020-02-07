function[x] = JacobiIterative(n, A, b, x0, TOL, N)

k = 1;

while (k <= N)
   
    for i =1:n
        
        tot = 0;
        for j = 1:n
            
           if j == i
               
              break; 
               
           end
           
           tot = tot + (A(i,j)*x0(j) + b(i));
            
        end
        
        x(i) = ((1/A(i,i)) * (tot*-1));
        
    end
    
   if (norm(x-x0) < TOL)
        
       disp(x) 
       return
        
    end
    
    k = k + 1;
    
    for i = 1:n
        
       x0(i) = x(i); 
        
    end
    
end

fprintf('Maximum number of iterations exceeded')
return

end 