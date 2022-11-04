Ra = 0.11;
Ke = 0.022;
Jm = 8.7e-5;
Bm = 8.7e-5;

TL_max = 0.2;
W_max = 10;
Va_max = 12;
Ia_max = 20;

Kg = Ke / (Ra * Bm + Ke^2);
Tg = (Ra * Jm) / (Ra * Bm + Ke^2);

N_torque = 50;
N_speed = 1 / N_torque;

s = tf("s");
G = N_speed * Kg / (s * (1 + Tg * s));

Ts = 0.001;
Gd = c2d(G, Ts);
[Fd_pid, info] = pidtune(Gd, "PIDF");
Td_pid = feedback(Fd_pid * Gd, 1);