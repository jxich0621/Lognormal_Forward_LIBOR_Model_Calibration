function y = Formula6(a,b,c,d)
    
    output = zeros(10,1);
   
    for i = 1:10
        
        Ti_1 = i;
        fun = @(t) (((a.*(Ti_1-t) + d).*exp(-b.*(Ti_1-t)) + c).^2);
        vi2 = integral(fun,0,Ti_1);
        output(i) = sqrt(vi2/Ti_1);
        
    end
    
    y = output;
    
end

