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

%% Klargjør figur for samlet plot (alle filer)
fig_all = figure('Name', 'Samlet: vd og vs', 'Position', [100, 100, 800, 600]);

%% Hent data og plot
for i = 1:num_files
    % Last inn data med fullfile for å håndtere undermapper
    filsti = fullfile(mappe, filnavn{i});
    data = load(filsti);
    vars = fieldnames(data);
    X = data.(vars{1});
    
    % Hent ut variablene for tid, vd (indeks 3) og vs (indeks 4)
    time = X(1,:);
    vd   = X(3,:);
    vs   = X(4,:);
    
    % Behold kun de første 30 sekundene
    idx = time <= 30;
    time = time(idx);
    vd   = vd(idx);
    vs   = vs(idx);
    
    % Label for legend (f.eks "LQR201")
    displayName = filnavn{i}(1:6);
    
    % -----------------------------------------------------
    % FIGUR SAMLET: vd over, vs under (for alle filer)
    % -----------------------------------------------------
    figure(fig_all);
    
    % 1. vd samlet
    subplot(2, 1, 1);
    hold on; grid on;
    plot(time, vd, 'LineWidth', 1.2, 'Color', colors(i,:), 'DisplayName', displayName);
    
    % 2. vs samlet
    subplot(2, 1, 2);
    hold on; grid on;
    plot(time, vs, 'LineWidth', 1.2, 'Color', colors(i,:), 'DisplayName', displayName);
    
    % -----------------------------------------------------
    % FIGUR SEPARAT: vd og vs for den spesifikke filen
    % -----------------------------------------------------
    % Legger til litt offset på 'Position' for hver figur så de ikke dekker hverandre helt
    fig_sep = figure('Name', ['Separat: ' displayName], 'Position', [950, 100 + (i-1)*30, 800, 600]);
    
    % 1. vd separat
    subplot(2, 1, 1);
    plot(time, vd, 'LineWidth', 1.2, 'Color', colors(i,:));
    grid on;
    title(['vd - ' displayName]); ylabel('Spenning [V]'); xlim([0 30]);
    
    % 2. vs separat
    subplot(2, 1, 2);
    plot(time, vs, 'LineWidth', 1.2, 'Color', colors(i,:));
    grid on;
    title(['vs - ' displayName]); ylabel('Spenning [V]'); xlabel('Tid [s]'); xlim([0 30]);
end

%% Formatering og akser for den samlede figuren
figure(fig_all);

% Format vd samlet