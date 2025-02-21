%% Projekt 1 (nr 5)
% % Sebastian Pergała


%% Testowanie wyników zaimplementowanej metody

funkcja = @(x) sin(x);
a = 0;
b = pi;
n = 10;
dokladnyWynik = ones(n, 1) * integral(funkcja, a, b);
przyblizonyWynik = zeros(n, 1);
for i=1:n
    przyblizonyWynik(i) = romberg(a, b, funkcja, i, @zlozonaKwadraturaTrapezow, false);
end
bladBezwzgledny = abs(dokladnyWynik - przyblizonyWynik);
bladWzgledny = abs(dokladnyWynik - przyblizonyWynik) ./ dokladnyWynik;
tabela1 = table((1:n)', dokladnyWynik, przyblizonyWynik, bladBezwzgledny, bladWzgledny, 'VariableNames', {'n', 'Wartość dokładna', 'Wartość przybliżona', 'Błąd Bezwzględny', 'Błąd względny'});
disp("1) Dla funkcji sin(x) na przedziale [0,10]")
disp(tabela1);



funkcja = @(x) sin(x);
a = -500;
b = 500;
n = 10;
dokladnyWynik = ones(n, 1) * integral(funkcja, a, b);
przyblizonyWynik = zeros(n, 1);
for i=1:n
    przyblizonyWynik(i) = romberg(a, b, funkcja, i, @zlozonaKwadraturaTrapezow, false);
end
bladBezwzgledny = abs(dokladnyWynik - przyblizonyWynik);
bladWzgledny = abs(dokladnyWynik - przyblizonyWynik) ./ dokladnyWynik;
tabela2 = table((1:n)', dokladnyWynik, przyblizonyWynik, bladBezwzgledny, bladWzgledny, 'VariableNames', {'n', 'Wartość dokładna', 'Wartość przybliżona', 'Błąd Bezwzględny', 'Błąd względny'});
disp("2) Dla funkcji sin(x) na przedziale [-500,500]")
disp(tabela2);



funkcja = @(x) (x.^25)./x;
a = 1;
b = 10;
n = 10;
dokladnyWynik = ones(n, 1) * integral(funkcja, a, b);
przyblizonyWynik = zeros(n, 1);
for i=1:n
    przyblizonyWynik(i) = romberg(a, b, funkcja, i, @zlozonaKwadraturaTrapezow, false);
end
bladBezwzgledny = abs(dokladnyWynik - przyblizonyWynik);
bladWzgledny = abs(dokladnyWynik - przyblizonyWynik) ./ dokladnyWynik;
tabela3 = table((1:n)', dokladnyWynik, przyblizonyWynik, bladBezwzgledny, bladWzgledny, 'VariableNames', {'n', 'Wartość dokładna', 'Wartość przybliżona', 'Błąd Bezwzględny', 'Błąd względny'});
disp("3) Dla funkcji (x^25)/x na przedziale [1,10]")
disp(tabela3);



funkcja = @(x) (2.*sin((x.^225)./2).*cos((x.^225)./2)).^2 + (cos(x.^225)).^2;
a = -10;
b = 10;
n = 10;
dokladnyWynik = ones(n, 1) * integral(funkcja, a, b);
przyblizonyWynik = zeros(n, 1);
for i=1:n
    przyblizonyWynik(i) = romberg(a, b, funkcja, i, @zlozonaKwadraturaTrapezow, false);
end
bladBezwzgledny = abs(dokladnyWynik - przyblizonyWynik);
bladWzgledny = abs(dokladnyWynik - przyblizonyWynik) ./ dokladnyWynik;
tabela4 = table((1:n)', dokladnyWynik, przyblizonyWynik, bladBezwzgledny, bladWzgledny, 'VariableNames', {'n', 'Wartość dokładna', 'Wartość przybliżona', 'Błąd Bezwzględny', 'Błąd względny'});
disp("4) Dla funkcji (2*sin((x^225)/2)*cos((x^225)/2))^2 + (cos(x^225))^2 na przedziale [-10,10]")
disp(tabela4);



funkcja = @(x) x - sin(x);
a = -0.5;
b = 0.5;
n = 10;
dokladnyWynik = ones(n, 1) * integral(funkcja, a, b);
przyblizonyWynik = zeros(n, 1);
for i=1:n
    przyblizonyWynik(i) = romberg(a, b, funkcja, i, @zlozonaKwadraturaTrapezow, false);
end
bladBezwzgledny = abs(dokladnyWynik - przyblizonyWynik);
bladWzgledny = abs(dokladnyWynik - przyblizonyWynik) ./ dokladnyWynik;
tabela5 = table((1:n)', dokladnyWynik, przyblizonyWynik, bladBezwzgledny, bladWzgledny, 'VariableNames', {'n', 'Wartość dokładna', 'Wartość przybliżona', 'Błąd Bezwzględny', 'Błąd względny'});
disp("5) Dla funkcji x-sin(x) na przedziale [5,55]")
disp(tabela5);



funkcja = @(x) x.^5;
a = 0;
b = 1;
n = 10;
dokladnyWynik = ones(n, 1) * integral(funkcja, a, b);
przyblizonyWynik = zeros(n, 1);
for i=1:n
    przyblizonyWynik(i) = romberg(a, b, funkcja, i, @zlozonaKwadraturaTrapezow, false);
end
bladBezwzgledny = abs(dokladnyWynik - przyblizonyWynik);
bladWzgledny = abs(dokladnyWynik - przyblizonyWynik) ./ dokladnyWynik;
tabela6 = table((1:n)', dokladnyWynik, przyblizonyWynik, bladBezwzgledny, bladWzgledny, 'VariableNames', {'n', 'Wartość dokładna', 'Wartość przybliżona', 'Błąd Bezwzględny', 'Błąd względny'});
disp("6) Dla funkcji x^5 na przedziale [5,10]")
disp(tabela6);



funkcja = @(x) x.^5;
a = -0.5;
b = 0.5;
n = 10;
dokladnyWynik = ones(n, 1) * integral(funkcja, a, b);
przyblizonyWynik = zeros(n, 1);
for i=1:n
    przyblizonyWynik(i) = romberg(a, b, funkcja, i, @zlozonaKwadraturaTrapezow, false);
end
bladBezwzgledny = abs(dokladnyWynik - przyblizonyWynik);
bladWzgledny = abs(dokladnyWynik - przyblizonyWynik) ./ dokladnyWynik;
tabela7 = table((1:n)', dokladnyWynik, przyblizonyWynik, bladBezwzgledny, bladWzgledny, 'VariableNames', {'n', 'Wartość dokładna', 'Wartość przybliżona', 'Błąd Bezwzględny', 'Błąd względny'});
disp("7) Dla funkcji x^5 na przedziale [-0.5,0.5]")
disp(tabela7);




%% Kwadratury złożone (wartości od R0,1 do R0,n)

% disp("Wynik dokładny:");
% disp(integral(@funkcjaPodCalka, a, b));

% disp("Zlozona kwadratura trapezów")
% zlozonaKwadraturaTrapezow(a, b, @funkcjaPodCalka, n, true);
% % dips("Czas wykonania")
% % timeit(@() zlozonaKwadraturaTrapezow(a, b, @funkcjaPodCalka, n, false))

% disp("Zlozona kwadratura Simpsona")
% zlozonaKwadraturaSimpsona(a, b, @funkcjaPodCalka, n, true);
% % dips("Czas wykonania")
% % timeit(@() zlozonaKwadraturaSimpsona(a, b, @funkcjaPodCalka, n, false))

% disp("Zlozona kwadratura Newtona 3/8")
% zlozonaKwadraturaNewtona_3_8(a, b, @funkcjaPodCalka, n, true);
% % dips("Czas wykonania")
% % timeit(@() zlozonaKwadraturaNewtona_3_8(a, b, @funkcjaPodCalka, n, false))

% disp("Zlozona kwadratura prostokątów")
% zlozonaKwadraturaProstokatow(a, b, @funkcjaPodCalka, n, true);
% % dips("Czas wykonania")
% % timeit(@() zlozonaKwadraturaProstokatow(a, b, @funkcjaPodCalka, n, false))


%% Kwadratury złożone Newtona - Cotesa (wartość dla R0,n, rzędy od 1 do 6)

% disp("Wynik dokładny:");
% disp(integral(@funkcjaPodCalka, a, b));

% disp("Zlozona kwadratura trapezów (metoda Newtona-Cotesa, rząd 1)")
% zlozonaKwadraturaNewtonaCotesa(a, b, @funkcjaPodCalka, n, 1, true);
% % dips("Czas wykonania")
% % timeit(@() zlozonaKwadraturaNewtonaCotesa(a, b, @funkcjaPodCalka, n, 1, false))

% disp("Zlozona kwadratura Simpsona (metoda Newtona-Cotesa, rząd 2)")
% zlozonaKwadraturaNewtonaCotesa(a, b, @funkcjaPodCalka, n, 2, true);
% % dips("Czas wykonania")
% % timeit(@() zlozonaKwadraturaNewtonaCotesa(a, b, @funkcjaPodCalka, n, 2, false))

% disp("Zlozona kwadratura Newtona 3/8 (metoda Newtona-Cotesa, rząd 3)")
% zlozonaKwadraturaNewtonaCotesa(a, b, @funkcjaPodCalka, n, 3, true);
% % dips("Czas wykonania")
% % timeit(@() zlozonaKwadraturaNewtonaCotesa(a, b, @funkcjaPodCalka, n, 3, false))

% disp("Metoda Newtona-Cotesa, rząd 4)")
% zlozonaKwadraturaNewtonaCotesa(a, b, @funkcjaPodCalka, n, 4, true);
% % dips("Czas wykonania")
% % timeit(@() zlozonaKwadraturaNewtonaCotesa(a, b, @funkcjaPodCalka, n, 4, false))

% disp("Metoda Newtona-Cotesa, rząd 5)")
% zlozonaKwadraturaNewtonaCotesa(a, b, @funkcjaPodCalka, n, 5, true);
% % dips("Czas wykonania")
% % timeit(@() zlozonaKwadraturaNewtonaCotesa(a, b, @funkcjaPodCalka, n, 5, false))

% disp("Metoda Newtona-Cotesa, rząd 6)")
% zlozonaKwadraturaNewtonaCotesa(a, b, @funkcjaPodCalka, n, 6, true);
% dips("Czas wykonania")
% timeit(@() zlozonaKwadraturaNewtonaCotesa(a, b, @funkcjaPodCalka, n, 6, false))


%% Metoda Romberga

% disp("Wynik dokładny:");
% disp(integral(@funkcjaPodCalka, a, b));

% disp("Metoda Romberga - zlozona kwadratura trapezów")
% romberg(a, b, @funkcjaPodCalka, n, @zlozonaKwadraturaTrapezow, wypiszWywolaniaFunkcji);
% % dips("Czas wykonania")
% % timeit(@() romberg(a, b, @funkcjaPodCalka, n, @zlozonaKwadraturaTrapezow, false))

% disp("Metoda Romberga - zlozona kwadratura Simpsona")
% romberg(a, b, @funkcjaPodCalka, n, @zlozonaKwadraturaSimpsona, wypiszWywolaniaFunkcji);
% % dips("Czas wykonania")
% % timeit(@() romberg(a, b, @funkcjaPodCalka, n, @zlozonaKwadraturaSimpsona, false))

% disp("Metoda Romberga - zlozona kwadratura Newtona 3/8")
% romberg(a, b, @funkcjaPodCalka, n, @zlozonaKwadraturaNewtona_3_8, wypiszWywolaniaFunkcji);
% % dips("Czas wykonania")
% % timeit(@() romberg(a, b, @funkcjaPodCalka, n, @zlozonaKwadraturaNewtona_3_8, false))

% disp("Metoda Romberga - zlozona kwadratura prostokątów")
% romberg(a, b, @funkcjaPodCalka, n, @zlozonaKwadraturaProstokatow, wypiszWywolaniaFunkcji);
% % dips("Czas wykonania")
% % timeit(@() romberg(a, b, @funkcjaPodCalka, n, @zlozonaKwadraturaProstokatow, false))