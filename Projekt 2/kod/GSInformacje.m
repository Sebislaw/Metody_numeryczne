function [promienSpektralny, iloscPotrzebnychIteracji] = GSInformacje(A, dokladnosc)
% Funkcja przyjmuje:
% A - macierz kwadratowa
% dokladnosc - oczekiwana dokładność wyniku
% Funkcja zwraca:
% promienSpektralny - promień spektralny macierzy iteracji w metodzie
% Gaussa-Seidla
% iloscPotrzebnychIteracji - szacowana jedynine na podstawie promienia spektralnego 
% ilość iteracji potrzebnych do otrzymania wyniku z określoną
% dokładnością w metodzie Gaussa-Seidla

% Obliczenia
LD = tril(A);
U = A - LD;
G = -LD\U;
promienSpektralny = max(abs(eig(G)));
iloscPotrzebnychIteracji = log(dokladnosc)/log(promienSpektralny);

%Jeśli wyliczona liczba iloscPotrzebnychIteracji jest mniejsza od 0, to
% iloscPotrzebnychIteracji przyjmuje wartość Inf, co ma sygnalizować,
% że metoda jest rozbieżna dla danej macierzy A.
if iloscPotrzebnychIteracji < 0
    iloscPotrzebnychIteracji = Inf;
end