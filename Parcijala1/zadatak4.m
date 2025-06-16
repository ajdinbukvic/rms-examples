Z = [12000, 15000, 17000, 16000];

figure;
bar(Z);
xlabel("Kvartal");
ylabel("Zarada");

[max_zarada, kvartal] = max(Z);
disp("Najuspjesniji kvartal: " + num2str(kvartal) + " sa zaradom: " + num2str(max_zarada));