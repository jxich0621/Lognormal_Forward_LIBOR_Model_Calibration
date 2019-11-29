data = readtable('IV 06302011.xlsx');

discount = table2array(data(:,12));
strike = str2double(table2array(data(4:13,3)));
cap_vol = str2double(table2array(data(4:13,4)))/100;
cap_data = cell(10,1);

for i = 1:10
    n = i*4;
    this_cap = zeros(n,6);
    this_cap(:,3) = 0.25;
    this_cap(:,6) = strike(i);
    
    for j = 1:n
        this_cap(j,1) = 0.25*j;
        this_cap(j,2) = 0.25*(j+1);
        this_cap(j,4) = discount(j);
        this_cap(j,5) = discount(j+1);
    end    
    
    cap_data{i} = this_cap;
    
end

swaption_vol = xlsread("IV 06302011", 2);
swaption_vol = swaption_vol(2:11,2:11);

caplet_vol = zeros(10,1);

for i = 1:10
    this_cap = cap_data{i,1};
    cap_price = BlackCap(this_cap,cap_vol(i));
    s = size(this_cap);
    s = s(1);
    sol = 0;
    
    syms x
    for j = 1:s
        this_caplet = this_cap(j,:);
        if (s-j) < 4
            this_caplet_price = BlackCaplet(this_caplet,x);
        else 
            this_caplet_price = BlackCaplet(this_caplet,caplet_vol(ceil(j/4)));
        end
        sol = sol + this_caplet_price;
    end
    x = vpasolve(sol == cap_price);
  
    caplet_vol(i) = x;
    
end