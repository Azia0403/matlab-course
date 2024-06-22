clc;          
clear all;    
close all;    

% (a) x[n] = A*cos(10*n^2)
n = -100:100;
A = 1;
x_a = A * cos(10 * n.^2);
figure;
subplot(3, 3, 1);
stem(n, x_a);
title('(a)x[n] = A \cos(10n^2)');
xlabel('n');
ylabel('Amplitude');

% (b) x(t) = (\cos^2)(\pi t)
t = -1:0.001:5;
x_b = cos(pi * t).^2;
subplot(3, 3, 2);
plot(t, x_b);
title('(b)x(t) = \cos^2(\pi t)');
xlabel('t');
ylabel('Amplitude');

% (c) x(t) = \cos(\pi^2 t) \sin(\pi^\pi t)
t = -1:0.001:5;
x_c = cos(pi^2 * t) .* sin(pi^pi * t);
subplot(3, 3, 3);
plot(t, x_c);
title('(c)x(t) = \cos(\pi^2 t) \sin(\pi^\pi t)');
xlabel('t');
ylabel('Amplitude');

% (d) x(t) = \cos(\pi t) \sin(\pi t^2)
t = -1:0.001:5;
x_d = cos(pi * t) .* sin(pi * t.^2);
subplot(3, 3, 4);
plot(t, x_d);
title('(d)x(t) = \cos(\pi t) \sin(\pi t^2)');
xlabel('t');
ylabel('Amplitude');

% (e) x(t) = \cos(\sqrt{\pi t})
t = -1:0.001:5;
x_e = cos(sqrt(pi * t));
subplot(3, 3, 5);
plot(t, x_e);
title('(e)x(t) = \cos(\sqrt{\pi t})');
xlabel('t');
ylabel('Amplitude');

% (f) x(t) = \cos((\sqrt{\pi}) t)
t = -1:0.001:10;
x_f = cos(sqrt(pi) * t);
subplot(3, 3, 6);
plot(t, x_f);
title('(f)x(t) = \cos((\sqrt{\pi}) t)');
xlabel('t');
ylabel('Amplitude');

% (g) x(t) = \cos(\sqrt{2} t) + \sin(\sqrt{3} t)
t = -1:0.001:5;
x_g = cos(sqrt(2) * t) + sin(sqrt(3) * t);
subplot(3, 3, 7);
plot(t, x_g);
title('(g)x(t) = \cos(\sqrt{2} t) + \sin(\sqrt{3} t)');
xlabel('t');
ylabel('Amplitude');
