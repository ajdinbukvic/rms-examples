brzine = 10:10:100;

disp("Brzine:")
disp(brzine);

potrosnje = zeros(1,10);

for i=1:10
    potrosnje(i) = potrosnja(brzine(i));
end

disp("Potrosnje:");
disp(potrosnje);

figure;
plot(brzine, potrosnje, 'g', 'LineWidth', 2);
xlabel("Brzina");
ylabel("Potrosnja");