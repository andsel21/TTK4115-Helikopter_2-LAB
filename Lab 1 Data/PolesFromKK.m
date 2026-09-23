% System parameters
Lp = 0.175;
Kf = 0.2168;

K1 = Lp*Kf;

% Controller gains
Kpd = 17;
Kpp = 8;

% Characteristic polynomial:
% s^2 + K1*Kpd*s + K1*Kpp = 0
poles = roots([1, K1*Kpd, K1*Kpp]);

lambda1 = poles(1);
lambda2 = poles(2);

fprintf('K1      = %.6f\n', K1);
fprintf('Kpd     = %.4f\n', Kpd);
fprintf('Kpp     = %.4f\n', Kpp);
fprintf('lambda1 = %.6f %+.6fi\n', real(lambda1), imag(lambda1));
fprintf('lambda2 = %.6f %+.6fi\n', real(lambda2), imag(lambda2));

%% Testplan
% Real poles:
% Plasser poler i positivt halvplan
% Plasser poler i netativt halvplan
% Plasser i begge
% Forskjellige lov

% Imag Poles:
% Plasser kunn imaginære 

% Begge kompleks:
% Imag og Real
% Positiv og negativ

%% Vår Tester
% Ser hva som blir stabilt /ustabilt ved polplasering
% Tester kpp, kpd verdier
% Gjør om til poler og finn bedre
