nivo_vode = 70;      % Trenutni nivo vode
promjena_nivoa = 5;  % Promjena nivoa vode

nivo_parametri = [0 0 25 50; 25 50 50 75; 50 75 100 100];  % low, medium, high
promjena_parametri = [-10 -10 -5 0; -5 0 0 5; 0 5 10 10];  % falling, stable, rising

izlaz_parametri = [0 0 25 50; 25 50 50 75; 50 75 100 100]; % small, medium, large

mu_nivo = [
    trapmf(nivo_vode, nivo_parametri(1,:)), ...
    trapmf(nivo_vode, nivo_parametri(2,:)), ...
    trapmf(nivo_vode, nivo_parametri(3,:)) ];

mu_promjena = [
    trapmf(promjena_nivoa, promjena_parametri(1,:)), ...
    trapmf(promjena_nivoa, promjena_parametri(2,:)), ...
    trapmf(promjena_nivoa, promjena_parametri(3,:)) ];

pravila = [
    1 1 3;   % low & falling -> large
    1 2 2;   % low & stable -> medium
    2 2 2;   % medium & stable -> medium
    3 1 1;   % high & falling -> small
    3 3 1;   % high & rising -> small
];

y = 0:1:100; 
agg = zeros(size(y));

for i = 1:size(pravila,1)
    nivo_idx = pravila(i,1);
    promjena_idx   = pravila(i,2);
    izlaz_idx = pravila(i,3);

    w = min(mu_nivo(nivo_idx), mu_promjena(promjena_idx));

    switch izlaz_idx
        case 1, mf = izlaz_parametri(1,:);
        case 2, mf = izlaz_parametri(2,:);
        case 3, mf = izlaz_parametri(3,:);
    end
    mu_izlaz = arrayfun(@(yy) trapmf(yy, izlaz_parametri(pravila(i,3),:)), y);
    agg = max(agg, w * mu_izlaz);
end

izlaz = sum(y .* agg) / sum(agg);

fprintf('Za nivo vode = %.1f i promjenu nivoa vode = %.1f - Ulaz vode u spremnik = %.2f%%\n', ...
    nivo_vode, promjena_nivoa, izlaz);

figure;
plot(y, agg, 'LineWidth', 2); 
grid on;
xlabel('Otvorenost ulaza (%)'); 
ylabel('Stepen pripadnosti');
title('Agregirani izlaz i rezultat defuzzifikacije');
xline(izlaz, '--r', sprintf('%.2f%%', izlaz), 'LineWidth', 1.5);

figure('Name', 'Fuzzy Upravljanje razinom vode', 'NumberTitle', 'off');

subplot(3,1,1);
hold on; grid on; title('Stepen pripadnosti: Nivo vode');
colors = ['b', 'g', 'r'];
labels = {'low','medium','high'};
for i = 1:3
    plot(y, arrayfun(@(yy) trapmf(yy, nivo_parametri(i,:)), y), colors(i), 'DisplayName', labels{i});
end
xline(nivo_vode,'--k','Ulaz'); legend;

subplot(3,1,2);
hold on; grid on; title('Stepen pripadnosti: Promjena nivoa vode');
x2 = -10:0.5:10;
labels2 = {'falling','stable','rising'};
for i = 1:3
    plot(x2, arrayfun(@(x) trapmf(x, promjena_parametri(i,:)), x2), colors(i), 'DisplayName', labels2{i});
end
xline(promjena_nivoa,'--k','Ulaz'); legend;

subplot(3,1,3);
plot(y, agg, 'k', 'LineWidth', 2); grid on;
title('Agregirani izlaz');
xlabel('Otvaranje ulaza (%)');
ylabel('Stepen pripadnosti');
xline(izlaz,'--r',sprintf('Izlaz = %.2f%%',izlaz));