function [out] = zlozonaKwadraturaNewtona_3_8(a, b, f, n, showSteps)
% Złożona kwadratura Newtona 3/8 (metoda Newtona-Cotesa rzeędu 3, 
% kwadratura Simpsona 1/3)
% Funkcja zwraca wartości kwadratury złożonej Newtona - Cotesa rzędu 2 dla
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
% długości, za pomocą metody Newtona 3/8

R = zeros(1, n);
for i = 1:n
%     N = 2^(i-1) - liczba podprzedziałów
%     H = (b-a)/N - długość podprzedziału
%     y = f(a:H:b) - wartości funkcji f w węzłach
%     R(i)= H/8 * (... % H/8 * (
%           y(1)+ ... % f(a) +
%           y(length(y)) + ... % f(b) +
%           2*sum(f(a+H:H:b-H)) + ... % 2*f(a+kH) od 1 do N-1 +
%           3*sum(f(a+H/3:H:b-H+H/3)) + ... % 3*f(a+kH+H/3) od 0 do N-1 +
%           3*sum(f(a+2*H/3:H:b-H+2*H/3))); % 3*f(a+kH+2H/3) od 0 do N-1 )
    H = (b-a)/(2^(i-1));
    y = f(a:H:b);
    R(i)=sum(y(1:length(y)-1)+y(2:length(y))+3*f((a+H/3:H:b-H+H/3))+3*f((a+2*H/3:H:b-H+2*H/3)))*H/8;
end

if showSteps
    fprintf("Ekstrapolacja nr 1:")
    disp(R);
end

out = R;

end