function [promienSpektralny, iloscPotrzebnychIteracji] = SORInformacje(A, w, dokladnosc)
% Funkcja przyjmuje:
% A - macierz kwadratowa
% w - parametr relaksacji w metodzie SOR
% dokladnosc - oczekiwana dokładność wyniku
% Funkcja zwraca:
% promienSpektralny - promień spektralny macierzy iteracji w metodzie SOR
% iloscPotrzebnychIteracji - szacowana jedynine na podstawie promienia 
% spektralnego ilość iteracji potrzebnych do otrzymania wyniku
% z określoną dokładnością w metodzie SOR

% Obliczenia
D = diag(diag(A));
L = tril(A) - D;
U = triu(A) - D;
T = (w*L + D)\((1-w)*D - w* U);
promienSpektralny = max(abs(eig(T)));
iloscPotrzebnychIteracji = log(dokladnosc)/log(promienSpektralny);

%Jeśli wyliczona liczba iloscPotrzebnychIteracji jest mniejsza od 0, to
% iloscPotrzebnychIteracji przyjmuje wartość Inf, co ma sygnalizować,
% że metoda jest rozbieżna dla danej macierzy A.
if iloscPotrzebnychIteracji < 0
    iloscPotrzebnychIteracji = Inf;
end