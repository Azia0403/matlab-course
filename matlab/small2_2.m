% Define filter coefficients
a1 = 0.8;
a2 = 0.8;
b0 = 1;
b1 = 0.5;

% Define the filter
b = [b0 b1];
a = [1 -a1 -a2];

% 1. Compute the transfer function H(z)
[H, w] = freqz(b, a, 'half', 1024);

% 2. Compute the impulse response h[n]
h = impz(b, a, 50); % Impulse response for 50 samples

% 3. Plot the magnitude and phase response
figure;
subplot(2,1,1);
plot(w/pi, abs(H));
title('Magnitude Response');
xlabel('\omega / \pi');
ylabel('|H(e^{j\omega})|');

subplot(2,1,2);
plot(w/pi, angle(H));
title('Phase Response');
xlabel('\omega / \pi');
ylabel('\angle H(e^{j\omega})');

% 4. Apply the filter to different input signals and find y[n]

% (a) x[n] = u[n] (unit step function)
n = 0:49;
x1 = ones(size(n)); % unit step
y1 = filter(b, a, x1);

figure;
stem(n, y1);
title('Output y[n] for x[n] = u[n]');
xlabel('n');
ylabel('y[n]');

% (b) x[n] = \delta[n-1] (unit impulse delayed by 1)
x2 = [0 1 zeros(1, 48)]; % impulse delayed by 1
y2 = filter(b, a, x2);

figure;
stem(n, y2);
title('Output y[n] for x[n] = \delta[n-1]');
xlabel('n');
ylabel('y[n]');

% (c) x[n] = cos(pi*n/4)
x3 = cos(pi*n/4);
y3 = filter(b, a, x3);

figure;
stem(n, y3);
title('Output y[n] for x[n] = cos(\pi n / 4)');
xlabel('n');
ylabel('y[n]');
