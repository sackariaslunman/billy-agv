Ra = 0.11;
Ke = 0.022;
Jm = 8.7e-5;
Bm = 8.7e-5;

TL_max = 0.2;
W_max = 10;
Va_max = 12;
Ia_max = 10;

N_speed = 50;
N_torque = 1 / N_speed;

Kg = Ke / (N_speed * (Ra * Bm + Ke^2));
Tg = (Ra * Jm) / (Ra * Bm + Ke^2);

Phi_m = 50 * (pi / 180);
W_G150 = sqrt(3) / Tg;

Wc = 0.6 * W_G150;

tau = 1/Wc;
zeta = 1;
beta = 10;

G_abs = Kg / (Wc * sqrt(1 + (Tg*Wc)^2));
K_inf = Wc * tau * beta * sqrt(1 + (Wc*tau/beta)^2) / (G_abs * sqrt(((1 - (Wc*tau)^2)^2 ) + (2*zeta*Wc*tau)^2) );

Ki = K_inf / (tau * beta);
Tf = tau / beta;
Ti = 2*zeta*tau - Tf;
Td = (tau^2)/Ti - Tf;
Kp = Ki * Ti;
Kd = Kp * Td;

% Kp = 80 / 2;
% Ki = Kp / 4;
% Kd = Ki / 2;
disp(Kp)
disp(Ki)
disp(Kd)