function [y,fval] = Table2_Fmincon(caplet_vol)
    
    Ita0 = ones(10,1)*0.5;
    obj_fun = @(Ita) sqrt(sum((Table2_Func(Ita)-caplet_vol).^2)/10);
    lb = zeros(10,1);
    ub = ones(10,1);
    options = optimset('LargeScale','off','MaxFunEvals',10000,'Maxiter',500);
    [y,fval] = fmincon(obj_fun,Ita0,[],[],[],[],lb,ub,[],options);

end

