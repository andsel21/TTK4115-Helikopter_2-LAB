clc

% For å avgjøre hva som er en bra respons ser vi på %OS og setling
% time med 90% av verdien. Steady state error

%% NB: HUSK Å TA -15 sec på alle ST since step only starts at 15 sec.

%% LQR201
% Tregt system og mye overshoot og dårlig SS error på P. E er sjappere, men
% har fortsatt mye OS og mye ossilasjon.
PeakP = 0.348;
SsP = -0.036;
PeakE = 0.121;
SsE = 0.041;


StP1 = 93.2
OSP1 = (PeakP-SsP)/SsP * 100
StE1 = 12.8
OSE1 = (PeakE-SsE)/SsE * 100

Q_LQR = [1 0 0; 
         0 1 0;
         0 0 1];
R_LQR = [1 0;
         0 1];

%% LQR202
% Hypotese: Raskere ST, men mer OS
% Den er raskere i P og responsen ser ver vanlig ut (Overshoot og så
% setling). For E ossilerer den litt i SS og setler ikke før step på P.

PeakP = 0.448;
SsP = 0.202;
PeakE = 0.152;
SsE = 0.048;


StP2 = 68.3
OSP2 = (PeakP-SsP)/SsP * 100
StE2 = 28.3
OSE2 = (PeakE-SsE)/SsE * 100

Q_LQR = [10 0 0; 
         0 1 0;
         0 0 1];
R_LQR = [1 0;
         0 1];
     
%% LQR203
% Hypotese: Raskere P når vi senker P_dot, men den vil reagere saktere en
% når vi økte P i LQR202. Det blir også mindre ossilasjon på E i SS.

% Generelt raskere enn test 201 i P, men det var noe variasjon not slutten i SS
% som gjorde at ST ble mye større. E hadde mye OS.

PeakP = 0.364;
SsP = 0.159;
PeakE = 0.161;
SsE = 0.039;


StP2 = 105.6
OSP2 = (PeakP-SsP)/SsP * 100
StE2 = 27.0
OSE2 = (PeakE-SsE)/SsE * 100

Q_LQR = [1 0 0; 
         0 0.1 0;
         0 0 1];
R_LQR = [1 0;
         0 1];
%% LQR204
% Hypotese: Raskere ST på E når vi senker E_dot og vi får ingen ossilasjon i SS.
% I tillegg større peak i E. P blir saktere.

% Effekten av å senke E_Dot er at Stigningstiden blir korterre, men systemet får mer
% OS og systemet får mindre Zeta (Damping).

PeakP = 0.346;
SsP = 0.211;
PeakE = 0.190;
SsE = 0.027;


StP2 = 61.5
OSP2 = (PeakP-SsP)/SsP * 100
StE2 = 117.0
OSE2 = (PeakE-SsE)/SsE * 100

Q_LQR = [1 0 0; 
         0 1 0;
         0 0 0.1];
R_LQR = [1 0;
         0 1];
     
%% LQR05
% Hypotese: Raskere ST på E når vi senker Vs og vi får ingen ossilasjon i SS.
% I tillegg større peak i E. P blir saktere.

PeakP = 0.333;
SsP = 0.101;



StP2 = 88.3
OSP2 = (PeakP-SsP)/SsP * 100
StE2 = 117.0
OSE2 = (PeakE-SsE)/SsE * 100

Q_LQR = [1 0 0; 
         0 1 0;
         0 0 1];
R_LQR = [0.1 0;
         0 1];
     
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