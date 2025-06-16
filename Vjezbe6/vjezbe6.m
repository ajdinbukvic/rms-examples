% 1

knjige = struct('Naslov', {'Knjiga 1' 'Knjiga 2' 'Knjiga 3'}, 'Autor', {'Autor 1' 'Autor 2' 'Autor 3'}, 'Godina', {2000 2007 2018});

save('knjige.mat', 'knjige');

clear;
knjige_load = load('knjige.mat');
knjige_table = struct2table(knjige_load);

disp('Podaci o knjigama:');
disp(knjige_table);

% 2

data = readtable('zaposlenici.csv');

prosjecnaPlata = mean(data.Plata);

fileID = fopen('izvjestaj.txt', 'w');
fprintf(fileID, 'Prosjecna plata zaposlenika je: %.2f KM\n', prosjecnaPlata);
fclose(fileID);

disp('Prosjecna plata zaposlenika:');
disp(prosjecnaPlata);

% 3

fileID = fopen('studenti.txt', 'r');

disp('Studenti i njihove ocjene:');
while ~feof(fileID)
    line = fgetl(fileID);
    if ischar(line)
        data = split(line); 
        fprintf('%-10s %s\n', data{1}, data{2}); 
    end
end

fclose(fileID);

% 4

gradovi = {'Zenica', [15, 20, 22, 18, 25]; 
           'Tuzla', [10, 14, 19, 21, 23];
           'Sarajevo', [18, 25, 30, 28, 32]};

najvisaTemp = -inf;
najnizaTemp = inf;
gradMax = '';
gradMin = '';

for i = 1:size(gradovi, 1)
    temp = gradovi{i, 2};
    maxTemp = max(temp);
    minTemp = min(temp);
    
    if maxTemp > najvisaTemp
        najvisaTemp = maxTemp;
        gradMax = gradovi{i, 1};
    end
    
    if minTemp < najnizaTemp
        najnizaTemp = minTemp;
        gradMin = gradovi{i, 1};
    end
end

disp(['Najviša temperatura: ', num2str(najvisaTemp), '°C u ', gradMax]);
disp(['Najniža temperatura: ', num2str(najnizaTemp), '°C u ', gradMin]);

fileTempID = fopen('temperatura.txt', 'w');
fprintf(fileTempID, 'Najviša temperatura: %.2f °C u %s\n', najvisaTemp, gradMax);
fprintf(fileTempID, 'Najniža temperatura: %.2f °C u %s\n', najnizaTemp, gradMin);
fclose(fileTempID);

% 5

imena = {'Ime1', 'Ime2', 'Ime3', 'Ime4', 'Ime5', 'Ime6', 'Ime7', 'Ime8', 'Ime9', 'Ime10'};
sportovi = {'Sport1', 'Sport2', 'Sport3', 'Sport4', 'Sport5', 'Sport6', 'Sport7', 'Sport8', 'Sport9', 'Sport10'};
medalje = randi([0, 10], 1, 10); 

T = table(imena', sportovi', medalje', 'VariableNames', {'Ime', 'Sport', 'Medalje'});

writetable(T, 'sportisti.csv');

T_novo = readtable('sportisti.csv');
disp('Podaci o sportistima:');
disp(T_novo);