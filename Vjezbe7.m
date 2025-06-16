% 1

f = @(x) x.^2 - 4*x + 4;
x0 = 0;
options = optimset('Display', 'iter');

rjesenje = fsolve(f, x0, options);

disp(rjesenje);

% 2

fn = @(x) sin(x).*exp(-x);

in = integral(fn, 0, 5);

disp(in);

% 3

t = 1:0.1:10;
C = log(t);

dc = gradient(C, t);

figure;
plot(t, dc, 'g', 'LineWidth', 2);
grid on;

% 4

podaci = 50 + 10 * randn(1, 1000);

figure;
histogram(podaci, 20);
grid on;

disp(["Srednja vrijednost:",num2str(mean(podaci))]);
disp(["Standardna devijacija:",num2str(std(podaci))]);
disp(["Minimalna vrijednost:",num2str(min(podaci))]);
disp(["Maksimalna vrijednost:",num2str(max(podaci))]);

% 5

y = [1 4 9 16 25 36 49];
x = 1:length(y);

dy = diff(y);
disp(dy);

ddy = diff(dy);
disp(ddy);