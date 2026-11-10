%% Initialization
clear; clc; close all;

%% Configuration
folder = 'Lab4Kalman';
file_stat = 'R_d_Stationary.mat';
file_lin = 'R_d_Linear.mat';

%% Prepare Output Directory
plot_folder = fullfile(folder, 'plots');
if ~exist(plot_folder, 'dir')
    mkdir(plot_folder);
end

%% Load and Process Data
% Stationary Data
data_stat = load(fullfile(folder, file_stat));
vars_stat = fieldnames(data_stat);
X_stat = data_stat.(vars_stat{1});

% Variables: 1=time, 2=p, 3=pdot, 4=e, 5=edot, 6=lamdadot
time_stat           = X_stat(1,:);
idx_stat            = time_stat <= 40;
time_stat           = time_stat(idx_stat);
p_stat              = X_stat(2, idx_stat); % Pitch
e_stat              = X_stat(4, idx_stat); % Elevation
lamdadot_stat       = X_stat(6, idx_stat); % Travel Rate

% Linearization Point Data
data_lin = load(fullfile(folder, file_lin));
vars_lin = fieldnames(data_lin);
X_lin = data_lin.(vars_lin{1});

time_lin           = X_lin(1,:);
idx_lin            = time_lin <= 40;
time_lin           = time_lin(idx_lin);
p_lin              = X_lin(2, idx_lin); % Pitch
e_lin              = X_lin(4, idx_lin); % Elevation
lamdadot_lin       = X_lin(6, idx_lin); % Travel Rate

%% Plotting
fig = figure('Name', 'Noise Variance Analysis (R_d)', 'Position', [100, 100, 1000, 800]);

% 1. Pitch (p)
subplot(3, 1, 1);
hold on; grid on;
plot(time_lin, p_lin, 'r-', 'LineWidth', 1.0, 'DisplayName', 'Linearization Point');
plot(time_stat, p_stat, 'b-', 'LineWidth', 1.0, 'DisplayName', 'Stationary');
title('Pitch (Linearization Point vs Stationary)');
ylabel('Pitch [rad]');
xlim([0 40]);
legend('Location', 'best');

% 2. Elevation (e)
subplot(3, 1, 2);
hold on; grid on;
plot(time_lin, e_lin, 'r-', 'LineWidth', 1.0, 'DisplayName', 'Linearization Point');
plot(time_stat, e_stat, 'b-', 'LineWidth', 1.0, 'DisplayName', 'Stationary');
title('Elevation (Linearization Point vs Stationary)');
ylabel('Elevation [rad]');
xlim([0 40]);
legend('Location', 'best');

% 3. Travel Rate (lamda dot)
subplot(3, 1, 3);
hold on; grid on;
plot(time_lin, lamdadot_lin, 'r-', 'LineWidth', 1.0, 'DisplayName', 'Linearization Point');
plot(time_stat, lamdadot_stat, 'b-', 'LineWidth', 1.0, 'DisplayName', 'Stationary');
title('Travel Rate (Linearization Point vs Stationary)');
ylabel('Travel Rate [rad/s]');
xlabel('Time [s]');
xlim([0 40]);
legend('Location', 'best');

%% Save Figure as PDF
pdf_filename = fullfile(plot_folder, 'Kal_R_Stationary_Linearization.pdf');
exportgraphics(fig, pdf_filename, 'ContentType', 'vector');