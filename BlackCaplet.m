function y = BlackCaplet(this_caplet,vol)
    
    tau = this_caplet(3);
    ti_1 = this_caplet(1);
    Pti_1 = this_caplet(4);
    Pti = this_caplet(5);
    X = this_caplet(6)/100;
    F = ((Pti_1/Pti)-1)/tau;
    v = vol*sqrt(ti_1);
    d1 = (log(F/X) + (v*v/2))/v;
    d2 = (log(F/X) - (v*v/2))/v;
    Nd1 = normcdf(d1);
    Nd2 = normcdf(d2);
    caplet = tau*Pti*(F*Nd1 - X*Nd2);
    
    y = caplet;
    
end

