function R = zlozonaKwadraturaNewtonaCotesa(a, b, f, n, rzad, showSteps)
% Funkcja zwraca wartość kwadratury złożonej Newtona - Cotesa rzędu
% (rzad+1), obliczonej dla N = 2^(n-1) podprzediałów równej długości.
% IN:
% a - początek przedziału
% b - koniec przedziału
% f - funkcja pod całką
% n - liczba określająca ilość podprzedziałów przedziału [a, b], która jest
% równa 2^(n-1)
% rzad - rząd kwadratury złożenej Newtona - Cotesa i tym samym liczba,
% przyjmuje wartości: 1, 2, 3, 4, 5, 6
% węzłów w odpowiadającej kwadraturze złożonej kwadraturze prostej
% pomniejszona o 1
% showSteps - wyświetla wynik obliczeń
% OUT:
% out - obliczona wartość kwadratury funkcji f na przedziale [a, b], 
% podzielonym na 2^(n-1) podprzedziałów równej długości, za pomocą metody 
% Newtona - Cotesa rzędu 'rzad'

N = 2^(n-1); % liczba podrzedziałów
% Macierz z wagami w metodzie Newtona - Cotesa
% sum(licznik(rzad)) / mianownik = 1
% wartość mianownika dla rzędu < 
mianownik = [0; 2; 6; 8; 90; 288; 840];
licznik = [0,  0,   0,  0,   0,  0;
           2,  0,   0,  0,   0,  0;
           2,  4,   0,  0,   0,  0;
           2,  3,   3,  0,   0,  0;
           14, 32,  12, 32,  0,  0;
           38, 75,  50, 50,  75, 0;
           82, 216, 27, 272, 27, 216];
H = (b-a)/N; % długość podprzedziałów
x = (a + H*(0:N-1)) + (0:rzad-1)'*(H/(rzad)); % węzły

R = (sum(licznik(rzad+1,1:rzad)*f(x)) + licznik(rzad+1,1)/2*(f(b) - f(a))) * H/mianownik(rzad+1);

if showSteps
    fprintf("Brak ulepszenia:")
    disp(R);
end