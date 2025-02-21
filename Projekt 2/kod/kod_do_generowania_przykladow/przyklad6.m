function [] = przyklad6()
% Ten przykład ilustruje twierdzenia Khana, czyli następujący fakt: 
% promień spektralny macierzy iteracji SOR jest >= |w-1|.

% Dane
w = linspace(-1, 3, 1000);

% Rysowanie wykresu
figure
hold on

y = zeros(1, length(w));
for i = 1:length(w)
    y(i) = abs(w(i)-1);
end
plot(w, y, 'Color', 'green', 'LineWidth', 5)

A = [1 0.1; 0.1 1];
promienSpektralny = zeros(1, length(w));
for i = 1:length(w)
    [promienSpektralny(i), ~] = SORInformacje(A, w(i), 0.1);
end
plot(w, promienSpektralny, 'Color', 'magenta', 'LineWidth', 2)

A = [1 0.9; 0.9 1];
promienSpektralny = zeros(1, length(w));
for i = 1:length(w)
    [promienSpektralny(i), ~] = SORInformacje(A, w(i), 0.1);
end
plot(w, promienSpektralny, 'Color', 'blue', 'LineWidth', 2)

A = [5 5; 5 5];
promienSpektralny = zeros(1, length(w));
for i = 1:length(w)
    [promienSpektralny(i), ~] = SORInformacje(A, w(i), 0.1);
end
plot(w, promienSpektralny, 'Color', [0.9290 0.6940 0.1250], 'LineWidth', 2)

legend("|w-1|", "p(B_{SOR}), A=[1 0.1; 0.1 1]", "p(B_{SOR}), A=[1 0.9; 0.9 1]", "p(B_{SOR}), A=[5 5; 5 5]")
title({'Wartość promienia spektralnego macierzy iteracji w metodzie SOR','w zależności od parametru relaksacji dla macierzy różnych macierzy'}, 'FontSize', 14)
xlabel('Parametr relaksacji')
ylabel('Wartości promienia spektralnego')
hold off

end