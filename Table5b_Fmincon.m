function y = Table5b_Fmincon(X, caplet_vol, swaption_vol, discount)
    
    obj_fun = sqrt(sum(sum((Table5_Func(X,caplet_vol, discount)-swaption_vol).^2))/55);
    y = obj_fun;
    
end
