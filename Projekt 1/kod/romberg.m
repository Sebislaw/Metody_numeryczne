function [out] = romberg(a, b, f, n, kwadratura, showSteps)
% Funkcja wyznacza przybliżoną wartość całki za pomocą metody Romberga.
% Dla pierwszej iteracji zewnętrznej pętli (j = 1) wektor R przyjmuje
% postać pierwszego wiersza tablicy Romberga R=(R0,0, R1,0, ..., Rn,0).
% Każda kolejna iteracja nadpisuje n-j+1 pierwszych elementów R, zatem
% końcowy wektor R=(Rn,n, Rn,n-1, ..., Rn,0). Aby wypisać całą tablicę
% Romberga należy ustawić 'showSteps' na true.
% IN:
% a - początek przedziału
% b - koniec przedziału
% f - funkcja pod całką
% n - ilość ekstrapolacji (przyjmując, że wyznaczanie pierwszego wiersza 
% tablicy to pierwsza ekstrapolacja)
% kwadratura - złożona kwadratura użyta do obliczenia początkowej wartości
% wektora R.
% showSteps - wyświetla wynik obliczeń
% OUT:
% out - obliczone wartości całki funkcji f na przedziale [a, b] za pomocą
% wybranej kwadratury, przy wykonaniu n ekstapolacji

R = kwadratura(a, b, f, n, showSteps);

for j = 1:n-1
    for i = 1:n-j
        R(i) = R(i+1) + (1/((4^j)-1)) * (R(i+1) - R(i));
    end
    if showSteps
        fprintf("Ekstrapolacja nr %g:",j+1);
        disp(R(1:n-j));
    end
end

out = R(1);

end