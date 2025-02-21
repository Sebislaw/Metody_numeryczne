function [] = rysujWykresRombergBlad(a, b, funkcje, n)
% Funkcja rysuje wykres z błędami przybliżenia całki z 5 różnych funkcji
% za pomocą metody romberga opartej na kwadraturach
% (trapezów, prostokątów, Simpsona, Newtona 3/8).
% Błąd bezwzględny dla kwadratur Newtona-Cotesa rzędu 1, 2, 3, kwadratury
% prostokątów i dla ilości podprzedziałów przedziału [a, b] 
% równej 2^(i-1) dla i = 1,2,...,n.
% Celem jest pokazanie, że ta metoda zachowuje cechy kwadratur pokazane w
% funkcji 'rysujWykresKwadraturyBlad', ale jednoczeście przespiesza
% zbieżność wyniku.

figure,
hold on
plot(1:n, zeros(1, n), 'Color', 'red')
for j = 1:5
f = funkcje{j};
I = integral(f, a, b);

% Metoda Romberga
T = zeros(4, n);
for i = 1:n
    T(1, i) = romberg(a, b, f, i, @zlozonaKwadraturaProstokatow, false);
    T(2, i) = romberg(a, b, f, i, @zlozonaKwadraturaTrapezow, false);
    T(3, i) = romberg(a, b, f, i, @zlozonaKwadraturaSimpsona, false);
    T(4, i) = romberg(a, b, f, i, @zlozonaKwadraturaNewtona_3_8, false);
end
scatter(repmat(1:n, 1, 4), I-[T(1, :),T(2, :),T(3, :),T(4, :)], ...
    50, 'green', 'filled', 'MarkerFaceAlpha',.8,'MarkerEdgeAlpha',.8)

% Kwadratury
T = zeros(4, n);
T(1, :) = zlozonaKwadraturaProstokatow(a, b, f, n, false);
for i = 1:n
    T(2, i) = zlozonaKwadraturaNewtonaCotesa(a, b, f, i, 1, false);
    T(3, i) = zlozonaKwadraturaNewtonaCotesa(a, b, f, i, 2, false);
    T(4, i) = zlozonaKwadraturaNewtonaCotesa(a, b, f, i, 3, false);
end
scatter(repmat(1:n, 1, 4), I-[T(1, :),T(2, :),T(3, :),T(4, :)], ...
    50, 'magenta', 'filled', 'MarkerFaceAlpha',.4,'MarkerEdgeAlpha',.4)



end
legend("błąd=0", "metoda Romberga", "kwadratury")
title('Błąd kwadratury dla ilości podprzedziałów równej 2^n^-^1', 'FontSize', 14)
xlabel('n')
ylabel('Wartosci błędu')
annotation('textbox',[0.6 0.2 0.3 0.3],'String', ...
    ["Funkcje na przedziale [-1, 5]:", "sin(x)","0.5*x^4-x^3-x^2+5","1.55^x", ...
    "x^3*cos(sin(5*x))","(x^2+5)^{cos(x^2)}"],'FitBoxToText','on');
hold off

end