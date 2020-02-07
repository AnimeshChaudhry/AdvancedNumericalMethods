function[] = CholeskyFactorization(n, A, b)


l(1,1) = sqrt(A(1,1));

for j = 2:n
    
   l(j,1) = A(j,1)/l(1,1);
    
end

for i = 2:n-1
    
   tot = 0;
   for k = 1:i-1
       
      tot = tot + ((l(i,k))^2); 
       
   end
   
   l(i,i) = ((A(i,i) - tot))^(1/2);
   
   for j = i+1:n
   
   tot2 = 0;
   for k = 1:i-1
       
      tot2 = tot2 + (l(j,k)*l(i,k)); 
       
   end
   
   l(j,i) = (A(j,i) - tot2)/l(i,i);
   
   end
    
end

tot3 = 0;
for k = 1:n-1
    
   tot3 = tot3 + ((l(n,k))^2); 
    
end

l(n,n) = ((A(n,n) - tot3))^(1/2);

disp(l)

y(1) = b(1)/l(1,1);

for i = 2:n
    
  tot4 = 0;
  for j = 1:i-1
      
     tot4 = tot4 + l(i,j)*y(j); 
      
  end
  
  y(i) = (b(i) - tot4)/l(i,i);
    
end

x(n) = y(n)/l(n);

for i = n-1:1
    
   tot5 = 0;
   for j = i+1:n
       
      tot5 = tot5 + l(j,i)*x(j); 
       
   end
   
   x(i) = (y(i) - tot5)/l(i,i);
    
end

disp(x)

end