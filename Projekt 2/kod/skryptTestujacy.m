%% Skrypt testujący


%% Testowanie wybranych parametrów
iloscIteracjiMetody = 50;
chcianaDokladnosc = 0.01;

% Metoda SOR nie zawsze jest lepsza od Gaussa-Seidela.
A = [0.5 2 4 5; 4 15 2 4; 5 4 -17 2; 0.5 0.4 0.3 5];
b = [-387.5 325 750 -335];
w = 1.5;
disp("Macierz A");
disp(A);
disp("Wektor b");
disp(b');
disp("Dokładny wynik x:");
disp([75 25 -25 -75]');
disp("Parametr relaksacji");
disp(w);
disp("Wynik metody SOR - wektor x z równania Ax=b");
[XWyliczony, iloscWykonanychIteracji] = SOR(A, b, iloscIteracjiMetody, w, chcianaDokladnosc);
disp(XWyliczony);
disp("Wynik metody SOR - ilość wykonanych iteracji");
disp(iloscWykonanychIteracji);
disp("Wynik metody Gaussa-Seidela - wektor x z równania Ax=b");
[XWyliczony, iloscWykonanychIteracji] = SOR(A, b, iloscIteracjiMetody, 1, chcianaDokladnosc);
disp(XWyliczony);
disp("Wynik metody Gaussa-Seidela - ilość wykonanych iteracji");
disp(iloscWykonanychIteracji);
disp("SOR - informacje");
disp("Promień spektralny macierzy iteracji, szacowana ilość potrzebnych iteracji");
[promienSpektralny, iloscPotzrebnychIteracji] = SORInformacje(A, w, chcianaDokladnosc);
disp([promienSpektralny, iloscPotzrebnychIteracji])
disp("Gauss-Seidel - informacje");
disp("Promień spektralny macierzy iteracji, szacowana ilość potrzebnych iteracji");
[promienSpektralny, iloscPotzrebnychIteracji] = GSInformacje(A, chcianaDokladnosc);
disp([promienSpektralny, iloscPotzrebnychIteracji])
disp("Jacobi - informacje");
disp("Promień spektralny macierzy iteracji, szacowana ilość potrzebnych iteracji");
[promienSpektralny, iloscPotzrebnychIteracji] = JInformacje(A, chcianaDokladnosc);
disp([promienSpektralny, iloscPotzrebnychIteracji])

% Dla parametru relaksacji równemu 1 metoda SOR jest równoważna metodzie
% GS.
A = [16 3; 7 -11];
b = [11 13];
w = 1;
disp("Macierz A");
disp(A);
disp("Wektor b");
disp(b');
disp("Dokładny wynik x:");
disp([160/197 -131/197]');
disp("Parametr relaksacji");
disp(w);
disp("Wynik metody SOR - wektor x z równania Ax=b");
[XWyliczony, iloscWykonanychIteracji] = SOR(A, b, iloscIteracjiMetody, w, chcianaDokladnosc);
disp(XWyliczony);
disp("Wynik metody SOR - ilość wykonanych iteracji");
disp(iloscWykonanychIteracji);
disp("Wynik metody Gaussa-Seidela - wektor x z równania Ax=b");
[XWyliczony, iloscWykonanychIteracji] = SOR(A, b, iloscIteracjiMetody, 1, chcianaDokladnosc);
disp(XWyliczony);
disp("Wynik metody Gaussa-Seidela - ilość wykonanych iteracji");
disp(iloscWykonanychIteracji);
disp("SOR - informacje");
disp("Promień spektralny macierzy iteracji, szacowana ilość potrzebnych iteracji");
[promienSpektralny, iloscPotzrebnychIteracji] = SORInformacje(A, w, chcianaDokladnosc);
disp([promienSpektralny, iloscPotzrebnychIteracji])
disp("Gauss-Seidel - informacje");
disp("Promień spektralny macierzy iteracji, szacowana ilość potrzebnych iteracji");
[promienSpektralny, iloscPotzrebnychIteracji] = GSInformacje(A, chcianaDokladnosc);
disp([promienSpektralny, iloscPotzrebnychIteracji])
disp("Jacobi - informacje");
disp("Promień spektralny macierzy iteracji, szacowana ilość potrzebnych iteracji");
[promienSpektralny, iloscPotzrebnychIteracji] = JInformacje(A, chcianaDokladnosc);
disp([promienSpektralny, iloscPotzrebnychIteracji])

% Dla macierzy symetrycznej i dodatnio określonej można łatwo dobrać 
% optymalny parametr relaksacji, dzięki któremu metoda SOR jest lepsza od
% metody GS.
A = [1 0.8; 0.8 1];
b = [1.8 1.8];
w = optymalnyParametrSOR(A);
disp("Macierz A");
disp(A);
disp("Wektor b");
disp(b');
disp("Dokładny wynik x:");
disp([1 1]');
disp("Optymalny parametr relaksacji");
disp(w);
disp("Wynik metody SOR - wektor x z równania Ax=b");
[XWyliczony, iloscWykonanychIteracji] = SOR(A, b, iloscIteracjiMetody, w, chcianaDokladnosc);
disp(XWyliczony);
disp("Wynik metody SOR - ilość wykonanych iteracji");
disp(iloscWykonanychIteracji);
disp("Wynik metody Gaussa-Seidela - wektor x z równania Ax=b");
[XWyliczony, iloscWykonanychIteracji] = SOR(A, b, iloscIteracjiMetody, 1, chcianaDokladnosc);
disp(XWyliczony);
disp("Wynik metody Gaussa-Seidela - ilość wykonanych iteracji");
disp(iloscWykonanychIteracji);
disp("SOR - informacje");
disp("Promień spektralny macierzy iteracji, szacowana ilość potrzebnych iteracji");
[promienSpektralny, iloscPotzrebnychIteracji] = SORInformacje(A, w, chcianaDokladnosc);
disp([promienSpektralny, iloscPotzrebnychIteracji])
disp("Gauss-Seidel - informacje");
disp("Promień spektralny macierzy iteracji, szacowana ilość potrzebnych iteracji");
[promienSpektralny, iloscPotzrebnychIteracji] = GSInformacje(A, chcianaDokladnosc);
disp([promienSpektralny, iloscPotzrebnychIteracji])
disp("Jacobi - informacje");
disp("Promień spektralny macierzy iteracji, szacowana ilość potrzebnych iteracji");
[promienSpektralny, iloscPotzrebnychIteracji] = JInformacje(A, chcianaDokladnosc);
disp([promienSpektralny, iloscPotzrebnychIteracji])

% W tym przykładzie dla w=1.5 metoda SOR nie jest zbieżna, tak samo jak
% metoda GS i J.
A = [4 -1 -6 0; -5 -4 10 8; 0 9 4 -2; 1 0 -7 5];
b = [2 21 -12 -6];
w = 1.5;
disp("Macierz A");
disp(A);
disp("Wektor b");
disp(b');
disp("Dokładny wynik x:");
disp([3 -2 2 1]');
disp("Parametr relaksacji");
disp(w);
disp("Wynik metody SOR - wektor x z równania Ax=b");
[XWyliczony, ~] = SOR(A, b, iloscIteracjiMetody, w, chcianaDokladnosc);
disp(XWyliczony);
disp("Wynik metody Gaussa-Seidela - wektor x z równania Ax=b");
[XWyliczony, ~] = SOR(A, b, iloscIteracjiMetody, 1, chcianaDokladnosc);
disp(XWyliczony);
disp("SOR - informacje");
disp("Promień spektralny macierzy iteracji, szacowana ilość potrzebnych iteracji");
[promienSpektralny, iloscPotzrebnychIteracji] = SORInformacje(A, w, chcianaDokladnosc);
disp([promienSpektralny, iloscPotzrebnychIteracji])
disp("Gauss-Seidel - informacje");
disp("Promień spektralny macierzy iteracji, szacowana ilość potrzebnych iteracji");
[promienSpektralny, iloscPotzrebnychIteracji] = GSInformacje(A, chcianaDokladnosc);
disp([promienSpektralny, iloscPotzrebnychIteracji])
disp("Jacobi - informacje");
disp("Promień spektralny macierzy iteracji, szacowana ilość potrzebnych iteracji");
[promienSpektralny, iloscPotzrebnychIteracji] = JInformacje(A, chcianaDokladnosc);
disp([promienSpektralny, iloscPotzrebnychIteracji])

% Te same dane, co wcześniej, ale parametr relaksacji jest inny. Dzięki
% zmianie parametru metoda SOR jest zbieżna, choć metoda Gaussa-Seidela
% i Jacobiego nie jest zbieżna.
A = [4 -1 -6 0; -5 -4 10 8; 0 9 4 -2; 1 0 -7 5];
b = [2 21 -12 -6];
w = 0.5;
disp("Macierz A");
disp(A);
disp("Wektor b");
disp(b');
disp("Dokładny wynik x:");
disp([3 -2 2 1]');
disp("Parametr relaksacji");
disp(w);
disp("Wynik metody SOR - wektor x z równania Ax=b");
[XWyliczony, iloscWykonanychIteracji] = SOR(A, b, iloscIteracjiMetody, w, chcianaDokladnosc);
disp(XWyliczony);
disp("Wynik metody SOR - ilość wykonanych iteracji");
disp(iloscWykonanychIteracji);
disp("Wynik metody Gaussa-Seidela - wektor x z równania Ax=b");
[XWyliczony, iloscWykonanychIteracji] = SOR(A, b, iloscIteracjiMetody, 1, chcianaDokladnosc);
disp(XWyliczony);
disp("SOR - informacje");
disp("Promień spektralny macierzy iteracji, szacowana ilość potrzebnych iteracji");
[promienSpektralny, iloscPotzrebnychIteracji] = SORInformacje(A, w, chcianaDokladnosc);
disp([promienSpektralny, iloscPotzrebnychIteracji])
disp("Gauss-Seidel - informacje");
disp("Promień spektralny macierzy iteracji, szacowana ilość potrzebnych iteracji");
[promienSpektralny, iloscPotzrebnychIteracji] = GSInformacje(A, chcianaDokladnosc);
disp([promienSpektralny, iloscPotzrebnychIteracji])
disp("Jacobi - informacje");
disp("Promień spektralny macierzy iteracji, szacowana ilość potrzebnych iteracji");
[promienSpektralny, iloscPotzrebnychIteracji] = JInformacje(A, chcianaDokladnosc);
disp([promienSpektralny, iloscPotzrebnychIteracji])

%% Porównywanie błędów

A = [1 0.8; 0.8 1];
b = [1.8 1.8];
w = 1;
x = [1 1];
n = 10;
bladBezwzglednyNorma2 = ones(n, 1);
bladWzglednyNorma2 = ones(n, 1);
bladBezwzglednyNormaInf = ones(n, 1);
bladWzglednyNormaInf = ones(n, 1);
for j = 1:n
    [x_przyblizone, ~] = SOR(A, b, j, w, 0);
    bladBezwzglednyNorma2(j) = norm(x_przyblizone - x', 2);
    bladWzglednyNorma2(j) = norm(x_przyblizone - x', 2) / norm(x', 2);
    bladBezwzglednyNormaInf(j) = norm(x_przyblizone - x', "inf");
    bladWzglednyNormaInf(j) = norm(x_przyblizone - x', "inf") / norm(x', "inf");
end
tabela = table((1:n)', bladBezwzglednyNorma2, bladWzglednyNorma2, bladBezwzglednyNormaInf, bladWzglednyNormaInf, ...
    'VariableNames', {'Iteracja', 'Błąd bezwzględny, norma 2', 'Błąd Względny, norma 2', 'Błąd bezwzględny, norma Inf', 'Błąd Względny, norma Inf'});
disp("1) A = [1 0.8; 0.8 1], b = [1.8 1.8], w = 1, 10 iteracji")
disp(tabela);

A = [1 0.8; 0.8 1];
b = [1.8 1.8];
w = 1.25; % w = optymalnyParametrSOR(A)
x = [1 1];
n = 10;
bladBezwzglednyNorma2 = ones(n, 1);
bladWzglednyNorma2 = ones(n, 1);
bladBezwzglednyNormaInf = ones(n, 1);
bladWzglednyNormaInf = ones(n, 1);
for j = 1:n
    [x_przyblizone, ~] = SOR(A, b, j, w, 0);
    bladBezwzglednyNorma2(j) = norm(x_przyblizone - x', 2);
    bladWzglednyNorma2(j) = norm(x_przyblizone - x', 2) / norm(x', 2);
    bladBezwzglednyNormaInf(j) = norm(x_przyblizone - x', "inf");
    bladWzglednyNormaInf(j) = norm(x_przyblizone - x', "inf") / norm(x', "inf");
end
tabela = table((1:n)', bladBezwzglednyNorma2, bladWzglednyNorma2, bladBezwzglednyNormaInf, bladWzglednyNormaInf, ...
    'VariableNames', {'Iteracja', 'Błąd bezwzględny, norma 2', 'Błąd Względny, norma 2', 'Błąd bezwzględny, norma Inf', 'Błąd Względny, norma Inf'});
disp("2) A = [1 0.8; 0.8 1], b = [1.8 1.8], w = 1.25, 10 iteracji")
disp(tabela);

A = [0.5 2 4 5; 4 15 2 4; 5 4 -17 2; 0.5 0.4 0.3 5];
b = [-387.5 325 750 -335];
w = 1;
x = [75 25 -25 -75];
n = 10;
bladBezwzglednyNorma2 = ones(n, 1);
bladWzglednyNorma2 = ones(n, 1);
bladBezwzglednyNormaInf = ones(n, 1);
bladWzglednyNormaInf = ones(n, 1);
for j = 1:n
    [x_przyblizone, ~] = SOR(A, b, j, w, 0);
    bladBezwzglednyNorma2(j) = norm(x_przyblizone - x', 2);
    bladWzglednyNorma2(j) = norm(x_przyblizone - x', 2) / norm(x', 2);
    bladBezwzglednyNormaInf(j) = norm(x_przyblizone - x', "inf");
    bladWzglednyNormaInf(j) = norm(x_przyblizone - x', "inf") / norm(x', "inf");
end
tabela = table((1:n)', bladBezwzglednyNorma2, bladWzglednyNorma2, bladBezwzglednyNormaInf, bladWzglednyNormaInf, ...
    'VariableNames', {'Iteracja', 'Błąd bezwzględny, norma 2', 'Błąd Względny, norma 2', 'Błąd bezwzględny, norma Inf', 'Błąd Względny, norma Inf'});
disp("3) A = [0.5 2 4 5; 4 15 2 4; 5 4 -17 2; 0.5 0.4 0.3 5], b = [-387.5 325 750 -335], w = 1, 10 iteracji")
disp(tabela);

A = [0.5 2 4 5; 4 15 2 4; 5 4 -17 2; 0.5 0.4 0.3 5];
b = [-387.5 325 750 -335];
w = 1.5;
x = [75 25 -25 -75];
n = 10;
bladBezwzglednyNorma2 = ones(n, 1);
bladWzglednyNorma2 = ones(n, 1);
bladBezwzglednyNormaInf = ones(n, 1);
bladWzglednyNormaInf = ones(n, 1);
for j = 1:n
    [x_przyblizone, ~] = SOR(A, b, j, w, 0);
    bladBezwzglednyNorma2(j) = norm(x_przyblizone - x', 2);
    bladWzglednyNorma2(j) = norm(x_przyblizone - x', 2) / norm(x', 2);
    bladBezwzglednyNormaInf(j) = norm(x_przyblizone - x', "inf");
    bladWzglednyNormaInf(j) = norm(x_przyblizone - x', "inf") / norm(x', "inf");
end
tabela = table((1:n)', bladBezwzglednyNorma2, bladWzglednyNorma2, bladBezwzglednyNormaInf, bladWzglednyNormaInf, ...
    'VariableNames', {'Iteracja', 'Błąd bezwzględny, norma 2', 'Błąd Względny, norma 2', 'Błąd bezwzględny, norma Inf', 'Błąd Względny, norma Inf'});
disp("4) A = [0.5 2 4 5; 4 15 2 4; 5 4 -17 2; 0.5 0.4 0.3 5], b = [-387.5 325 750 -335], w = 1.5, 10 iteracji")
disp(tabela);

A = [4 -1 -6 0; -5 -4 10 8; 0 9 4 -2; 1 0 -7 5];
b = [2 21 -12 -6];
w = 1;
x = [3 -2 2 1];
n = 10;
bladBezwzglednyNorma2 = ones(n, 1);
bladWzglednyNorma2 = ones(n, 1);
bladBezwzglednyNormaInf = ones(n, 1);
bladWzglednyNormaInf = ones(n, 1);
for j = 1:n
    [x_przyblizone, ~] = SOR(A, b, j, w, 0);
    bladBezwzglednyNorma2(j) = norm(x_przyblizone - x', 2);
    bladWzglednyNorma2(j) = norm(x_przyblizone - x', 2) / norm(x', 2);
    bladBezwzglednyNormaInf(j) = norm(x_przyblizone - x', "inf");
    bladWzglednyNormaInf(j) = norm(x_przyblizone - x', "inf") / norm(x', "inf");
end
tabela = table((1:n)', bladBezwzglednyNorma2, bladWzglednyNorma2, bladBezwzglednyNormaInf, bladWzglednyNormaInf, ...
    'VariableNames', {'Iteracja', 'Błąd bezwzględny, norma 2', 'Błąd Względny, norma 2', 'Błąd bezwzględny, norma Inf', 'Błąd Względny, norma Inf'});
disp("5) A = [4 -1 -6 0; -5 -4 10 8; 0 9 4 -2; 1 0 -7 5], b = [2 21 -12 -6], w = 1, 10 iteracji")
disp(tabela);

A = [4 -1 -6 0; -5 -4 10 8; 0 9 4 -2; 1 0 -7 5];
b = [2 21 -12 -6];
w = 0.5;
x = [3 -2 2 1];
n = 50;
bladBezwzglednyNorma2 = ones(11, 1);
bladWzglednyNorma2 = ones(11, 1);
bladBezwzglednyNormaInf = ones(11, 1);
bladWzglednyNormaInf = ones(11, 1);
for j = 1:10
    [x_przyblizone, ~] = SOR(A, b, j, w, 0);
    bladBezwzglednyNorma2(j) = norm(x_przyblizone - x', 2);
    bladWzglednyNorma2(j) = norm(x_przyblizone - x', 2) / norm(x', 2);
    bladBezwzglednyNormaInf(j) = norm(x_przyblizone - x', "inf");
    bladWzglednyNormaInf(j) = norm(x_przyblizone - x', "inf") / norm(x', "inf");
end
[x_przyblizone, ~] = SOR(A, b, 50, w, 0);
bladBezwzglednyNorma2(11) = norm(x_przyblizone - x', 2);
bladWzglednyNorma2(11) = norm(x_przyblizone - x', 2) / norm(x', 2);
bladBezwzglednyNormaInf(11) = norm(x_przyblizone - x', "inf");
bladWzglednyNormaInf(11) = norm(x_przyblizone - x', "inf") / norm(x', "inf");
tabela = table([(1:10) 50]', bladBezwzglednyNorma2, bladWzglednyNorma2, bladBezwzglednyNormaInf, bladWzglednyNormaInf, ...
    'VariableNames', {'Iteracja', 'Błąd bezwzględny, norma 2', 'Błąd Względny, norma 2', 'Błąd bezwzględny, norma Inf', 'Błąd Względny, norma Inf'});
disp("6) A = [4 -1 -6 0; -5 -4 10 8; 0 9 4 -2; 1 0 -7 5], b = [2 21 -12 -6], w = 0.5, 10 iteracji")
disp(tabela);