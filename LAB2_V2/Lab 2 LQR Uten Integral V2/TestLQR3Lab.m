clc

% For å avgjøre hva som er en bra respons ser vi på %OS og setling
% time med 90% av verdien. Steady state error

%% NB: HUSK Å TA -15 sec på alle ST since step only starts at 15 sec.

%% LQR301
% Tregt system og mye overshoot og dårlig SS error på P. E er sjappere, men
% har fortsatt mye OS og mye ossilasjon.

PeakE = 0.061;
SsE = 0.000552;



StE1 = 17.6 % IKKE BRUK
OSE1 = (PeakE-SsE)/SsE * 100

Q_LQR = [1 0 0; 
         0 1 0;
         0 0 1];
R_LQR = [1 0;
         0 1];

%% LQR302

PeakE = 0.061;
SsE = 0.048;



StE2 = 28.3
OSE2 = (PeakE-SsE)/SsE * 100

Q_LQR = [1 0 0; 
         0 1 0;
         0 0 10];
R_LQR = [1 0;
         0 1];
     
%% LQR303

PeakE = 0.061;
SsE = 0.048;



StE2 = 28.3
OSE2 = (PeakE-SsE)/SsE * 100

Q_LQR = [1 0 0; 
         0 1 0;
         0 0 1];
R_LQR = [0.1 0;
         0 1];
     
%% LQR304

% Test av elevation step med god Q or R

Q_LQR = [200 0 0; 
         0 1 0;
         0 0 800];
R_LQR = [5 0;
         0 2];
     
%% LQR305
% Hypotese: Raskere ST på E når vi senker Vs og vi får ingen ossilasjon i SS.
% I tillegg større peak i E. P blir saktere.

PeakP = 0.478;
SsP = 0.380;
StP2 = 48.0
OSP2 = (PeakP-SsP)/SsP * 100

Q_LQR = [200 0 0; 
         0 1 0;
         0 0 800];
R_LQR = [5 0;
         0 2];
     
%% LQR06
% Hypotese: Raskere ST på E når vi senker Vs og vi får ingen ossilasjon i SS.
% I tillegg større peak i E. P blir saktere.

PeakP = 0.462;
SsP = 0.217;



StP2 = 42.6
OSP2 = (PeakP-SsP)/SsP * 100
StE2 = 117.0
OSE2 = (PeakE-SsE)/SsE * 100

Q_LQR = [1 0 0; 
         0 1 0;
         0 0 1];
R_LQR = [1 0;
         0 0.1];