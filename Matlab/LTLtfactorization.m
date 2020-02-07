function[] = LTLtfactorization(n, A, b)

for i = 1:n
    
    l(i,i) = 1;
    
  for j = 1:(i-1)
      
     v(j) = l(i,j)*d(j); 
      
  end
  
  tot = 0;
  for j = 1:i-1
      
     tot = tot + (l(i,j)*v(j)); 
      
  end
  
  d(i) = A(i,i) - tot;
  
 
  for j = i+1:n
      
     tot2 = 0;
     for k = 1:i-1
  
        tot2 = tot2 + ((l(j,k)*v(k))); 
         
     end
     
     l(j,i) = (A(j,i) - tot2)/(d(i));
      
  end
    
end

disp(l)
disp(d)

y(1) = b(1);

for i = 2:n
    
    tot3 = 0;
    for j = 1: i-1
        
       tot3 = tot3 + l(i,j)*y(j); 
        
    end
    
    y(i) = b(i) - tot3;
    
end
    
    for i = 1:n
        
       z(i) = y(i)/d(i); 
        
    end
    
    x(n) = z(n);
    
    for i = n-1:1
        
       tot4 = 0'
       for j = i+1:n
           
          tot4 = tot4 + l(j,i)*x(j); 
           
       end
       
       x(i) = z(i) - tot4;
        
    end
    
    disp(x)

end 


