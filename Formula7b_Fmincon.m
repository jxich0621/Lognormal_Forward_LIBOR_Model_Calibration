function y = Formula7b_Fmincon(X, caplet_vol, swaption_vol, discount)
    
    obj_fun = sqrt(sum(sum((Formula7(X(1),X(2),X(3),X(4),X(5),X(6),caplet_vol, discount)-swaption_vol).^2))/55);
    y = obj_fun;
    
end