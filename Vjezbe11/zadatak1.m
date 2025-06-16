skladista_table = readtable('skladista.csv');
skladista = skladista_table.Skladiste;           
kapaciteti = skladista_table.Kapacitet;         

centri_table = readtable('prodajni_centri.csv');
centri = centri_table.Centar;                    
potraznja = centri_table.Potraznja;            

troskovi_table = readtable('troskovi_transporta.csv', 'ReadRowNames', true);

[~, idx_skladista] = ismember(skladista, troskovi_table.Properties.RowNames);
troskovi_table = troskovi_table(idx_skladista, :);

[~, idx_centri] = ismember(centri, troskovi_table.Properties.VariableNames);
troskovi_table = troskovi_table(:, idx_centri);

troskovi = table2array(troskovi_table);

n_skladista = length(skladista);
n_centri = length(centri);

f = troskovi(:);

A_ub = zeros(n_skladista, n_skladista * n_centri);
for i = 1:n_skladista
    A_ub(i, (i-1)*n_centri+1:i*n_centri) = 1;
end
b_ub = kapaciteti;

A_eq = zeros(n_centri, n_skladista * n_centri);
for j = 1:n_centri
    for i = 1:n_skladista
        A_eq(j, (i-1)*n_centri + j) = 1;
    end
end
b_eq = potraznja;

lb = zeros(n_skladista * n_centri, 1);
ub = [];

options = optimoptions('linprog','Display','none');
[x, fval] = linprog(f, A_ub, b_ub, A_eq, b_eq, lb, ub, options);

X = reshape(x, n_centri, n_skladista)';

broj_aktivnih_ruta = sum(X(:) > 0);
disp('Optimalna raspodjela (jedinica po ruti):');
disp(array2table(X, 'VariableNames', centri, 'RowNames', skladista));

fprintf('Ukupni trošak: %.2f KM\n', fval);
fprintf('Ukupni kapacitet skladišta: %.2f\n', sum(b_ub));
fprintf('Ukupna potražnja prodajnih centara: %.2f\n', sum(b_eq));
fprintf('Broj aktivnih ruta: %d\n', broj_aktivnih_ruta);