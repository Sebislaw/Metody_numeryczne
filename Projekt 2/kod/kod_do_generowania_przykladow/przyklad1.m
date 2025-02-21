function [] = przyklad1()
% Metoda rozwiązywania układów równań liniowych SOR jest motodą iteracyjną. 
% Przy konkretnych założeniach wynikowy wektor x w teorii jest coraz 
% bliższy dokładnemu wynikowi równania Ax=b. Ten przykład pokazuje
% zbieżność metody SOR.

% Dane
liczbaIteracji = 50;
A = [0.5 2 4 5; 4 15 2 4; 5 4 -17 2; 0.5 0.4 0.3 5];
b = [-387.5 325 750 -335];
w = 0.5;

% Obliczenia
n = length(A(1,:));
X = zeros(n, 1);
D = diag(diag(A));
L = tril(A)-D;
U = triu(A)-D;
B = ((D+w*L)^(-1))*((1-w)*D-w*U);
c = w*(D+w*L)^(-1)*b';
W = zeros(n, liczbaIteracji+1);
for i = 1:liczbaIteracji
    X = B*X+c;
    W(:, i+1) = X;
end

% Rysowanie wykresu
figure,
hold on
plot(0:liczbaIteracji, W(1, :), 'Color', 'blue')
plot(0:liczbaIteracji, W(2, :), 'Color', '[0.9290 0.6940 0.1250]')
plot(0:liczbaIteracji, W(3, :), 'Color', 'green')
plot(0:liczbaIteracji, W(4, :), 'Color', 'magenta')
scatter(0:liczbaIteracji, W(1, :), 50, 'blue', 'filled', 'MarkerFaceAlpha',.5,'MarkerEdgeAlpha',.5)
scatter(0:liczbaIteracji, W(2, :), 50, [0.9290 0.6940 0.1250], 'filled', 'MarkerFaceAlpha',.5,'MarkerEdgeAlpha',.5)
scatter(0:liczbaIteracji, W(3, :), 50, 'green', 'filled', 'MarkerFaceAlpha',.5,'MarkerEdgeAlpha',.5)
scatter(0:liczbaIteracji, W(4, :), 50, 'magenta', 'filled', 'MarkerFaceAlpha',.5,'MarkerEdgeAlpha',.5)
legend("x_1","x_2","x_3","x_4")
title('Wyznaczanie wektora x w równaniu Ax=b metodą SOR', 'FontSize', 14)
xlabel('Iteracja')
ylabel('Wartości współrzędnych wektora x')
hold off

end