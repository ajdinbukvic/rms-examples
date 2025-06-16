% Zadatak 1

fs = 1000;                  
N = 1000;                  
t = 0:1/fs:1-1/fs;         

originalni_signal = randn(1, N);

fc = 500;                          
[b, a] = butter(4, 0.2, 'high'); 

filtrirani_signal = filter(b, a, originalni_signal);

originalni_signal_fft = abs(fft(originalni_signal));
filtrirani_signal_fft = abs(fft(filtrirani_signal));
f = (0:N-1)*(fs/N);

figure;
subplot(2,2,1);
plot(t, originalni_signal);
title('Originalni signal');
xlabel('Vrijeme (s)');
ylabel('Amplituda');

subplot(2,2,2);
plot(t, filtrirani_signal);
title('Filtrirani signal');
xlabel('Vrijeme (s)');
ylabel('Amplituda');

subplot(2,2,3);
plot(f, originalni_signal_fft);
title('Spektar originalnog signala');
xlabel('Frekvencija (Hz)');
ylabel('Magnituda');

subplot(2,2,4);
plot(f, filtrirani_signal_fft);
title('Spektar filtriranog signala');
xlabel('Frekvencija (Hz)');
ylabel('Magnituda');

% Zadatak 2

N = 5000;
signal = randn(1, N);

interval = 200;
for i = 1:interval:N
    signal(i) = signal(i) + 10; 
end

[peaks, locs] = findpeaks(signal, 'MinPeakHeight', 5);

figure;
subplot(2,1,1);
plot(signal);
title('Originalni signal s impulsima');
xlabel('Uzorak');
ylabel('Amplituda');

subplot(2,1,2);
stem(locs, peaks, 'g');
title('Detektovani impulsi');
xlabel('Uzorak');
ylabel('Amplituda');