Ra = 0.11;
Ke = 0.022;
Jm = 8.7e-5;
Bm = 8.7e-5;

TL_max = 0.2;
W_max = 10;
Va_max = 12;
Ia_max = 10;

Kg = Ke / (Ra * Bm + Ke^2);
Tg = (Ra * Jm) / (Ra * Bm + Ke^2);

N_torque = 50;
N_speed = 1 / N_torque;

Phi_m = 50 * (pi / 180);
W_G150 = sqrt(3) / Tg;
Wc = 0.6 * W_G150;
zeta = 1;
beta = 10;

tau = 0.5 / Wc;

G_abs = Kg / (Wc * sqrt(1 + (Tg*Wc)^2));
K_inf = Wc * tau * beta * sqrt(1 + (Wc*tau/beta)^2) / (G_abs * sqrt((1 - (Wc*tau)^2)^2 ) + (2*zeta*Wc*tau)^2);

Ki = K_inf / (tau * beta);
Tf = tau / beta;
Ti = 2*zeta*tau - Tf;
Td = (tau^2)/Ti - Tf;
Kp = Ki * Ti;

% syms s K z t b
% F_pid = K * (1 + 2*z*s*t + (s*t)^2) / (s * (1 + s*t/b));
% F_pid_inf = K*t*b;
% Fs_pid = simplify(1 - F_pid_inf / F_pid);
% disp(Fs_pid)