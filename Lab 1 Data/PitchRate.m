%% Plot Pitch Rate from Record01 to Record09

clear;
clc;
close all;

figure;
hold on;
grid on;

% Distinct colors for Record 1-9
colors = [
    0.00 0.45 0.74;   % Blue
    0.85 0.33 0.10;   % Orange
    0.47 0.67 0.19;   % Green
    0.49 0.18 0.56;   % Purple
    0.93 0.69 0.13;   % Yellow
    0.30 0.75 0.93;   % Cyan
    0.64 0.08 0.18;   % Dark red
    0.49 0.49 0.49;   % Gray
    0.00 0.60 0.50;   % Teal
];

%% Plot pitch rate for all records

for i = 1:9

    % Create filename
    filename = sprintf('Record%02d.mat', i);

    % Load data
    data = load(filename);

    % Get matrix from .mat file
    vars = fieldnames(data);
    X = data.(vars{1});

    % Extract time and pitch rate
    time = X(1,:);
    pitchRate = X(8,:);

    % Keep only first 50 seconds
    idx = time <= 50;

    time = time(idx);
    pitchRate = pitchRate(idx);

    % Plot pitch rate with unique color
    plot(time, pitchRate, ...
        'LineWidth', 1.2, ...
        'Color', colors(i,:), ...
        'DisplayName', sprintf('%d', i));

end

%% Plot settings

xlabel('Time [s]');
ylabel('Pitch Rate');
title('Pitch Rate - Record 01 to Record 09');

legend('Location', 'best');

% Give some space around the data
xlim([0 50]);

ylimits = ylim;
yrange = ylimits(2) - ylimits(1);
ylim([ylimits(1) - 0.05*yrange, ...
      ylimits(2) + 0.05*yrange]);

hold off;

%% Plot Record09 Pitch Rate separately

figure;
hold on;
grid on;

plot(time, pitchRate, ...
    'LineWidth', 1.5, ...
    'Color', colors(9,:));

xlabel('Time [s]');
ylabel('Pitch Rate');
title('Pitch Rate - Record 09');

xlim([0 50]);

% Give some space around the data
ylimits = ylim;
yrange = ylimits(2) - ylimits(1);
ylim([ylimits(1) - 0.05*yrange, ...
      ylimits(2) + 0.05*yrange]);

hold off;