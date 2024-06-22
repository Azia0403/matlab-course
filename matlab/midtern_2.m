clc; 
clear all; 
close all; 

% 參數設置
b = [0, 1, -1]; % 差分方程式的分子係數
a = 1; % 差分方程式的分母係數（這裡是1，因為分母為1）
n = 0:20; % 繪製0到20的脈衝響應
h = impz(b, a, length(n)); % 計算脈衝響應
figure;
stem(n, h); % 繪製脈衝響應
xlabel('n');
ylabel('h[n]');
title('Impulse Response of y[n] = x[n-1] - x[n-2] n =20');

n = 0:100; % 繪製0到100的響應
x = cos(pi/6 * n - pi/6); % 信號x[n]
y = filter(b, a, x); % 計算響應y[n]
figure;
stem(n, y); % 繪製響應
xlabel('n');
ylabel('y[n]');
title('Response of x[n] = cos(\pi/6 * n - \pi/6) to y[n] = x[n-1] - x[n-2] n=100');
