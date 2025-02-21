function [] = przyklad3()
% Promień spektralny macierzy iteracji B_SOR dla ustalonej macierzy A i
% wektora b w rozważanym równaniu Ax=b$zależy od promienia spektralnego 
% macierzy iteracyjnej w metodzie Jacobiego B_J=D:(D-A), gdzie D=diag(A)
% i współczynnika relaksacji w. Ten przykład ilustruje tę zależność.

% Dane
A = [1 0.3; 0.3 1];
w = linspace(0, 2, 1000);

% Rysowanie wykresu
figure
hold on

promienSpektralny = zeros(1, length(w));
for i = 1:length(w)
    [promienSpektralny(i), ~] = SORInformacje(A, w(i), 0.1);
end
plot(w, promienSpektralny, 'Color', 'red')

A = [1 0.5; 0.5 1];
promienSpektralny = zeros(1, length(w));
for i = 1:length(w)
    [promienSpektralny(i), ~] = SORInformacje(A, w(i), 0.1);
end
plot(w, promienSpektralny, 'Color', 'green')

A = [1 0.7; 0.7 1];
promienSpektralny = zeros(1, length(w));
for i = 1:length(w)
    [promienSpektralny(i), ~] = SORInformacje(A, w(i), 0.1);
end
plot(w, promienSpektralny, 'Color', 'blue')

legend("a=0.3","a=0.5","a=0.7")
title({'Wartość promienia spektralnego macierzy iteracji w metodzie SOR','w zależności od parametru relaksacji dla macierzy A=[1 a; a;1]'}, 'FontSize', 14)
xlabel('Parametr relaksacji')
ylabel('Wartości promienia spektralnego')
hold off

end