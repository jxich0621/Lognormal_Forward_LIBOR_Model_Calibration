Ita_Solve = zeros(10,1);
tau = 1;


for i = 1:10
    
    syms ita
    vi2 = 0;
    for j = 1:i
        
        if j == 1
            vi2 = vi2 + tau * ita * ita;
        else
            vi2 = vi2 + tau * Ita_Solve(i-j+1)*Ita_Solve(i-j+1);
        end
        
    end
    sol = caplet_vol(i);
    
    ita = vpasolve(vi2/i == sol*sol, ita);
    
    Ita_Solve(i) = ita(2);
    
end

