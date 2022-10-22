Ra = 0.11;
Ke = 0.022;
Jm = 8.6e-5;
Bm = 7.9e-5;

TL_max = 0.2;
W_max = 100;
Va_max = 12;
Ia_max = 40;

Kg = Ke / (Ra * Bm + Ke^2);
Tg = (Ra * Jm) / (Ra * Bm + Ke^2);

% Define regulator specifications
W_G150 = sqrt(3) / Tg;
disp(W_G150)

syms tau
Wc = 0.6 * W_G150;
Phi_m = (50 / 180) * pi;
zeta = 1;
beta = 10;

% Define regulator transfer function
K_inf = Wc * tau * beta * sqrt(1 + (Wc*tau / beta)^2) / ((Kg / Wc * sqrt(1 + (Wc * Tg)^2)) * sqrt((1-(Wc*tau)^2)^2 + (2*zeta*Wc*tau)^2));

Ki = round(Ki, 4);
Ti = round(Ti, 4);

disp(Ki)
disp(Ti)