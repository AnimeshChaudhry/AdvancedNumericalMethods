function[x] = SORMethod(n, A, b, x0, TOL, N, w)

k = 1;

while (k <= N)
    
    
   for i = 1:n
       
       tot = 0;
       for j = 1:i-1
           
          tot = tot + (A(i,j)*x(j)); 
           
       end
       
       tot2 = 0;
       for j = i+1:n
           
           tot2 = tot2 + (A(i,j)*x0(j));
            
       end
       
       x(i) = (1-w)*x0(i) + (w/A(i,i))*(-tot-tot2 + b(i));
       
   end 
       
   if (norm((x-x0)) < TOL)
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