swaption_vol_5 = swaption_vol;

for i= 1:10
    for j = 1:10
        if i + j > 11 
            swaption_vol_5(i,j) = 0;
        end
    end
end

swaption_vol_5 = swaption_vol_5/100;

fun = @(X) Formula7_Fmincon(X, caplet_vol,swaption_vol_5, discount);
X0 = ones(6,1)*0.5;
lb = [-20,-20,0,0,0,0.001];
ub = [20,20,20,20,0.2,0.1];
options = optimset('LargeScale','off','MaxFunEvals',10000,'MaxIter',500);
[out4,fval4] = fmincon(fun,X0,[],[],[],[],lb,ub,[],options);