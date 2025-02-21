function [out, error, iterations] = rombergZWarunkiemStopu(a, b, f, n, kwadratura, showSteps, tolerancja, krokiMin)
% Funkcja wyznacza przybliżoną wartość całki za pomocą metody Romberga.
% Dla pierwszej iteracji zewnętrznej pętli (j = 1) wektor R przyjmuje
% postać pierwszego wiersza tablicy Romberga R=(R0,0, R1,0, ..., Rn,0).
% Każda kolejna iteracja nadpisuje n-j+1 pierwszych elementów R, zatem
% końcowy wektor R=(Rn,n, Rn,n-1, ..., Rn,0). Aby wypisać całą tablicę
% Romberga należy ustawić 'showSteps' na true. Funkcja przestaje wykonywać
% obliczenia, gdy szacowana wartość błędu przybliżenia wyniku jest mniejsza
% lub równa 'tolarancja'. Dodatkowo funkcja zwraca oszacowany błąd
% przybliżenia wyniku. Z testowania wynika, że sprawdzanie warunku 
% showSteps i warunku stopu wpływają na szybkość działania funkcji w bardzo
% niewielkim stopniu.
% IN:
% a - początek przedziału
% b - koniec przedziału
% f - funkcja pod całką
% n - ilość ekstrapolacji (przyjmując, że wyznaczanie pierwszego wiersza 
% tablicy to pierwsza ekstrapolacja)
% kwadratura - złożona kwadratura użyta do obliczenia początkowej wartości
% wektora R.
% showSteps - wyświetla wynik obliczeń
% tolerancja - funkcja kończy obliczenia, jeśli szacowany błąd przybliżenia
% jest mniejszy niż ta liczba
% krokiMin - liczba ekstrapolacji, po których funkcja zakończy może 
% zakończyć działanie
% OUT:
% out - obliczone wartości całki funkcji f na przedziale [a, b] za pomocą
% wybranej kwadratury, przy wykonaniu co najwyżej n ekstapolacji
% error - szacowany błąd przybliżenia wartości całki
% iterations - liczba ekstrapolacji wykonanych, zanim funkcja zakończyła
% obliczenia

R = kwadratura(a, b, f, n, showSteps);
iterations = 0;
error = Inf;
for j = 1:n-1
    for i = 1:n-j
        R(i) = R(i+1) + (1/((4^j)-1)) * (R(i+1) - R(i));
    end
    if showSteps
        fprintf("Ekstrapolacja nr %g:",j+1);
        disp(R(1:n-j));
    end

    iterations = j;
    % warunek zatrzymania - R(n-j) to najlepsze przybliżenie obecnej
    % ekstrapolacji, a R(n-j+1) to najlepsze przybliżenie poprzedniej
    % ekstrapolacji
    error = abs(R(n-j) - R(n-j+1))/max(1, abs(R(n-j)));
    if (error <= tolerancja && krokiMin <= j)
        if showSteps
            fprintf("Szacowana wartość błędu przybliżenia: %g", error);
            disp(" ");
        end
        R(1) = R(n-j); % R(n-j) to nejlepsze przybliżenie, R(1) to wynikowa wartość
        break;
    end


end
out = R(1);
end
