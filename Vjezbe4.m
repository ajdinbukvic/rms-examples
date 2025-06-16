% 1

v1 = [3,-1,2];
v2 = [-2,4,1];
v3 = [5,6,-2];

skalarni_proizvod = dot(v1,v2);
disp(skalarni_proizvod);

vektorski_proizvod = cross(v1,v2);
disp(vektorski_proizvod);

zbir = v1 + v2 + v3;
disp(zbir);

norma = norm(v3);
disp(norma);

ugao = dot(v1,v2) / (norm(v1) * norm(v2));
disp(ugao);

% 2

A = [2,4,1; 3,6,5; 7,8,9];
B = [5,2,3; 6,1,4; 7,5,9];

produkt = A * B;
disp(produkt);

zbir2 = A + B;
disp(zbir2);

determinanta = det(A);
disp(determinanta);

if det(B) ~= 0
    inverz = inv(B);
    disp(inverz);
else
    disp("Ne postoji");
end

transponovano = A';
disp(transponovano);

% 3

M = [3,4,2; 1,5,6; 7,8,9];
v = [1;2;3];

proizvod = M * v;
disp(proizvod);

proizvod_transponovane = M' * v;
disp(proizvod_transponovane);

determinanta_matrice = det(M);
disp(determinanta_matrice);

kolonasti_vektor = M * v;
disp(kolonasti_vektor);

% 4

v3 = [2,3,-1];
v4 = [4,-2,1];

skalarni = dot(v3,v4);
disp(skalarni);

vektorski = cross(v3,v4);
disp(vektorski);

norma_rezultujuceg = norm(vektorski);
disp(norma_rezultujuceg);

ugao2 = dot(v3,v4) / (norm(v3) * norm(v4));
disp(ugao2);

