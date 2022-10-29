Ra = 0.11;
Ke = 0.022;
Jm = 8.7e-5;
Bm = 8.7e-5;

TL_max = 0.2;
W_max = 10;
Va_max = 12;
Ia_max = 40;

Kg = Ke / (Ra * Bm + Ke^2);
Tg = (Ra * Jm) / (Ra * Bm + Ke^2);

N_speed = 0.02;
N_torque = 1 / N_speed;