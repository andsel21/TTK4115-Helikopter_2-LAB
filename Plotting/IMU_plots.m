%% Init Plotting
% Assumes X matrix size is 21xN double
% 1 = Time
% 2 = Input
% 3 = Vd
% 4 = Vs
% 5 = Travel 
% 6 = Travel Rate
% 7 = Pitch
% 8 = Pitch Rate
% 9 = Elevation
% 10 = Elevation Rate
% 11 = x_hat Pitch (p)
% 12 = x_hat Pitch Rate (pdot)
% 13 = x_hat Elevation Rate (edot)
% 14 = Accelerometer Pitch (p)
% 15 = Accelerometer Elevation (e)
% 16 = Gyro Pitch Rate
% 17 = Gyro Elevation Rate
% 18 = Gyro Travel Rate
% 19 = Euler Pitch Rate
% 20 = Euler Elevation Rate
% 21 = Euler Travel Rate

time                = X(1,:);
input               = X(2,:);
vd                  = X(3,:);
vs                  = X(4,:);
travel              = X(5,:);
travelRate          = X(6,:);
pitch               = X(7,:);
pitchRate           = X(8,:);
elevation           = X(9,:);
elevationRate       = X(10,:);

x_hat_p             = X(11,:);
x_hat_pdot          = X(12,:);
x_hat_edot          = X(13,:);

acc_p               = X(14,:);
acc_e               = X(15,:);

gyro_pitchdot       = X(16,:);
gyro_elevationdot   = X(17,:);
gyro_traveldot      = X(18,:);

euler_pitchdot      = X(19,:);
euler_elevationdot  = X(20,:);
euler_traveldot     = X(21,:);

idx = time <= 50;

time                = time(idx);
input               = input(idx);
vd                  = vd(idx);
vs                  = vs(idx);
travel              = travel(idx);
travelRate          = travelRate(idx);
pitch               = pitch(idx);
pitchRate           = pitchRate(idx);
elevation           = elevation(idx);
elevationRate       = elevationRate(idx);

x_hat_p             = x_hat_p(idx);
x_hat_pdot          = x_hat_pdot(idx);
x_hat_edot          = x_hat_edot(idx);

acc_p               = acc_p(idx);
acc_e               = acc_e(idx);

gyro_pitchdot       = gyro_pitchdot(idx);
gyro_elevationdot   = gyro_elevationdot(idx);
gyro_traveldot      = gyro_traveldot(idx);

euler_pitchdot      = euler_pitchdot(idx);
euler_elevationdot  = euler_elevationdot(idx);
euler_traveldot     = euler_traveldot(idx);

