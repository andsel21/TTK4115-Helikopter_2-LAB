%% Initialisering
clear;
clc;
close all;

%% Mappe og filnavn
mappe = 'Lab2LQRNoIntegral';
filnavn = {'LQR201.mat', 'LQR202.mat', 'LQR203.mat', 'LQR204.mat', 'LQR205.mat', 'LQR206.mat'};
num_files = length(filnavn);

% Distinkte farger for de 6 filene
colors = [
    0.00 0.45 0.74;   % Blå
    0.85 0.33 0.10;   % Oransje
    0.47 0.67 0.19;   % Grønn
    0.49 0.18 0.56;   % Lilla
    0.93 0.69 0.13;   % Gul
    0.30 0.75 0.93;   % Cyan
];

%% Klargjør to figurer
fig1 = figure('Name', 'States: Pitch, Elevation, Travel', 'Position', [100, 100, 800, 800]);
fig2 = figure('Name', 'Rates: Pitch Rate, Elevation Rate, Travel Rate', 'Position', [950, 100, 800, 800]);

%% Hent data og plot
for i = 1:num_files
    % Last inn data med fullfile for å håndtere undermapper
    filsti = fullfile(mappe, filnavn{i});
    data = load(filsti);
    vars = fieldnames(data);
    X = data.(vars{1});
    
    % Hent ut variablene
    time          = X(1,:);
    input         = X(2,:);
    travel        = X(5,:);
    travelRate    = X(6,:);
    pitch         = X(7,:);
    pitchRate     = X(8,:);
    elevation     = X(9,:);
    elevationRate = X(10,:);
    
    % Behold kun de første 50 sekundene
    idx = time <= 50;
    time          = time(idx);
    input         = input(idx);
    travel        = travel(idx);
    travelRate    = travelRate(idx);
    pitch         = pitch(idx);
    pitchRate     = pitchRate(idx);
    elevation     = elevation(idx);
    elevationRate = elevationRate(idx);
    
    % Label for legend (f.eks "LQR201")
    displayName = filnavn{i}(1:6);
    
    % -----------------------------------------------------
    % FIGUR 1: Pitch, Elevation, Travel (Tilstander)
    % -----------------------------------------------------
    figure(fig1);
    
    % 1. Pitch
    subplot(3, 1, 1);
    hold on; grid on;
    plot(time, pitch, 'LineWidth', 1.2, 'Color', colors(i,:), 'DisplayName', displayName);
    
    % 2. Elevation
    subplot(3, 1, 2);
    hold on; grid on;
    plot(time, elevation, 'LineWidth', 1.2, 'Color', colors(i,:), 'DisplayName', displayName);
    
    % 3. Travel
    subplot(3, 1, 3);
    hold on; grid on;
    plot(time, travel, 'LineWidth', 1.2, 'Color', colors(i,:), 'DisplayName', displayName);
    
    % -----------------------------------------------------
    % FIGUR 2: Pitch_dot, Elevation_dot, Travel_dot (Rater)
    % -----------------------------------------------------
    figure(fig2);
    
    % 1. Pitch Rate
    subplot(3, 1, 1);
    hold on; grid on;
    plot(time, pitchRate, 'LineWidth', 1.2, 'Color', colors(i,:), 'DisplayName', displayName);
    
    % 2. Elevation Rate
    subplot(3, 1, 2);
    hold on; grid on;
    plot(time, elevationRate, 'LineWidth', 1.2, 'Color', colors(i,:), 'DisplayName', displayName);
    
    % 3. Travel Rate
    subplot(3, 1, 3);
    hold on; grid on;
    plot(time, travelRate, 'LineWidth', 1.2, 'Color', colors(i,:), 'DisplayName', displayName);
end

%% Formatering og akser for Figur 1
figure(fig1);
% Format Pitch
subplot(3,1,1);
title('Pitch'); ylabel('Vinkel'); legend('Location', 'best'); xlim([0 50]);
% Format Elevation
subplot(3,1,2);
title('Elevation'); ylabel('Vinkel'); legend('Location', 'best'); xlim([0 50]);
% Format Travel
subplot(3,1,3);
title('Travel'); ylabel('Vinkel'); xlabel('Tid [s]'); legend('Location', 'best'); xlim([0 50]);

%% Formatering og akser for Figur 2
figure(fig2);
% Format Pitch Rate
subplot(3,1,1);
title('Pitch Rate'); ylabel('Rate'); legend('Location', 'best'); xlim([0 50]);
% Format Elevation Rate
subplot(3,1,2);
title('Elevation Rate'); ylabel('Rate'); legend('Location', 'best'); xlim([0 50]);
% Format Travel Rate
subplot(3,1,3);
title('Travel Rate'); ylabel('Rate'); xlabel('Tid [s]'); legend('Location', 'best'); xlim([0 50]);

%% Legg til Input fra LQR201 i Figur 1 (Pitch-plottet) som referanse
figure(fig1);
subplot(3,1,1);
% Laster inn på nytt kun for å få input fra første fil, med fullfile
filsti_ref = fullfile(mappe, filnavn{1});
data = load(filsti_ref); 
vars = fieldnames(data); 
X = data.(vars{1});
t_in = X(1, X(1,:) <= 50);
u_in = X(2, X(1,:) <= 50);
plot(t_in, u_in, 'k--', 'LineWidth', 1.5, 'Color', [0.5 0.5 0.5], 'DisplayName', ['Input (' filnavn{1}(1:6) ')']);

%% Lagre plots som PDF
plot_mappe = fullfile(mappe, 'plots');
if ~exist(plot_mappe, 'dir')
    mkdir(plot_mappe);
end

pdf_states = fullfile(plot_mappe, 'LQR_QandR_States.pdf');
pdf_rates  = fullfile(plot_mappe, 'LQR_QandR_Rates.pdf');

exportgraphics(fig1, pdf_states, 'ContentType', 'vector');
exportgraphics(fig2, pdf_rates, 'ContentType', 'vector');