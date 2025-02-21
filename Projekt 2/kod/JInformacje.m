function [promienSpektralny, iloscPotrzebnychIteracji] = JInformacje(A, dokladnosc)
% Funkcja przyjmuje:
% A - macierz kwadratowa
% dokladnosc - oczekiwana dokładność wyniku
% Funkcja zwraca:
% promienSpektralny - promień spektralny macierzy iteracji w metodzie
% Jacobiego
% iloscPotrzebnychIteracji - szacowana jedynine na podstawie promienia spektralnego
% ilość iteracji potrzebnych do otrzymania wyniku z określoną
% dokładnością w metodzie Jacobiego

% Obliczenia
D = diag(diag(A));
B_j = D\(D - A);
promienSpektralny = max(abs(eig(B_j)));
iloscPotrzebnychIteracji = log(dokladnosc)/log(promienSpektralny);

%Jeśli wyliczona liczba iloscPotrzebnychIteracji jest mniejsza od 0, to
% iloscPotrzebnychIteracji przyjmuje wartość Inf, co ma sygnalizować,
% że metoda jest rozbieżna dla danej macierzy A.
if iloscPotrzebnychIteracji < 0
    iloscPotrzebnychIteracji = Inf;
end