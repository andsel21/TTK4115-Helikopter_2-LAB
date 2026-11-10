%% Initialization
clear; clc; close all;

%% Configuration
folder = 'Lab4Kalman';
num_tests = 8; % Loop through KalTest01 to KalTest08

%% Prepare Output Directory
plot_folder = fullfile(folder, 'plots');
if ~exist(plot_folder, 'dir')
    mkdir(plot_folder);
end

%% Load Data and Plot
for i = 1:num_tests
    % Generate filename dynamically
    filename = sprintf('KalTest%02d.mat', i);
    test_name = filename(1:end-4);
    
    %% Load and Process Data
    data = load(fullfile(folder, filename));
    vars = fieldnames(data);
    X = data.(vars{1});
    
    % Extract time and apply 30-second limit
    time = X(1,:);
    idx = time <= 30;
    time = time(idx);
    
    % Pitch Variables
    X_p = X(4, idx);
    x_hat_p = X(9, idx);
    enc_pitch = X(27, idx);
    
    % Elevation Variables
    X_e = X(6, idx);
    x_hat_e = X(11, idx);
    enc_elevation = X(29, idx);
    
    % Travel Rate Variables
    X_lamdadot = X(8, idx);
    x_hat_lamdadot = X(14, idx);
    enc_travelRate = X(26, idx);
    
    %% Plotting
    % Cascade window positions slightly using + i*20
    fig = figure('Name', sprintf('State Tracking - %s', test_name), 'Position', [150 + i*20, 150 + i*20, 1000, 800]);
    
    % 1. Pitch
    subplot(3, 1, 1);
    hold on; grid on;
    % Base layer: True State (Blue)
    plot(time, X_p, 'b-', 'LineWidth', 1.5, 'DisplayName', 'True State ($x_p$)');
    % Middle layer: Estimated State (Red Dashed)
    plot(time, x_hat_p, 'r--', 'LineWidth', 1.5, 'DisplayName', 'Estimated State ($\hat{x}_p$)');
    % Top layer: Measured Encoder (Dark Grey)
    plot(time, enc_pitch, '-', 'Color', [0.4 0.4 0.4], 'LineWidth', 1.0, 'DisplayName', 'Measured (Encoder)');
    title(sprintf('Pitch State Tracking (%s)', test_name));
    ylabel('Pitch [rad]');
    xlim([0 30]);
    legend('Location', 'best', 'Interpreter', 'latex');
    
    % 2. Elevation
    subplot(3, 1, 2);
    hold on; grid on;
    % Base layer: True State (Blue)
    plot(time, X_e, 'b-', 'LineWidth', 1.5, 'DisplayName', 'True State ($x_e$)');
    % Middle layer: Estimated State (Red Dashed)
    plot(time, x_hat_e, 'r--', 'LineWidth', 1.5, 'DisplayName', 'Estimated State ($\hat{x}_e$)');
    % Top layer: Measured Encoder (Dark Grey)
    plot(time, enc_elevation, '-', 'Color', [0.4 0.4 0.4], 'LineWidth', 1.0, 'DisplayName', 'Measured (Encoder)');
    title(sprintf('Elevation State Tracking (%s)', test_name));
    ylabel('Elevation [rad]');
    xlim([0 30]);
    legend('Location', 'best', 'Interpreter', 'latex');
    
    % 3. Travel Rate
    subplot(3, 1, 3);
    hold on; grid on;
    % Base layer: True State (Blue)
    plot(time, X_lamdadot, 'b-', 'LineWidth', 1.5, 'DisplayName', 'True State ($\dot{\lambda}$)');
    % Middle layer: Estimated State (Red Dashed)
    plot(time, x_hat_lamdadot, 'r--', 'LineWidth', 1.5, 'DisplayName', 'Estimated State ($\hat{\dot{\lambda}}$)');
    % Top layer: Measured Encoder (Dark Grey)
    plot(time, enc_travelRate, '-', 'Color', [0.4 0.4 0.4], 'LineWidth', 1.0, 'DisplayName', 'Measured (Encoder)');
    title(sprintf('Travel Rate State Tracking (%s)', test_name));
    ylabel('Travel Rate [rad/s]');
    xlabel('Time [s]');
    xlim([0 30]);
    legend('Location', 'best', 'Interpreter', 'latex');
    
    %% Save Figure as PDF
    pdf_filename = fullfile(plot_folder, sprintf('Kal_Q_Encoder_Estimated_%s.pdf', test_name));
    exportgraphics(fig, pdf_filename, 'ContentType', 'vector');
end