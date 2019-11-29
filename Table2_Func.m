
function y = Table2_Func(Ita)

    out = zeros(10,1);
    
    for i = 1:10
             
        vi2 = 0;
        
        for j = 1:i
            vi2 = vi2 + Ita(i-j+1) * Ita(i-j+1);
        end
       
        out(i) = sqrt(vi2/i);
        
    end

    y = out;
    
end

