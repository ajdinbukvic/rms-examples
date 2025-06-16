kupci = readtable('kupci.csv');

X = [kupci.Prihod, kupci.PrethodneKupovine, kupci.Potrosnja];

X_norm = normalize(X);

k = 3;

[idx, C] = kmeans(X_norm, k, 'Replicates', 10);

kupci.Klaster = idx;

figure;
gscatter(kupci.Prihod, kupci.Potrosnja, kupci.Klaster);
xlabel('Prihod (000 KM)');
ylabel('Mjesečna potrošnja (KM)');
title('K-sredina klasterovanje potrošača');
legend('Klaster 1','Klaster 2','Klaster 3');

centri_klastera = array2table(C, 'VariableNames', {'Prihod','PrethodneKupovine','Potrosnja'});
disp('Centri klastera (standardizovani):');
disp(centri_klastera);

disp('Prosječne vrijednosti po klasterima:');
summary = groupsummary(kupci, 'Klaster', 'mean', {'Prihod','PrethodneKupovine','Potrosnja'});
disp(summary);

novi_kupci = table([35; 42; 28], [0; 0; 0], [150; 200; 90], ...
    'VariableNames', {'Prihod', 'PrethodneKupovine', 'Potrosnja'});

mu = mean(X);
sigma = std(X);

novi_korisnik = [35, 5, 100];  

novi_norm = (novi_korisnik - mu) ./ sigma;

udaljenosti = sqrt(sum((C - novi_norm).^2, 2)); 

[~, pripadni_klaster] = min(udaljenosti);

disp("Novi korisnik:");
disp(novi_korisnik);
fprintf('Novi korisnik pripada klasteru: %d\n', pripadni_klaster);