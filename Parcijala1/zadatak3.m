fileID = fopen("mjerenja.txt", 'r');
podaci = fscanf(fileID, '%f', [1, Inf]);
podaci = podaci';

disp("Ucitani podaci:");
disp(podaci);

aritmeticka_sredina = mean(podaci);
standardna_devijacija = std(podaci);

disp("Aritmeticka sredina: " + num2str(aritmeticka_sredina));
disp("Standardna devijacija: " + num2str(standardna_devijacija));

figure;
histogram(podaci, 20);
xlabel("Vrijednosti");
ylabel("Frekvecnija");