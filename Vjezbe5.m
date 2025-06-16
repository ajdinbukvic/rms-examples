% 1

x = linspace(0, 2*pi, 100);

y1 = sin(2*x);
y2 = sin(5*x);

figure;
plot(x, y1, 'r-', 'LineWidth', 2);
hold on;
plot(x, y2, 'b--', 'LineWidth', 2); 
hold off;

title('Sinusoide sa različitim frekvencijama');
xlabel('x');
ylabel('y');
legend('sin(2x)', 'sin(5x)');
grid on;

% 2

podaci = randn(1000,1);

figure;
histogram(podaci, 20); 

title('Histogram normalno distribuiranih podataka');
xlabel('Vrijednosti');
ylabel('Frekvencija');
grid on;

% 3

[x, y] = meshgrid(-5:0.2:5, -5:0.2:5);
z = x.^2 + y.^2;

figure;
surf(x, y, z);
shading interp;
colorbar; 

title('3D Grafikon paraboloida');
xlabel('x');
ylabel('y');
zlabel('z = x^2 + y^2');

% 4

populacije = [50, 30, 15, 10, 5];
drzave = {'Država A', 'Država B', 'Država C', 'Država D', 'Država E'};

figure;
pie(populacije, drzave);

title('Populacija pet država');

% 5

x = linspace(-2, 2, 100);
y = x.^2;

figure;
comet(x, y);

title('Kretanje tačke po paraboli y = x^2');
xlabel('x');
ylabel('y');
grid on;
