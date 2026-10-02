Q_LQR = [200 0 0 0 0; 
         0 50 0 0 0;
         0 0 200 0 0;
         0 0 0 50 0;
         0 0 0 0 100];

R_LQR = [5 0;
         0 10];
     
 %% Tester for x
 % Stepfunkjon på 15 sekunds
 % To integral å teste = to verdier
 % 1 er lavest, 10 på var1, så 10 på var2, så med 100, så med 1000
 

     
 
 %% Tester for y
 % Step funksjon ved 10 sec lasts 2 sec
 % 1 er lavest, 10 på var1, så 10 på var2, så med 100, så med 1000
 
 
 %% Test 1 xy
 
 Q_LQR = [200 0 0 0 0; 
          0 1 0 0 0;
          0 0 800 0 0;
          0 0 0 1 0;
          0 0 0 0 1];

R_LQR = [5 0;
         0 2];
     
%% Test 2 xy 10 1
 Q_LQR = [200 0 0 0 0; 
          0 1 0 0 0;
          0 0 800 0 0;
          0 0 0 10 0;
          0 0 0 0 1];

R_LQR = [5 0;
         0 2];
     
%% Test 3xy 1 10

 Q_LQR = [200 0 0 0 0; 
          0 1 0 0 0;
          0 0 800 0 0;
          0 0 0 1 0;
          0 0 0 0 10];

R_LQR = [5 0;
         0 2];

%% Test 4xy 100 1

 Q_LQR = [200 0 0 0 0; 
          0 1 0 0 0;
          0 0 800 0 0;
          0 0 0 100 0;
          0 0 0 0 1];

R_LQR = [5 0;
         0 2];
%% Test 5xy 1 100

 Q_LQR = [200 0 0 0 0; 
          0 1 0 0 0;
          0 0 800 0 0;
          0 0 0 1 0;
          0 0 0 0 100];

R_LQR = [5 0;
         0 2];

%% Test 6xy 1000 1

 Q_LQR = [200 0 0 0 0; 
          0 1 0 0 0;
          0 0 800 0 0;
          0 0 0 1000 0;
          0 0 0 0 1];

R_LQR = [5 0;
         0 2];
     
%% Test 7xy 1 1000
 Q_LQR = [200 0 0 0 0; 
          0 1 0 0 0;
          0 0 800 0 0;
          0 0 0 1 0;
          0 0 0 0 1000];

R_LQR = [5 0;
         0 2];

%% Test 8xy 100 100
 Q_LQR = [200 0 0 0 0; 
          0 1 0 0 0;
          0 0 800 0 0;
          0 0 0 100 0;
          0 0 0 0 100];

R_LQR = [5 0;
         0 2];

%% Test 9xy Optimal!!!
 Q_LQR = [200 0 0 0 0; 
          0 1 0 0 0;
          0 0 800 0 0;
          0 0 0 50 0;
          0 0 0 0 100];

R_LQR = [5 0;
         0 2];
