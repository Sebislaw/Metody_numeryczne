function [] = przyklad5()
% Promień spektralny macierzy iteracji w metodzie SOR, GS i J zależy od
% macierzy A (i od parametru relaksacji dla SOR). Ten przykład ilustruje,
% jaką wartość ma promień spektralny macierzy iteracji dla każdej
% z tych metod dla różnych macierzy symetrycznych i dodatnio określonych
% postaci A = [1 a; a 1], w zależności od zmiennej a. Dla metody SOR
% parametr relaksacji jest dobrany tak, aby promień spektralny macierzy
% iteracji był minimalny. Celem jest pokazanie, że metoda SOR w
% odpowiednich warunkach jest lepsza od metody GS i J.

% Dane
a = linspace(0, 1, 1000);

% Rysowanie wykresu
figure
hold on

promienSpektralny = zeros(1, length(a));
for i = 1:length(a)
    A = [1 a(i); a(i) 1];
    [promienSpektralny(i), ~] = SORInformacje(A, optymalnyParametrSOR(A), 0.1);
end
plot(a, promienSpektralny, 'Color', [0.9290 0.6940 0.1250], 'LineWidth', 2)

promienSpektralny = zeros(1, length(a));
for i = 1:length(a)
    A = [1 a(i); a(i) 1];
    [promienSpektralny(i), ~] = GSInformacje(A, 0.1);
end
plot(a, promienSpektralny, 'Color', 'blue', 'LineWidth', 2)

promienSpektralny = zeros(1, length(a));
for i = 1:length(a)
    A = [1 a(i); a(i) 1];
    [promienSpektralny(i), ~] = JInformacje(A, 0.1);
end
plot(a, promienSpektralny, 'Color', 'magenta', 'LineWidth', 2)

legend("metoda SOR","metoda Gaussa-Seidla","metoda Jacobiego")
title({'Wartość promienia spektralnego macierzy iteracji dla metod:','SOR z otymalnym parametrem relaksacji, Gaussa-Seidla i Jacobiego',' w zależności od zmiennej a dla macierzy A=[1 a; a 1]'}, 'FontSize', 14)
xlabel('a')
ylabel('Wartość promienia spektralnego')
hold off

end