kupci = readtable('kupci.csv');

model = fitlm(kupci, 'Potrosnja ~ Godine + Prihod + PrethodneKupovine');

disp(model);

figure;
plot(model);
title('Linearni regresioni model: Predikcija potrošnje');
xlabel('Predikcija');
ylabel('Opažena potrošnja');

novi_kupci = table([25; 40; 33], ...
                   [30; 45; 32], ...
                   [0; 0; 0], ...
                   'VariableNames', {'Godine', 'Prihod', 'PrethodneKupovine'});

predikcije = predict(model, novi_kupci);

disp(table(novi_kupci.Godine, novi_kupci.Prihod, novi_kupci.PrethodneKupovine, predikcije, ...
    'VariableNames', {'Godine', 'Prihod', 'PrethodneKupovine', 'PredikovanaPotrosnja'}));

