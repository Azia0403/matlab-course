clc;
clear all;
close all;

% Parameters
t = 0:0.02/2560:2/80;
x = cos(80*pi*t + 0.25*pi);
y = sin(2560*pi*t);
z = x .* y + 15;

% Plot time domain signal
figure;
plot(t, z);
title('Time Domain Signal z(t)');
xlabel('Time (s)');
ylabel('Amplitude');

% Frequency analysis
n = length(z); % Number of samples
fs = 1 / (t(2) - t(1)); % Sampling frequency
f = (-n/2:n/2-1)*(fs/n); % Frequency range

Z = fft(z); % Compute the FFT
Z_shifted = fftshift(Z); % Shift zero frequency component to center of spectrum

% Plot frequency spectrum
figure;
plot(f, abs(Z_shifted)/n);
title('Frequency Spectrum of z(t)');
xlabel('Frequency (Hz)');
ylabel('Magnitude');
