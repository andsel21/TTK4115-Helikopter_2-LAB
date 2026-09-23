% FOR HELICOPTER NR 1-2
% This file contains the initialization for the helicopter assignment in
% the course TTK4115. Run this file before you execute QuaRC_ -> Build 
% to build the file heli_q8.mdl.

% Oppdatert høsten 2006 av Jostein Bakkeheim
% Oppdatert høsten 2008 av Arnfinn Aas Eielsen
% Oppdatert høsten 2009 av Jonathan Ronen
% Updated fall 2010, Dominik Breu
% Updated fall 2013, Mark Haring
% Updated spring 2015, Mark Haring

close all
clear
clc

%%%%%%%%%%% Calibration of the encoder and the hardware for the specific
%%%%%%%%%%% helicopter
Joystick_gain_x = 1;
Joystick_gain_y = -1;


%%%%%%%%%%% Physical constants
g = 9.81; % gravitational constant [m/s^2]
l_c = 0.40; % distance elevation axis to counterweight [m]
l_h = 0.66; % distance elevation axis to helicopter head [m]
l_p = 0.175; % distance pitch axis to motor [m]
m_c = 1.92; % Counterweight mass [kg]
m_p = 0.65; % Motor mass [kg]

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%% Our Code start
% constant_elevation = 0.0;%4.602;
v_s0 = 6.17;

Kf = (g*(-m_c*l_c+2*m_p*l_h))/(l_h*v_s0);


K1 = l_p * Kf;

L3 = l_h * Kf;
J_e = m_c*l_c^2 + 2*m_p*l_h^2;
K2 = L3/J_e;

%% Pole placement
% Desired pole
lambda1 = -0.322490 +0.446677i;
lambda2 = -0.322490 -0.446677i;

% Calculate gains
K_pd = -(lambda1 + lambda2)/K1;
K_pp = (lambda1 * lambda2)/K1;

%% Task 1 LQR
% Init
A = [0 1 0  0 0; 
     0 0 0  0 0;
     0 0 0  0 0;
    -1 0 0  0 0;
     0 0 -1 0 0]; 
B = [ 0 0;
      0 K1;
     K2 0;
      0 0;
      0 0];

G = [0 0
     0 0
     0 0 
     1 0
     0 1];
%% LQR16
% Teste R2: Lavere verdi gir saktere system/pitch
Q_LQR = [10 0 0 0 0; 
         0 0.1 0 0 0;
         0 0 10 0 0;
         0 0 0 1 0;
         0 0 0 0 1];
     
R_LQR = [1 0;
         0 1];

%% Calc K

K = lqr(A, B, Q_LQR, R_LQR, G);

F = [K(1,1) K(1,3);
     K(2,1) K(2,3)];

 