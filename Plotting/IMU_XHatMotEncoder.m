%% Initialisering
clear;
clc;
close all;

%% Mappe og filnavn
mappe = 'Lab3IMU';
filnavn = {'IMU01.mat', 'IMU02.mat', 'IMU03.mat', 'IMU04.mat', 'IMU05.mat', 'IMU06.mat', 'IMU07.mat', 'IMU08.mat', 'IMU09.mat'};
num_files = length(filnavn);

% Opprett en mappe for plots hvis den ikke eksisterer
plot_mappe = fullfile(mappe, 'plots');
if ~exist(plot_mappe, 'dir')
    mkdir(plot_mappe);
end

%% Hent data og plot i separate figurer
for i = 1:num_files
    filsti = fullfile(mappe, filnavn{i});
    data = load(filsti);
    vars = fieldnames(data);
    X = data.(vars{1});
    
    % Hent ut variabler (Tid, Sanne tilstander og Estimater)
    time               = X(1,:);
    pitch              = X(7,:);
    pitchRate          = X(8,:);
    elevationRate      = X(10,:);
    
    x_hat_p            = X(11,:);
    x_hat_pdot         = X(12,:);
    x_hat_edot         = X(13,:);
    
    % Behold kun de første 30 sekundene
    idx = time <= 30;
    time               = time(idx);
    pitch              = pitch(idx);
    pitchRate          = pitchRate(idx);
    elevationRate      = elevationRate(idx);
    
    x_hat_p            = x_hat_p(idx);
    x_hat_pdot         = x_hat_pdot(idx);
    x_hat_edot         = x_hat_edot(idx);
    
    displayName        = filnavn{i}(1:5); % f.eks. 'IMU01'
    
    % Opprett en ny figur for hver fil (Lagt til 'fig = ' for eksport)
    fig = figure('Name', ['Estimates vs True States - ' displayName], 'Position', [100 + i*20, 100 + i*20, 1000, 800]);
    
    % 1. Pitch
    subplot(3, 1, 1);
    hold on; grid on;
    plot(time, pitch, '-', 'LineWidth', 1.0, 'DisplayName', 'Pitch (Sann)');
    plot(time, x_hat_p, '-', 'LineWidth', 2.0, 'DisplayName', 'x\_hat\_p (Estimat)');
    title(['Pitch vs x\_hat\_p (' displayName ')']); 
    ylabel('Vinkel [rad]'); 
    xlim([0 30]);
    legend('Location', 'best');
    
    % 2. Pitch Rate
    subplot(3, 1, 2);
    hold on; grid on;
    plot(time, pitchRate, '-', 'LineWidth', 1.0, 'DisplayName', 'Pitch Rate (Sann)');
    plot(time, x_hat_pdot, '-', 'LineWidth', 2.0, 'DisplayName', 'x\_hat\_pdot (Estimat)');
    title(['Pitch Rate vs x\_hat\_pdot (' displayName ')']); 
    ylabel('Rate [rad/s]'); 
    xlim([0 30]);
    legend('Location', 'best');
    
    % 3. Elevation Rate
    subplot(3, 1, 3);
    hold on; grid on;
    plot(time, elevationRate, '-', 'LineWidth', 1.0, 'DisplayName', 'Elevation Rate (Sann)');
    plot(time, x_hat_edot, '-', 'LineWidth', 2.0, 'DisplayName', 'x\_hat\_edot (Estimat)');
    title(['Elevation Rate vs x\_hat\_edot (' displayName ')']); 
    ylabel('Rate [rad/s]'); 
    xlabel('Tid [s]'); 
    xlim([0 30]);
    legend('Location', 'best');
    
    % Lagre plot som PDF for den gjeldende filen
    pdf_filename = fullfile(plot_mappe, ['IMU_XHat_MotEncoder_' displayName '.pdf']);
    exportgraphics(fig, pdf_filename, 'ContentType', 'vector');
end