%% Plot Travel from Record01 to Record09

clear;
clc;
close all;

figure;
hold on;
grid on;

for i = 1:9

    % Create filename
    filename = sprintf('Record%02d.mat', i);

    % Load data
    data = load(filename);

    % Get matrix from .mat file
    vars = fieldnames(data);
    X = data.(vars{1});

    % Extract time and travel
    time = X(1,:);
    travel = X(5,:);

    % Keep only first 50 seconds
    idx = time <= 50;

    time = time(idx);
    travel = travel(idx);

    % Plot
    plot(time, travel, 'LineWidth', 1.2, ...
        'DisplayName', sprintf('%d', i));

end

%% Plot settings

xlabel('Time [s]');
ylabel('Travel');
title('Travel - 1-9');

legend('Location', 'best');

% Give some space around the data
xlim([0 50]);

ylimits = ylim;
yrange = ylimits(2) - ylimits(1);
ylim([ylimits(1) - 0.05*yrange, ...
      ylimits(2) + 0.05*yrange]);

hold off;