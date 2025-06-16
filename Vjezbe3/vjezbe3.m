% 1

a = 10;
b = 5;

zbir = a + b;
razlika = a - b;
proizvod = a * b;

disp(["Zbir: ", num2str(zbir)]);
disp(["Razlika: ", num2str(razlika)]);
disp(["Proizvod: ", num2str(proizvod)]);

if b ~= 0
    kolicnik = a / b;
    disp(["Kolicnik: ", num2str(kolicnik)]);
else
    disp("Greska");
end

% 2

rez = faktorijel(5);
disp(["Faktorijel: ", num2str(rez)]);

% 3

zbir_parnih = 0;
br = 2;

while br <= 100
    zbir_parnih = zbir_parnih + br;
    br = br + 2;
end

disp(["Zbir parnih: ", num2str(zbir_parnih)]);

% 4

is_prost = jeste_prost(82);
disp(["Prost: ", is_prost]);

% 5

for i = 1:100
    if mod(i, 3) == 0
        disp(num2str(i));
    end
end

