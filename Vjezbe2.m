% 1

x = 15.75;

x = single(x);

y = int16(2500);

whos y;

s = "MATLAB je mocan alat";

len = strlength(s);

disp("Len: " + mat2str(len));

% 2

auto = struct('marka', 'audi', 'godina_proizvodnje', 2015, 'cijena', 30000);

disp(auto);

auto.boja = 'crna';

disp(auto);

cell_arr = {'text', 10, [1,2,3]};

disp(cell_arr);

% 3

a = 30;
b = -15;

z = a + b;
r = a - b;
p = a * b;
k = a / b;

disp("Z: " + mat2str(z) + " R: " + mat2str(r) + " P: " + mat2str(p) + " K: " + mat2str(k));

if (a > 0 && b > 0)
    disp("Da");
else
    disp("Ne");
end