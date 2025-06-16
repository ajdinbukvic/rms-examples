cestice = 60;   % Vrijednost zagadjenosti cesticama
no2 = 80;       % Vrijednost koncentracije nitrogen dioksida

cestice_parametri = [0 0 25; 0 50 100; 50 150 150];   % low, medium, high
no2_parametri  = [0 0 50; 25 100 150; 100 200 200];   % low, medium, high

mu_cestice = [ ...
    trimf(cestice, cestice_parametri(1,:)), ...
    trimf(cestice, cestice_parametri(2,:)), ...
    trimf(cestice, cestice_parametri(3,:)) ];

mu_no2 = [ ...
    trimf(no2, no2_parametri(1,:)), ...
    trimf(no2, no2_parametri(2,:)), ...
    trimf(no2, no2_parametri(3,:)) ];

pravila = [
    1 1 30;   % low cestice, low NO2  -> kvaliteta = (dobra)
    1 2 60;   % low cestice, med NO2  -> kvaliteta = (umjerena)
    2 2 100;  % med cestice, med NO2  -> kvaliteta = (loša)
    3 3 150;  % high cestice, high NO2 -> kvaliteta = (vrlo loša)
    2 3 130;  % med cestice, high NO2 -> kvaliteta = 130
    3 2 120;  % high cestice, med NO2 -> kvaliteta = 120
];

brojnik = 0;
nazivnik = 0;
aktivacije = zeros(size(pravila,1),1);
pravila_doprinoss = zeros(size(pravila,1),1);
izlazne_vrijednosti = zeros(size(pravila,1),1);

for i = 1:size(pravila,1)
    a = pravila(i,1);
    b = pravila(i,2);
    izlaz = pravila(i,3);
    act = min(mu_cestice(a), mu_no2(b));
    fprintf("Pravilo %d: Cestice=%d, NO2=%d → Kvaliteta=%d (doprinos=%.2f)\n", ...
        i, a, b, izlaz, act);
    aktivacije(i) = act;
    if a>0 && b>0
        aktiv = min(mu_cestice(a), mu_no2(b));
    elseif a>0
        aktiv = mu_cestice(a);
    else
        aktiv = mu_no2(b);
    end
    pravila_doprinoss(i) = aktiv;
    izlazne_vrijednosti(i) = izlaz;
    brojnik = brojnik + aktiv * izlaz;
    nazivnik = nazivnik + aktiv;
end

kvaliteta = brojnik / nazivnik;

fprintf('Ulazi:\nCestice = %.2f µg/m³\nKoncentracija NO2 = %.2f %%\n', cestice, no2);
fprintf('Izracunata kvaliteta zraka = %.2f\n', kvaliteta);

figure('Name','Fuzzy Sugeno - Kvaliteta zraka','NumberTitle','off');

subplot(3,1,1); hold on; grid on; title('Cestice – Fuzzy skupovi');
x1 = 0:1:150; colors = ['b','g','r']; labels = {'low','medium','high'};
for i = 1:3
    plot(x1, arrayfun(@(x) trimf(x, cestice_parametri(i,:)), x1), colors(i), 'DisplayName', labels{i});
end
xline(cestice,'--k',sprintf('cestice = %.1f',cestice)); legend;

subplot(3,1,2); hold on; grid on; title('NO2 – Fuzzy skupovi');
x2 = 0:1:200;
for i = 1:3
    plot(x2, arrayfun(@(x) trimf(x, no2_parametri(i,:)), x2), colors(i), 'DisplayName', labels{i});
end
xline(no2,'--k',sprintf('no2 = %.1f',no2)); legend;

subplot(3,1,3); 
bar(1,kvaliteta,0.4,'FaceColor','m'); 
ylim([0 160]); grid on;
title(sprintf('Izlazna kvaliteta = %.2f',kvaliteta));
ylabel('Kvaliteta zraka'); set(gca,'XTick',[]);

figure;
bar(izlazne_vrijednosti, pravila_doprinoss, 0.4);
xlabel('Sugeno izlaz (Kvaliteta zraka)');
ylabel('Doprinos pravila)');
title('Doprinos svakog Sugeno pravila');
grid on;