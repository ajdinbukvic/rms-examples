T = randi([18 26],1,24);

disp("Generisane temperature:")
disp(T);

prosjecna_temp = mean(T);
max_temp = max(T);
min_temp = min(T);

disp("Prosjecna temperatura: " + num2str(prosjecna_temp));
disp("Maksimalna temperatura: " + num2str(max_temp));
disp("Minimalna temperatura: " + num2str(min_temp));

sati = 1:1:24;

figure;
%plot(sati, T, 'g', 'LineWidth', 2);
line(sati, T);
xlabel("Sati");
ylabel("Temperatura");