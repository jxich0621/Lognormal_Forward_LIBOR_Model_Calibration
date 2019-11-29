function y = BlackCap(this_cap,vol)
    a = size(this_cap);
    h = a(1);
    cap = 0;
    
    for j = 1:h
        
        tau = this_cap(j,3);
        ti_1 = this_cap(j,1);
        Pti_1 = this_cap(j,4);
        Pti = this_cap(j,5);
        X = this_cap(j,6)/100;
        F = ((Pti_1/Pti)-1)/tau;
        v = vol*sqrt(ti_1);
        d1 = (log(F/X) + (v*v/2))/v;
        d2 = (log(F/X) - (v*v/2))/v;
        Nd1 = normcdf(d1);
        Nd2 = normcdf(d2);
        caplet = tau*Pti*(F*Nd1 - X*Nd2);
        cap = cap + caplet;
    end
    
    y = cap;
end
