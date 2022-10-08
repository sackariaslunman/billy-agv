Ra = 0.01;
La = 0.1;
Jm = 0.02;
Bm = 0.03;
TL = 0;
Va = 12;
Ke = 0.02;

% Ia = (Va - KePhi*W)/(Ra*(1+s*tau_a))

T = table(out.dcmotor_simdata.time, out.dcmotor_simdata.signals.values);
writetable(T, "./datasets/simulated/dcmotor_simdata.xls");

disp(T)