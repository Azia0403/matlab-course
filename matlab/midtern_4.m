clc; 
clear all; 
close all; 

% 參數設置
t = 0:1/240000:0.00024; % 以 1/fs = 1/240000 的時間間隔取樣，總共取樣 0.01 秒
x = sin(24000*pi*t + pi/6); % 信號

% 60kHz 取樣頻率下的取樣與重建
fs1 = 60000; % 取樣頻率 60kHz
n1 = 0:1/fs1:0.00024; % 取樣點
xn1 = sin(24000*pi*n1 + pi/6); % 以 60kHz 取樣後的信號

% 24kHz 取樣頻率下的取樣與重建
fs2 = 24000; % 取樣頻率 24kHz
n2 = 0:1/fs2:0.00024; % 取樣點
xn2 = sin(24000*pi*n2 + pi/6); % 以 24kHz 取樣後的信號

% 0階內插法
xn1_interp = interp1(n1, xn1, t, 'previous'); % 使用前一個取樣點的值進行內插
xn2_interp = interp1(n2, xn2, t, 'previous'); % 使用前一個取樣點的值進行內插

% 1階內插法
xn1_interp_linear = interp1(n1, xn1, t, 'linear'); % 線性內插
xn2_interp_linear = interp1(n2, xn2, t, 'linear'); % 線性內插

% 繪圖
subplot(4, 1, 1);
plot(t, x);
title('Original Signal');
xlabel('Time (s)');
ylabel('Amplitude');

subplot(4, 1, 2);
stem(n1, xn1, 'r');
hold on;
plot(t, xn1_interp, 'b');
hold off;
title('Sampled and Reconstructed Signal (fs = 60kHz)');
xlabel('Time (s)');
ylabel('Amplitude');
legend('Sampled Signal', 'Zero-order Hold Interpolation');

subplot(4, 1, 3);
stem(n2, xn2, 'r');
hold on;
plot(t, xn2_interp, 'b');
hold off;
title('Sampled and Reconstructed Signal (fs = 24kHz)');
xlabel('Time (s)');
ylabel('Amplitude');
legend('Sampled Signal', 'Zero-order Hold Interpolation');

subplot(4, 1, 4);
plot(t, xn1_interp_linear, 'b');
hold on;
plot(t, xn2_interp_linear, 'g');
hold on;
plot(t, x, 'r');
hold off;
title('Linear Interpolation');
xlabel('Time (s)');
ylabel('Amplitude');
legend('fs = 60kHz', 'fs = 24kHz', 'Original Signal');

sgtitle('Sampling and Interpolation of sin(24000\pi t + \pi/6)');
