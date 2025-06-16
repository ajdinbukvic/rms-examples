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

n_vars = n_skladista * n_centri;

f = troskovi(:);

f_ext = [f; zeros(n_vars, 1)];

A1 = zeros(n_skladista, 2*n_vars);
for i = 1:n_skladista
    A1(i, (i-1)*n_centri+1:i*n_centri) = 1;
end
b1 = kapaciteti;

A2 = zeros(n_centri, 2*n_vars);
for j = 1:n_centri
    for i = 1:n_skladista
        A2(j, (i-1)*n_centri + j) = 1;
    end
end
b2 = potraznja;

M = 1000;
A3 = zeros(n_vars, 2*n_vars);
for i = 1:n_vars
    A3(i,i) = 1;         
    A3(i,n_vars+i) = -M; 
end
b3 = zeros(n_vars, 1);

A4 = zeros(1, 2*n_vars);
A4(1, n_vars+1:end) = 1;
b4 = 5;

A = [A1; A3; A4];
b = [b1; b3; b4];

Aeq = A2;
beq = b2;

lb = zeros(2*n_vars, 1);
ub = [Inf(n_vars, 1); ones(n_vars, 1)];

intcon = (n_vars+1):(2*n_vars);
 
options = optimoptions('intlinprog','Display','off');
[xopt, tval, exitflag] = intlinprog(f_ext, intcon, A, b, Aeq, beq, lb, ub, options);

if exitflag ~= 1
    error('intlinprog nije uspio naći rješenje.');
end

x_vals = xopt(1:n_vars);
y_vals = xopt(n_vars+1:end);

X = reshape(x_vals, n_centri, n_skladista)';
Y = reshape(y_vals, n_centri, n_skladista)';

disp('Raspodjela količina po rutama (jedinica po ruti):');
disp(array2table(X, 'VariableNames', centri, 'RowNames', skladista));

fprintf('Ukupni trošak sa najviše 5 ruta: %.2f KM\n', tval);
fprintf('Ukupni kapacitet skladišta: %.2f\n', sum(b1));
fprintf('Ukupna potražnja prodajnih centara: %.2f\n', sum(b2));
fprintf('Broj aktivnih ruta: %d\n', sum(Y(:)));