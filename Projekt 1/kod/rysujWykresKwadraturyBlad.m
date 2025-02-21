function [] = rysujWykresKwadraturyBlad(a, b, funkcje, n)
% Funkcja rysuje wykres z błędami przybliżenia całki z 5 różnych funkcji
% za pomocą kwadratur (trapezów, prostokątów, Simpsona, Newtona 3/8).
% Błąd bezwzględny dla kwadratur Newtona-Cotesa rzędu 1, 2, 3, kwadratury
% prostokątów i dla ilości podprzedziałów przedziału [a, b] 
% równej 2^(i-1) dla i = 1,2,...,n.
% Celem jest pokazanie, że dla różnych funkcji wybrane kwadratury zbiegają
% w stale ustalonej kolejności (ze względu na szybkość zanikania błędu do
% 0) oraz, że błędy są albo ujemne, albo dodatnie.

figure,
hold on
plot(1:n, zeros(1, n), 'Color', 'red')
for j = 1:5
f = funkcje{j};
I = integral(f, a, b);
T = zeros(4, n);
T(1, :) = zlozonaKwadraturaProstokatow(a, b, f, n, false);
for i = 1:n
    T(2, i) = zlozonaKwadraturaNewtonaCotesa(a, b, f, i, 1, false);
    T(3, i) = zlozonaKwadraturaNewtonaCotesa(a, b, f, i, 2, false);
    T(4, i) = zlozonaKwadraturaNewtonaCotesa(a, b, f, i, 3, false);
end
scatter(1:n, I-T(1, :), 50, 'blue', 'filled', 'MarkerFaceAlpha',.5,'MarkerEdgeAlpha',.5)
scatter(1:n, I-T(2, :), 50, [0.9290 0.6940 0.1250], 'filled', 'MarkerFaceAlpha',.5,'MarkerEdgeAlpha',.5)
scatter(1:n, I-T(3, :), 50, 'green', 'filled', 'MarkerFaceAlpha',.5,'MarkerEdgeAlpha',.5)
scatter(1:n, I-T(4, :), 50, 'magenta', 'filled', 'MarkerFaceAlpha',.5,'MarkerEdgeAlpha',.5)
end
legend("błąd=0", "kwadratura prostokątów", "kwadratura trapezów", ...
    "kwadratura Simpsona", "kwadratura Newtona 3/8")
title('Błąd kwadratury dla ilości podprzedziałów równej 2^n^-^1', 'FontSize', 14)
xlabel('n')
ylabel('Wartosci błędu')
annotation('textbox',[0.6 0.2 0.3 0.3],'String', ...
    ["Funkcje na przedziale [-1, 5]:", "sin(x)","0.5*x^4-x^3-x^2+5","1.55^x", ...
    "x^3*cos(sin(5*x))","(x^2+5)^{cos(x^2)}"],'FitBoxToText','on');
hold off

end