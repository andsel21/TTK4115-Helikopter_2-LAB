%% Initialisering
clear;
clc;
close all;

%% Mappe og filnavn
mappe = 'Lab3IMU';
filnavn = {'IMU01.mat', 'IMU02.mat', 'IMU03.mat', 'IMU04.mat', 'IMU05.mat', 'IMU06.mat', 'IMU07.mat', 'IMU08.mat', 'IMU09.mat'};
num_files = length(filnavn);

%% Klargjør lagringsmappe
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
    
    % Hent ut variabler
    time               = X(1,:);
    travelRate         = X(6,:);
    pitchRate          = X(8,:);
    elevationRate      = X(10,:);
    euler_pitchdot     = X(19,:);
    euler_elevationdot = X(20,:);
    euler_traveldot    = X(21,:);
    
    % Behold kun de første 30 sekundene
    idx = time <= 30;
    time               = time(idx);
    travelRate         = travelRate(idx);
    pitchRate          = pitchRate(idx);
    elevationRate      = elevationRate(idx);
    euler_pitchdot     = euler_pitchdot(idx);
    euler_elevationdot = euler_elevationdot(idx);
    euler_traveldot    = euler_traveldot(idx);
    
    displayName        = filnavn{i}(1:5); % f.eks. 'IMU01'
    
    % Opprett en ny figur for hver fil
    fig = figure('Name', ['Standard vs Euler Rates - ' displayName], 'Position', [100 + i*20, 100 + i*20, 1000, 800]);
    
    % 1. Pitch Rates
    subplot(3, 1, 1);
    hold on; grid on;
    plot(time, euler_pitchdot, '--', 'LineWidth', 2.0, 'DisplayName', 'Euler Rate');
    plot(time, pitchRate, '-', 'LineWidth', 1.0, 'DisplayName', 'Standard Rate');
    title(['Pitch Rate vs Euler Pitch Rate (' displayName ')']); 
    ylabel('Rate [rad/s]'); 
    xlim([0 30]);
    legend('Location', 'best');
    
    % 2. Elevation Rates
    subplot(3, 1, 2);
    hold on; grid on;
    plot(time, euler_elevationdot, '--', 'LineWidth', 2.0, 'DisplayName', 'Euler Rate');
    plot(time, elevationRate, '-', 'LineWidth', 1.0, 'DisplayName', 'Standard Rate');
    title(['Elevation Rate vs Euler Elevation Rate (' displayName ')']); 
    ylabel('Rate [rad/s]'); 
    xlim([0 30]);
    legend('Location', 'best');
    
    % 3. Travel Rates
    subplot(3, 1, 3);
    hold on; grid on;
    plot(time, euler_traveldot, '--', 'LineWidth', 2.0, 'DisplayName', 'Euler Rate');
    plot(time, travelRate, '-', 'LineWidth', 1.0, 'DisplayName', 'Standard Rate');
    title(['Travel Rate vs Euler Travel Rate (' displayName ')']); 
    ylabel('Rate [rad/s]'); 
    xlabel('Time [s]'); 
    xlim([0 30]);
    legend('Location', 'best');
    
    % Lagre figuren som vektorisert PDF
    pdf_navn = fullfile(plot_mappe, sprintf('IMU_Euler_Mot_Encoder_%s.pdf', displayName));
    exportgraphics(fig, pdf_navn, 'ContentType', 'vector');
end