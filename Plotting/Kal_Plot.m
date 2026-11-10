%% Init Plotting
% Assumes X matrix size is 30xN double
% 1 = Time
% 2 = Vs
% 3 = Vd
% 4-8 = X (p, pdot, e, edot, lamdadot)
% 9-14 = x_hat (p, pdot, e, edot, lamda, lamdadot)
% 15-20 = p_cov_diag (diagonal elements of P matrix)
% 21 = new_data flag
% 22-30 = Encoder (Input x, Vd, Vs, Travel, Travel Rate, Pitch, Pitch Rate, Elevation, Elevation Rate)

time                = X(1,:);
vs                  = X(2,:);
vd                  = X(3,:);

% True States
X_p                 = X(4,:);
X_pdot              = X(5,:);
X_e                 = X(6,:);
X_edot              = X(7,:);
X_lamdadot          = X(8,:);

% Estimated States
x_hat_p             = X(9,:);
x_hat_pdot          = X(10,:);
x_hat_e             = X(11,:);
x_hat_edot          = X(12,:);
x_hat_lamda         = X(13,:);
x_hat_lamdadot      = X(14,:);

% Covariance Diagonal
p_cov_diag          = X(15:20,:);

new_data            = X(21,:);

% Encoder Data
enc_input           = X(22,:);
enc_vd              = X(23,:);
enc_vs              = X(24,:);
enc_travel          = X(25,:);
enc_travelRate      = X(26,:);
enc_pitch           = X(27,:);
enc_pitchRate       = X(28,:);
enc_elevation       = X(29,:);
enc_elevationRate   = X(30,:);

% Filter variables by time
idx = time <= 50;
time                = time(idx);
vs                  = vs(idx);
vd                  = vd(idx);

X_p                 = X_p(idx);
X_pdot              = X_pdot(idx);
X_e                 = X_e(idx);
X_edot              = X_edot(idx);
X_lamdadot          = X_lamdadot(idx);

x_hat_p             = x_hat_p(idx);
x_hat_pdot          = x_hat_pdot(idx);
x_hat_e             = x_hat_e(idx);
x_hat_edot          = x_hat_edot(idx);
x_hat_lamda         = x_hat_lamda(idx);
x_hat_lamdadot      = x_hat_lamdadot(idx);

p_cov_diag          = p_cov_diag(:, idx);

new_data            = new_data(idx);

enc_input           = enc_input(idx);
enc_vd              = enc_vd(idx);
enc_vs              = enc_vs(idx);
enc_travel          = enc_travel(idx);
enc_travelRate      = enc_travelRate(idx);
enc_pitch           = enc_pitch(idx);
enc_pitchRate       = enc_pitchRate(idx);
enc_elevation       = enc_elevation(idx);
enc_elevationRate   = enc_elevationRate(idx);