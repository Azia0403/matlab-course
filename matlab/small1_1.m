clc;          
clear all;    
close all;    

% 參數設置
T = 16e-3; % 週期為16毫秒
f0 = 1 / T; % 基頻
t = 0:1e-6:4*T; % 時間向量，從0到一個週期，以1微秒為步長

% 複數指數信號
Z = 4 * exp(1i * (125 * pi * t + pi / 4));

% 畫出時間域信號的實部和虛部
figure;
subplot(2, 1, 1);
plot(t, real(Z));
title('Real Part of Time Domain Signal Z(t)');
xlabel('Time (s)');
ylabel('Amplitude');

subplot(2, 1, 2);
plot(t, imag(Z));
title('Imaginary Part of Time Domain Signal Z(t)');
xlabel('Time (s)');
ylabel('Amplitude');

% 頻率分析
n = length(Z); % 樣本數
fs = 1 / (t(2) - t(1)); % 取樣頻率
f = (-n/2:n/2-1)*(fs/n); % 頻率範圍

Z_fft = fft(Z); % 計算FFT
Z_fft_shifted = fftshift(Z_fft); % 將零頻率成分移到頻譜的中心

% 畫出頻譜
figure;
plot(f, abs(Z_fft_shifted)/n);
title('Frequency Spectrum of Z(t)');
xlabel('Frequency (Hz)');
ylabel('Magnitude');
