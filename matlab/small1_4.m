clc;
clear all;
close all;

% Time vector
T = 4; % 4 periods
t = (0:0.01:4*T)'; % Extend the time vector to cover 4 periods

% Unit step function with period T=4
a = mod(t, 4) >= 0;    % 0 <= t < 4
b = mod(t, 4) >= 1;    % 1 <= t < 5
c = mod(t, 4) >= 3;    % 3 <= t < 7
d = mod(t, 4) >= 4;    % 4 <= t < 8
x = 2*a - b + 2*c - 3*d;

% Plot the periodic unit step function
figure;
plot(t, x, 'LineWidth', 2);
title('Periodic Unit Step Function Time Domain (T = 4)');
xlabel('Time (s)');
ylabel('u(t)');
grid on;