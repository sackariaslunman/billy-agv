Ra = 0.5;
La = 0.1;
Jm = 5;
Bm = 0.01;
TL = 20;
Va = 12;
tau_a = La/Ra;
tau_m = Jm/Bm;
Ke = 1.6;

% Ia = (Va - KePhi*W)/(Ra*(1+s*tau_a))

T = table(out.dcmotor_simdata.time, out.dcmotor_simdata.signals.values);
writetable(T, "dcmotor_simdata.xls");

disp(T)