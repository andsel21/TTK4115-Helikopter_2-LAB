%% Getting data from samme folder
% Record01.mat

clear;
clc;
close all;

data = load('Record01.mat');

% Get the matrix from the .mat file
vars = fieldnames(data);
X = data.(vars{1});

%% Init Plotting
% Har fil på 10x17922 double
% Trenger de første 50 Sekundene aldri mer
% Første er tid
% 2 = Input
% 3 = Vd
% 4 = Vs
% 5 = Travel 
% 6 = Travel Rate
% 7 = Pitch
% 8 = Pitch Rate
% 9 = Elevation
%10 = Elevation Rate

time            = X(1,:);
input           = X(2,:);
vd              = X(3,:);
vs              = X(4,:);
travel          = X(5,:);
travelRate      = X(6,:);
pitch           = X(7,:);
pitchRate       = X(8,:);
elevation       = X(9,:);
elevationRate   = X(10,:);

idx = time <= 50;
time          = time(idx);
input         = input(idx);
vd            = vd(idx);
vs            = vs(idx);
travel        = travel(idx);
travelRate    = travelRate(idx);
pitch         = pitch(idx);
pitchRate     = pitchRate(idx);
elevation     = elevation(idx);
elevationRate = elevationRate(idx);

%% Plot 1
% Plot time and input
figure;

plot(time, input, 'LineWidth', 1.2);

grid on;
xlabel('Time [s]');
ylabel('Input');
title('Input vs Time');

% Margin 10%
xlim([min(time) max(time)]);
ymin = min(input);
ymax = max(input);
margin = 0.1 * (ymax - ymin);
ylim([ymin - margin, ymax + margin]);

%% Plot 2
% Elevation
figure;

plot(time, elevation, 'LineWidth', 1.2);

grid on;
xlabel('Time [s]');
ylabel('Elevation');
title('Elevation vs Time');
