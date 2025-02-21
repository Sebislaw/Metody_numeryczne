function [] = rysujWykresWartosciDlaRoznychPrzedzialow(funkcja, n, iloscZwiekszenPrzedzialu)
% Funkcja rysuje wykres z dokładną wartością całki, wartością przybliżoną
% metodą Romberga opartej na złożonej kwadraturze trapezów i wartością
% przybliżoną złożoną kwadraturą trapezów na coraz większych przedziałach
% wielkości [-5*i, 5*i] dla i=1, 2, ..., 50. Celem jest pokazanie, że
% metoda Romberga ma pozytywny wpływ na szybkość zbieżności wyniku oraz, że
% na większych przedziałach błędy obu technik numerycznych się zwiększają.

bladRomberga = zeros(1, iloscZwiekszenPrzedzialu);
dokladnaWartosc = zeros(1, iloscZwiekszenPrzedzialu);
bladTrapezow = zeros(1, iloscZwiekszenPrzedzialu);
for i = 1:iloscZwiekszenPrzedzialu
    a = -5 * i;
    b = 5 * i;
    dokladnaWartosc(i) = integral(funkcja, a, b);
    bladRomberga(i) = romberg(a, b, funkcja, n, @zlozonaKwadraturaTrapezow, false);
    bladTrapezow(i) = zlozonaKwadraturaNewtonaCotesa(a, b, funkcja, n, 1, false);
end
figure
hold on
plot(1:iloscZwiekszenPrzedzialu, dokladnaWartosc, "red")
plot(1:iloscZwiekszenPrzedzialu, bladRomberga, "blue")
plot(1:iloscZwiekszenPrzedzialu, bladTrapezow, "green")
scatter(1:iloscZwiekszenPrzedzialu, dokladnaWartosc, 10, 'red', 'filled', 'MarkerFaceAlpha',.5)
scatter(1:iloscZwiekszenPrzedzialu, bladRomberga, 10, 'blue', 'filled', 'MarkerFaceAlpha',.5)
scatter(1:iloscZwiekszenPrzedzialu, bladTrapezow, 10, 'green', 'filled', 'MarkerFaceAlpha',.5)
legend("wartość dokładna", "metoda Romberga", "kwadratura trapezów", "Location", "northwest")
title('Przybliżenie wartości całki dla n=5 na przedziale [-5*i, 5*i]', 'FontSize', 14)
xlabel('i')
ylabel('Wartosć całki dla funkcji cos(x)+x')
hold off

end