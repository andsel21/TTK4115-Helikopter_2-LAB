%% LQR01
% Kom seg ikke opp, trenger høyere Q elevation 
Q_LQR = [1 0 0; 
         0 1 0;
         0 0 1];
R_LQR = [1 0;
         0 1];

%% LQR02
% Fungerte, var sakte
Q_LQR = [1 0 0; 
         0 1 0;
         0 0 10];
R_LQR = [1 0;
         0 1];
     
%% LQR03
% Sakte, ingen overshoot
Q_LQR = [10 0 0; 
         0 1 0;
         0 0 10];
R_LQR = [1 0;
         0 1];

%% LQR04
% Begynte å occilere
Q_LQR = [100 0 0; 
         0 1 0;
         0 0 10];
R_LQR = [1 0;
         0 1];
     
%% LQR05
% Kraftig Occilering
Q_LQR = [1000 0 0; 
         0 1 0;
         0 0 10];
R_LQR = [1 0;
         0 1];
     
%% LQR06
% Fungerte, var sakte, ca lik LQR02 eller lik (se graf sammen)
Q_LQR = [10 0 0; 
         0 10 0;
         0 0 10];
R_LQR = [1 0;
         0 1];
     
%% LQR07
% Nærme LQR04 med hurtighet, nær ingen occilering, 
% pitch når increased -> Lager raskere system
% pitch_dot når redusert -> Lager raskere system
% Er ikker proposjonalt/invers av hverandre. 
% pitch_dot må endres mer for å få samme effekt?

Q_LQR = [10 0 0; 
         0 0.1 0;
         0 0 10];
     
R_LQR = [1 0;
         0 1];
     
%% LQR08
% Occilering, mer
Q_LQR = [50 0 0; 
         0 1 0;
         0 0 10];
     
R_LQR = [1 0;
         0 1];

%% LQR09
% Bedre enn 50 og 1, LQR08: Like rask, mindre Occilering
Q_LQR = [50 0 0; 
         0 10 0;
         0 0 10];
     
R_LQR = [1 0;
         0 1];

%% LQR10
% Sakte opp, saktere pitch, på grunn av mer kost på elevation
Q_LQR = [10 0 0; 
         0 0.1 0;
         0 0 100];
     
R_LQR = [1 0;
         0 1];

%% LQR11
% Mye elevation ocilation, lavere Q e_dot gir kraftigere/raskere
% elevation gain.
Q_LQR = [10 0 0; 
         0 0.1 0;
         0 0 0.1];
     
R_LQR = [1 0;
         0 1];
%% LQR12
% Teste R1: Blir raskere i elevation ved høy verdi
Q_LQR = [10 0 0; 
         0 0.1 0;
         0 0 10];
     
R_LQR = [10 0;
         0 1];

%% LQR13
% Teste R1: Lavere verdi gir saktere system/elevation
Q_LQR = [10 0 0; 
         0 0.1 0;
         0 0 10];
     
R_LQR = [0.1 0;
         0 1];
%% LQR14
% Teste R2: Høyere verdi gir raskere system/pitch occilerer
Q_LQR = [10 0 0; 
         0 0.1 0;
         0 0 10];
     
R_LQR = [1 0;
         0 10];
     
%% LQR15
% Teste R2: Høyere verdi gir raskere system/pitch, OCCILERER KRAFTIG
Q_LQR = [10 0 0; 
         0 0.1 0;
         0 0 10];
     
R_LQR = [1 0;
         0 100];
     
%% LQR16
% Teste R2: Lavere verdi gir saktere system/pitch, Er nær like god som
% LQR07
Q_LQR = [10 0 0; 
         0 0.1 0;
         0 0 10];
     
R_LQR = [1 0;
         0 0.1];

%% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%     
%% INT01


