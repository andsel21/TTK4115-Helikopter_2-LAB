%% Initialization
clear; clc; close all;

%% Configuration
folder = 'Lab4Kalman';
kf_file = 'KalTest04.mat'; % Optimal Q/Rd Kalman baseline
luen_file = 'IMU09.mat';   % Luenberger baseline 

%% Prepare Output Directory
plot_folder = fullfile(folder, 'plots');
if ~exist(plot_folder, 'dir')
    mkdir(plot_folder);
end

%% Load and Process Kalman Data
data_kf = load(fullfile(folder, kf_file));
vars_kf = fieldnames(data_kf);
X_kf = data_kf.(vars_kf{1});
time_kf = X_kf(1,:);
idx_kf = time_kf <= 30;
time_kf = time_kf(idx_kf);

% True States (Kalman)
X_p_kf    = X_kf(4, idx_kf);
X_pdot_kf = X_kf(5, idx_kf);
X_edot_kf = X_kf(7, idx_kf); % Using elevation rate to match Luenberger

% Estimated States (Kalman)
x_hat_p_kf    = X_kf(9, idx_kf);
x_hat_pdot_kf = X_kf(10, idx_kf);
x_hat_edot_kf = X_kf(12, idx_kf);

% Kalman Errors
err_kf_p    = X_p_kf - x_hat_p_kf;
err_kf_pdot = X_pdot_kf - x_hat_pdot_kf;
err_kf_edot = X_edot_kf - x_hat_edot_kf;

%% Load and Process Luenberger (IMU) Data
data_luen = load(fullfile(folder, luen_file));
vars_luen = fieldnames(data_luen);
X_luen = data_luen.(vars_luen{1});
time_luen = X_luen(1,:);
idx_luen = time_luen <= 30;
time_luen = time_luen(idx_luen);

% True States (Luenberger) - Based on IMU 21xN matrix
X_p_luen    = X_luen(7, idx_luen);  % 7 = Pitch
X_pdot_luen = X_luen(8, idx_luen);  % 8 = Pitch Rate
X_edot_luen = X_luen(10, idx_luen); % 10 = Elevation Rate

% Estimated States (Luenberger) - Based on IMU 21xN matrix
x_luenberger_p    = X_luen(11, idx_luen); % 11 = x_hat Pitch (p)
x_luenberger_pdot = X_luen(12, idx_luen); % 12 = x_hat Pitch Rate (pdot)
x_luenberger_edot = X_luen(13, idx_luen); % 13 = x_hat Elevation Rate (edot)

% Luenberger Errors
err_luen_p    = X_p_luen - x_luenberger_p;
err_luen_pdot = X_pdot_luen - x_luenberger_pdot;
err_luen_edot = X_edot_luen - x_luenberger_edot;

%% Plotting
fig = figure('Name', 'Estimator Comparison (Kalman vs Luenberger)', 'Position', [250, 250, 1000, 800]);

% 1. Pitch Error
subplot(3, 1, 1);
hold on; grid on;
plot(time_kf, err_kf_p, 'b-', 'LineWidth', 1.5, 'DisplayName', 'Kalman Error ($x_p - \hat{x}_p$)');
plot(time_luen, err_luen_p, 'r-', 'LineWidth', 1.5, 'DisplayName', 'Luenberger Error ($x_p - \hat{x}_p$)');
title('Pitch State Estimation Error');
ylabel('Error [rad]');
xlim([0 30]);
legend('Location', 'best', 'Interpreter', 'latex');

% 2. Pitch Rate Error
subplot(3, 1, 2);
hold on; grid on;
plot(time_kf, err_kf_pdot, 'b-', 'LineWidth', 1.5, 'DisplayName', 'Kalman Error ($\dot{x}_p - \hat{\dot{x}}_p$)');
plot(time_luen, err_luen_pdot, 'r-', 'LineWidth', 1.5, 'DisplayName', 'Luenberger Error ($\dot{x}_p - \hat{\dot{x}}_p$)');
title('Pitch Rate State Estimation Error');
ylabel('Error [rad/s]');
xlim([0 30]);
legend('Location', 'best', 'Interpreter', 'latex');

% 3. Elevation Rate Error
subplot(3, 1, 3);
hold on; grid on;
plot(time_kf, err_kf_edot, 'b-', 'LineWidth', 1.5, 'DisplayName', 'Kalman Error ($\dot{x}_e - \hat{\dot{x}}_e$)');
plot(time_luen, err_luen_edot, 'r-', 'LineWidth', 1.5, 'DisplayName', 'Luenberger Error ($\dot{x}_e - \hat{\dot{x}}_e$)');
title('Elevation Rate State Estimation Error');
ylabel('Error [rad/s]');
xlabel('Time [s]');
xlim([0 30]);
legend('Location', 'best', 'Interpreter', 'latex');

%% Save Figure as PDF
pdf_filename = fullfile(plot_folder, 'Kal_vs_Luenberger_Error.pdf');
exportgraphics(fig, pdf_filename, 'ContentType', 'vector');