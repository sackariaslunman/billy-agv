    
% Circuit Equation
% Va = i*Ra + L*di/dt + KePhi*w
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
Time_data = T{:,1};
W_data = T{:,2};
Va_data = T{:,4};
Ia_data = T{:,5};

Xy = zeros(4, 1);
XX_T = zeros(4, 4);
 
for k = 2:length(Time_data)
    Va_k = Va_data(k);
    Ia_k = Ia_data(k);
    W_k = W_data(k);

    Ia_prim = (Ia_k - Ia_data(k - 1)) / (Time_data(k) - Time_data(k-1));
    W_prim = (W_data(k) - W_data(k - 1)) / (Time_data(k) - Time_data(k-1));

    Y = transpose([Va_k - KePhi*W_k, KePhi*Ia_k - TL]);
    X = [[Ia_k, Ia_prim, 0, 0]; [0, 0, W_prim, W_k]];

    Xy = Xy + transpose(X) * Y;

    XX_T = XX_T + transpose(X) * X;
end

theta = inv(XX_T) * Xy;
disp(theta)