clear all; clc; close all

v_s0 = 6.17;
g = 9.81; % gravitational constant [m/s^2]
l_c = 0.40; % distance elevation axis to counterweight [m]
l_h = 0.66; % distance elevation axis to helicopter head [m]
l_p = 0.175; % distance pitch axis to motor [m]
m_c = 1.92; % Counterweight mass [kg]
m_p = 0.65; % Motor mass [kg]

Kf = (g*(-m_c*l_c+2*m_p*l_h))/(l_h*v_s0);
K1 = l_p * Kf;
L3 = l_h * Kf;
J_e = m_c*l_c^2 + 2*m_p*l_h^2;
K2 = L3/J_e;
J_lamda = m_c*l_c^2 + 2*m_p*(l_h^2+l_p^2);
L4 = g * Kf * (l_c * m_c - 2 * l_h * m_p);
K3 = L4/J_lamda*v_s0;


% Her starter det nye (Discretization)

T = 0.002;

A = [0, 1, 0, 0, 0, 0;
     0, 0, 0, 0, 0, 0;
     0, 0, 0, 1, 0, 0;
     0, 0, 0, 0, 0, 0;
     0, 0, 0, 0, 0, 1;
     K3, 0, 0, 0, 0, 0];

B = [0, 0;
     0, K1;
     0, 0;
     K2, 0;
     0, 0;
     0, 0];

C = [1, 0, 0, 0, 0, 0;
     0, 1, 0, 0, 0, 0;
     0, 0, 1, 0, 0, 0;
     0, 0, 0, 1, 0, 0;
     0, 0, 0, 0, 0, 1];

D = zeros(size(C, 1), size(B, 2));

% Exact ZOH discretization using c2d
sys_c = ss(A, B, C, D);
sys_d = c2d(sys_c, T, 'zoh');
[Ad, Bd, Cd, ~] = ssdata(sys_d)