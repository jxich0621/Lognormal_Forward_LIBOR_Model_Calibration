function [y,fval] = Formula6_Fmincon(caplet_vol)
    
    
    x0 = ones(4,1)*0.01;
    obj_fun = @(x) (sum((Formula6(x(1),x(2),x(3),x(4))-caplet_vol).^2));
    lb = ones(4,1)*(-20);
    ub = ones(4,1)*10;
    [y,fval] = fmincon(obj_fun,x0,[],[],[],[],lb,ub);

end
