function [X, iloscWykonanychIteracji] = SOR(A, b, liczbaIteracji, w, dokladnosc)
% Funkcja przyjmuje:
% A - macierz kwadratowa nxn
% b - wektor długości n
% liczbaIteracji - maksymalna liczba iteracji, którą wykona algorytm
% w - parametr relaksacji w metodzie SOR
% dokladnosc - oczekiwana dokładność wyniku (gdy <=0, to funkcja wykonuje
% wszystkie iteracje określone argumentem 'liczbaIteracji')
% Funkcja zwraca:
% x - szukany wektor w równaniu Ax = b
% iloscWykonanychIteracji- ilość wykonanych iteracji

% Funkcja wyrzuca błąd z informacją "Błędna ilość argumentów.",
% jeśli podana liczba argumantów nie jest równa 5, następnie sprawdza,
% czy rozmiary macierzy A i wektora b są poprawne. Jeśli tak nie jest,
% to rzucany jest błąd z komunikatem ofpowiednio:
% "Macierz A nie jest macierzą kwadratową." i "Nieodpowiedni rozmiar
% wektora b.".
if nargin ~= 5
    error('Błędna ilość argumentów.');
end
n = length(A(1,:));
if length(A(:,1)) ~= n
    error('Macierz A nie jest macierzą kwadratową.');
end
if length(b) ~= n
    error('Nieodpowiedni rozmiar wektora b.');
end

% Po sprawdzeniu poprawności danych algorytm oblicza elementy potrzebne do
% metody SOR. Jeśli się okaże, że promień spektralny macierzy iteracji jest
% większy lub równy 1, to funkcja kończy działanie zwracając X jako wektor
% zerowy i iloscWykonanychIteracji jako 0. Dodatkowo na konsoli jest
% wypisywana informacja "Promień spektralny jest większy lub równy 1.".
X = zeros(n,1);
D = diag(diag(A));
L = tril(A)-D;
U = triu(A)-D;
B = ((D+w*L)^(-1))*((1-w)*D-w*U);
c = w*(D+w*L)^(-1)*b';
iloscWykonanychIteracji = 0;
if max(abs(eig(B))) >= 1
    disp('Promień spektralny jest większy lub równy 1.');
    return
end

% Jeśli argument dokladnosc jest większy od 0, to jest wykonywana część
% kodu, która w każdej iteracji sprawdza, czy warunek i >= 2 &&
% abs(max(X_stare - X)) <= dokladnosc jest spełniony.
if dokladnosc > 0
    for i = 1:liczbaIteracji
        X_stare = X;
        X = B*X+c;
        if i >= 2 && abs(max(X_stare - X)) <= dokladnosc
            iloscWykonanychIteracji = i;
            return
        end
    end
    iloscWykonanychIteracji = liczbaIteracji;
    return
end

%Jeśli argument
% dokladnosc nie jest większy od 0, to jest wykonywany kod niezawierający
% wcześniejszego warunku.
for i = 1:liczbaIteracji
    X = B*X+c;
end
iloscWykonanychIteracji = liczbaIteracji;

end