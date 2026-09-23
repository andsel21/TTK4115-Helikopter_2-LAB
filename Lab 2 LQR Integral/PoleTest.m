syms Kpp Kpd wn zeta real

% System parameter

Lp = 0.175;
Kf = 0.2168;
K1 = Lp*Kf;

% Desired poles
lambda1 = -0.322490 +0.446677i;
lambda2 = -0.322490 -0.446677i;

% Calculate gains
Kpd = -(lambda1 + lambda2)/K1;
Kpp = (lambda1 * lambda2)/K1;

fprintf('Kpd = %.4f\n', Kpd);
fprintf('Kpp = %.4f\n', Kpp);