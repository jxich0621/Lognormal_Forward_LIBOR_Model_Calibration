function y = Cascade(swaption_vol,discount)
    
    Sigma = zeros(10,10);
    
    swaption_vol = swaption_vol/100;
    
    rho = zeros(10,10);
    for i = 1:10
        for j = 1:10
            %rho(i,j) = 0.1965+ (1-0.1965)*exp(-0.001*abs(i-j));
            if i == j
                rho(i,j) = 1;
            else
                rho(i,j) = 0.7;
            end
        end   
    end
    
    F = zeros(20,1);
    for i = 1:20
        F(i) = (1/i) * (1/discount(4*i) - 1);
    end
    
    
    for alpha = 0:9
        for beta = (alpha+1):(alpha+10)   
            w = zeros(beta-alpha,1);
            for i = (alpha+1):beta
                numerator = 1;
                for j = (alpha+1) : i
                    numerator = numerator * (1/(1+F(j)));
                end 
                w(i-alpha) = numerator;
            end
            Sum = sum(w);
            w = w/Sum;
            
            S_deno = 0;
            for i = (alpha+1):beta
                S_deno = S_deno + discount(4*i);
            end
                
            if alpha == 0
                S = (1 - discount(4*beta))/S_deno;
            else 
                S = (discount(4*alpha) - discount(4*beta))/S_deno;
            end
            
            
            
          
            swaption = 0;
            if beta <= 10
                syms x
                assume(x > 0)
                for i = (alpha+1):beta
                    for j = (alpha+1) : beta
                        coef = w(i-alpha)*w(j-alpha)*F(i)*F(j)*rho(i,j)/((alpha+1)*S*S);
                        this_vol = 0;
                        for h = 0:alpha
                            sigmai = Sigma(i,h+1);
                            sigmaj = Sigma(j,h+1);
                            
                            if h == alpha
                                if i == beta
                                    sigmai = x;
                                end
                                if j == beta
                                    sigmaj = x;
                                end
                            end
                            
%                             if sigmai == 0
%                                 zhi = 1
%                             end
%                             if sigmaj == 0
%                                 zhang = 1
%                             end

                            this_vol = this_vol + sigmai*sigmaj;
                        end

                        this_vol = this_vol * coef;

                        swaption = swaption + this_vol;
                    end      
                end
                x_sol = vpasolve(swaption == swaption_vol(alpha+1,beta-alpha)*swaption_vol(alpha+1,beta-alpha), x);
                x_sol = max(x_sol);
                Sigma(beta,alpha+1) = x_sol;
            end
        end 
    end
     
    y = Sigma;
end