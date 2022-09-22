Ra = 1;
La = 0.2;
J = 8;
B = 0.03;
TL = 0;
Va = 12;
tau_a = La/Ra;
tau_m = J/B;
KePhi = 1.6;

% Ia = (Va - KePhi*W)/(Ra*(1+s*tau_a))

T = table(out.dcmotor_simdata.time, out.dcmotor_simdata.signals.values);
writetable(T, "dcmotor_simdata.xls");

disp(T)