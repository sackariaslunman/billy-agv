
% Circuit Equation
% Va = i*R + L*di/dt + KePhi*w
% Tm = KePhi*i = TL + J*dw/dt + B*w

% Linear regression:
% Y = [[ Va - KePhi*w]
%      [ KePhi*i - TL ]]
%
% X = [[ i, di/dt, 0, 0]
%      [ 0, 0, dw/dt, w]]  
%
% Theta = [ R, L, J, B ]

T = readtable("dcmotor_simdata.xls");
disp(T)