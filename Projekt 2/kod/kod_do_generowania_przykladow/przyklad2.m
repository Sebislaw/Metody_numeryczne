function [] = przyklad2()
% Jeśli w nie jest w przedziale (0, 2), to metoda SOR nie jest zbieżna.
% Ten przykłąd ilustruje rozbieżność SOR dla wybranych parametrów
% relaksacji.

% Dane
A = [0.5 2 4 5; 4 15 2 4; 5 4 -17 2; 0.5 0.4 0.3 5];
b = [-387.5 325 750 -335];
w = [-1.5 -1.45 3 3.1];
liczbaIteracji = 20;
n = length(A(1,:));
D = diag(diag(A));
L = tril(A)-D;
U = triu(A)-D;
kolor = {'green', 'red', 'blue', 'magenta'};

% Rysowanie wykresu
figure,
hold on
for j = 1:length(w) 
    X = zeros(n, 1);
    B = ((D+w(j)*L)^(-1))*((1-w(j))*D-w(j)*U);
    c = w(j)*(D+w(j)*L)^(-1)*b';
    W = zeros(n, liczbaIteracji+1);
    legenda(j) = plot(nan, nan, kolor{j});
    legendaNapis{j} = sprintf('w=%0.5g', w(j));
    for i = 1:liczbaIteracji
        X = B*X+c;
        W(:, i+1) = X;
    end
    plot(0:liczbaIteracji, W(1, :), 'Color', kolor{j})
    plot(0:liczbaIteracji, W(2, :), 'Color', kolor{j})
    plot(0:liczbaIteracji, W(3, :), 'Color', kolor{j})
    plot(0:liczbaIteracji, W(4, :), 'Color', kolor{j})
    scatter(0:liczbaIteracji, W(1, :), 50, kolor{j}, 'filled', 'MarkerFaceAlpha',.2,'MarkerEdgeAlpha',.5)
    scatter(0:liczbaIteracji, W(2, :), 50, kolor{j}, 'filled', 'MarkerFaceAlpha',.2,'MarkerEdgeAlpha',.5)
    scatter(0:liczbaIteracji, W(3, :), 50, kolor{j}, 'filled', 'MarkerFaceAlpha',.2,'MarkerEdgeAlpha',.5)
    scatter(0:liczbaIteracji, W(4, :), 50, kolor{j}, 'filled', 'MarkerFaceAlpha',.2,'MarkerEdgeAlpha',.5)
end
legend(legenda, legendaNapis)
title('Wyznaczanie wektora x w równaniu Ax=b metodą SOR', 'FontSize', 14)
xlabel('Iteracja')
ylabel('Wartości współrzędnych wektora x')
hold off

end