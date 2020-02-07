function p = BisectionMethod(f, a, b, Tol, No)
%Done
i = 1;



FA = f(a);

while i <= No
    
    p = a + ((b-a)/2);   
    FP = f(b);
    
    if ((abs(FP) < Tol) || (((b-a)/2) < Tol))
         fprintf('%0.5i\n',p);
         return;
    end
    
    i = i + 1;
    
    if (FA*FP > 0)
       
        a = p;
        FA = FP;
        
        
    else 
        b = p;
        
    end
    
  
end

fprintf('Method failed after No iterations, (No = %i', No);

end