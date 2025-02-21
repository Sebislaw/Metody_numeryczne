function [out] = zlozonaKwadraturaTrapezow(a, b, f, n, showSteps)
% Złożona kwadratura trapezów (metoda Newtona-Cotesa rzeędu 1)
% Funkcja zwraca wartości kwadratury złożonej Newtona - Cotesa rzędu 1 dla
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
% długości, za pomocą metody trapezów

R = zeros(1, n);
for i = 1:n
%     N = 2^(i-1) - liczba podprzedziałów
%     H = (b-a)/N - długość podprzedziału
%     y = f(a:H:b) - wartości funkcji f w węzłach
%     R(i)= H/2 * ( ... % H/2 * (
%           y(1) + ... % f(a) +
%           y(length(y)) + ... % f(b) +
%           2*sum(f(a+H:H:b-H))); % 2*f(a+kH) od 1 do N-1 )
    H = (b-a)/(2^(i-1));
    y = f(a:H:b);
    R(i)=sum(y(1:length(y)-1)+y(2:length(y)))*H/2;
end

if showSteps
    fprintf("Ekstrapolacja nr 1:")
    disp(R);
end

out = R;

end