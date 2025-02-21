function [] = rysujWykresCzasuWykonaniaRomberga(a, b, funkcja, n)
% Funkcja rysuje wykres czasu wykonania zaimplementowanej metody Romberga.

czasWykonania = zeros(1, n);
for i = 1:n
    czasWykonania(i) = timeit(@() romberg(a, b, funkcja, i, @zlozonaKwadraturaTrapezow, false));
    fprintf("%g  ", i, czasWykonania(i));
    disp(" ");
end

figure
hold on
plot(1:n, czasWykonania(1:n), "Color", "blue")
scatter(1:n, czasWykonania(1:n), 10, "blue", 'filled', 'MarkerFaceAlpha',.25,'MarkerEdgeAlpha',.25)
title({'Czas wykonania się metody Romberga dla danego n','i fukcji sin(x) na przedziale [-1, 5]'}, 'FontSize', 14)
xlabel('n')
ylabel('Czas wykonania (sekundy)')
xlim([1, n])
hold off

end