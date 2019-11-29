%% Plot vol surface for table 5
[xxx,yyy] = meshgrid(1:1:10);
z1 = u1;
z2 = swaption_vol_5;
surf(xxx,yyy,z1)
hold on;
surf(xxx,yyy,z2)  