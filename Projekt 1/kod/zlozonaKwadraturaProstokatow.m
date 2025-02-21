function [out] = zlozonaKwadraturaProstokatow(a, b, f, n, showSteps)
% Złożona kwadratura prostokątów (z punktem środkowym)
% Funkcja zwraca wartości kwadratury złożonej prostokątów dla
% liczby podprzedziałów przedziału [a, b] równej 1, 2, 4, 8, ..., 2^(n-1).
% IN:
% a - początek przedziału
% b - koniec przedziału
% f - funkcja pod całką
% n - liczba określająca maksymalną ilość podprzedziałów przedziału 
% [a, b], która jest równa 2^(n-1), jak i długość wektora wynikowego
% showSteps - wyświetla wynik obliczeń
% OUT:
% out - obliczone wartości kwadratury funkcji f na przedziale [a, b], 
% podzielonym na 2^(i-1), gdzie i = 1, 2, ... n, podprzedziałów równej 
% długości, za pomocą metody prostokątów (z punktem środkowym)


R = zeros(1, n);
for i = 1:n
%     N = 2^(i-1) - liczba podprzedziałów
%     H = (b-a)/N - długość podprzedziału
%     y = f(a:H:b) - wartości funkcji f w węzłach
    H = (b-a)/(2^(i-1));
    R(i)= H * sum(f(a+H/2:H:b-H+H/2)); % H * f(a+kH+H/2) od 0 do N-1
end

if showSteps
    fprintf("Ekstrapolacja nr 1:")
    disp(R);
end

out = R;

end