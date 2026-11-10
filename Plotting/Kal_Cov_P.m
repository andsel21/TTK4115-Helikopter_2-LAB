%% Initialization
clear; clc; close all;

%% Configuration
folder = 'Lab4Kalman';
num_tests = 8; % Loop through KalTest01 to KalTest08
% Define whole time window (0 to 30 seconds)
t_start = 0.0; 
t_end = 30.0;

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
    
    % Extract time and apply zoom limit
    time = X(1,:);
    idx = time >= t_start & time <= t_end;
    time = time(idx);
    
    % Extract Covariances (Diagonal elements)
    p_cov_pitch         = X(15, idx);
    p_cov_pitchRate     = X(16, idx);
    p_cov_elevation     = X(17, idx);
    p_cov_elevationRate = X(18, idx);
    p_cov_travelRate    = X(20, idx);
    
    % Extract new_data flag
    new_data = X(21, idx);
    
    %% Dynamic Scaling for new_data flag
    % Use nested max() to guarantee a scalar, preventing dimension mismatch
    scale1 = max([max(p_cov_pitch), max(p_cov_pitchRate)]); 
    if scale1 == 0; scale1 = 1; end
    
    scale2 = max([max(p_cov_elevation), max(p_cov_elevationRate)]); 
    if scale2 == 0; scale2 = 1; end
    
    scale3 = max(p_cov_travelRate); 
    if scale3 == 0; scale3 = 1; end
    
    %% Plotting
    fig = figure('Name', sprintf('Covariance Convergence - %s', test_name), 'Position', [200 + i*20, 200 + i*20, 1000, 800]);
    
    % 1. Pitch Covariance
    subplot(3, 1, 1);
    hold on; grid on;
    % Use .* for element-wise multiplication
    stairs(time, new_data .* scale1 .* 0.9, '-', 'Color', [0.8 0.8 0.8], 'LineWidth', 1.5, 'DisplayName', 'New Data (Scaled)');
    plot(time, p_cov_pitch, 'b-', 'LineWidth', 1.5, 'DisplayName', '$P_{1,1}$ (Pitch)');
    plot(time, p_cov_pitchRate, 'r-', 'LineWidth', 1.5, 'DisplayName', '$P_{2,2}$ (Pitch Rate)');
    title(sprintf('Pitch Covariance Updates (%s)', test_name));
    ylabel('Variance');
    xlim([t_start t_end]);
    legend('Location', 'best', 'Interpreter', 'latex');
    
    % 2. Elevation Covariance
    subplot(3, 1, 2);
    hold on; grid on;
    stairs(time, new_data .* scale2 .* 0.9, '-', 'Color', [0.8 0.8 0.8], 'LineWidth', 1.5, 'DisplayName', 'New Data (Scaled)');
    plot(time, p_cov_elevation, 'b-', 'LineWidth', 1.5, 'DisplayName', '$P_{3,3}$ (Elevation)');
    plot(time, p_cov_elevationRate, 'r-', 'LineWidth', 1.5, 'DisplayName', '$P_{4,4}$ (Elevation Rate)');
    title(sprintf('Elevation Covariance Updates (%s)', test_name));
    ylabel('Variance');
    xlim([t_start t_end]);
    legend('Location', 'best', 'Interpreter', 'latex');
    
    % 3. Travel Rate Covariance
    subplot(3, 1, 3);
    hold on; grid on;
    stairs(time, new_data .* scale3 .* 0.9, '-', 'Color', [0.8 0.8 0.8], 'LineWidth', 1.5, 'DisplayName', 'New Data (Scaled)');
    plot(time, p_cov_travelRate, 'b-', 'LineWidth', 1.5, 'DisplayName', '$P_{6,6}$ (Travel Rate)');
    title(sprintf('Travel Rate Covariance Updates (%s)', test_name));
    ylabel('Variance');
    xlabel('Time [s]');
    xlim([t_start t_end]);
    legend('Location', 'best', 'Interpreter', 'latex');
    
    %% Save Figure as PDF
    pdf_filename = fullfile(plot_folder, sprintf('Kal_Cov_P_%s.pdf', test_name));
    exportgraphics(fig, pdf_filename, 'ContentType', 'vector');
end