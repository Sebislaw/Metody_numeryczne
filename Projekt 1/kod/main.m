%% Projekt 1 (nr 5)
% % Sebastian Pergała

%% Zmienne, z których kożystają następne sekcje kodu
% a = 0;
% b = pi;
% n = 10;
% dokladnyWynik = integral(@funkcjaPodCalka, a, b);
% wypiszWywolaniaFunkcji = true;


%% Kwadratury złożone (wartości od R0,1 do R0,n)
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


%% Przykłady
% zmienne, z których korzystają następne sekcje kodu
a = -1;
b = 5;
n = 7;
funkcja1 = @(x) sin(x);
funkcja2 = @(x) 0.5 * x .^ 4 - x.^3 - x.^2 + 5;
funkcja3 = @(x) 1.55 .^ x;
funkcja4 = @(x) x .^ 3 .* cos(sin(5*x));
funkcja5 = @(x) (x.^2+5) .^ cos(x.^2);

% % Przykład 1
% rysujWykresKwadraturyBlad(a, b, {funkcja1, funkcja2, funkcja3, funkcja4, funkcja5}, n);

% % Przykład 2
% rysujWykresRombergBlad(a, b, {funkcja1, funkcja2, funkcja3, funkcja4, funkcja5}, n);

% % Przykład 3
% a = -1;
% b = 5;
% n = 20;
% tol = 0;
% minKroki = 1;
% 
% fprintf("Dla funkcji, która nie jest stroma w przedziale całkowania:\n");
% fprintf("Liczba kroków potrzebna do uzyskania wyniku\ndokładnego na poziomie reprezentacji\ndla metody Romberga opartej na wybranych kwadraturach\n");
% [wartosc, blad, kroki1] = rombergZWarunkiemStopu(a, b, funkcja5, n, @zlozonaKwadraturaProstokatow, false, tol, minKroki);
% fprintf("Kwadratura prostokątów: %g\n", kroki1);
% [wartosc, blad, kroki2] = rombergZWarunkiemStopu(a, b, funkcja5, n, @zlozonaKwadraturaTrapezow, false, tol, minKroki);
% fprintf("Kwadratura trapezów: %g\n", kroki2);
% [wartosc, blad, kroki3] = rombergZWarunkiemStopu(a, b, funkcja5, n, @zlozonaKwadraturaSimpsona, false, tol, minKroki);
% fprintf("Kwadratura Simpsona: %g\n", kroki3);
% [wartosc, blad, kroki4] = rombergZWarunkiemStopu(a, b, funkcja5, n, @zlozonaKwadraturaNewtona_3_8, false, tol, minKroki);
% fprintf("Kwadratura Newtona 3/8: %g\n", kroki4);
% 
% funkcja6 = @(x) abs(75.^x .* 1 ./ (x - 5.0001));
% fprintf("Dla funkcji, która jest stroma w przedziale całkowania:\n");
% fprintf("Liczba kroków potrzebna do uzyskania wyniku\ndokładnego na poziomie reprezentacji\ndla metody Romberga opartej na wybranych kwadraturach\n");
% [wartosc, blad, kroki1] = rombergZWarunkiemStopu(a, b, funkcja6, n, @zlozonaKwadraturaProstokatow, false, tol, minKroki);
% fprintf("Kwadratura prostokątów: %g\n", kroki1);
% [wartosc, blad, kroki2] = rombergZWarunkiemStopu(a, b, funkcja6, n, @zlozonaKwadraturaTrapezow, false, tol, minKroki);
% fprintf("Kwadratura trapezów: %g\n", kroki2);
% [wartosc, blad, kroki3] = rombergZWarunkiemStopu(a, b, funkcja6, n, @zlozonaKwadraturaSimpsona, false, tol, minKroki);
% fprintf("Kwadratura Simpsona: %g\n", kroki3);
% [wartosc, blad, kroki4] = rombergZWarunkiemStopu(a, b, funkcja6, n, @zlozonaKwadraturaNewtona_3_8, false, tol, minKroki);
% fprintf("Kwadratura Newtona 3/8: %g\n", kroki4);

% % Przykład 4
% rysujWykresWartosciDlaRoznychPrzedzialow(@(x) cos(x)+x, 5, 50)

% % Przykład 5
% a = 1;
% b = 5;
% n = 5;
% funkcja7 = @(x) 1./sin(x)+2;
% rombergZWarunkiemStopu(a, b, funkcja7, n, @zlozonaKwadraturaTrapezow, true, 555, 2);
% w1 = zlozonaKwadraturaTrapezow(a, b, funkcja7, n, false);
% w2 = zlozonaKwadraturaSimpsona(a, b, funkcja7, n-1, false);
% w3 = zeros(1, n-2);
% for i = 1:n-2
%     w3(i) = zlozonaKwadraturaNewtonaCotesa(a, b, funkcja7, i, 4, false);
% end
% fprintf("Trapez: ");
% disp(w1);
% fprintf("Simpson: ");
% disp(w2);
% fprintf("Bool: ");
% disp(w3);

% % Przykład 6
% n = 29;
% a = -1;
% b = 5;
% rysujWykresCzasuWykonaniaRomberga(a, b, @(x) sin(x), n);


% % Przykład 7*
% n = 18;
% a = -10;
% b = 10;
% funkcja8 = @(x) cos(25.*(x.^25)).^25;
% 
% disp("Bool z kwadratury")
% zlozonaKwadraturaNewtonaCotesa(a, b, funkcja8, n-2, 4, false)
% disp("Bool z Romberga")
% rombergZWarunkiemStopu(a, b, funkcja8, n, @zlozonaKwadraturaTrapezow, false, 1, 2)
% 
% disp("Obliczanie tej samej wartości")
% disp("Metoda Newtona-Cotesa, rząd 4 (kwadratura Boole'a)")
% disp("Czas wykonania")
% timeit(@() zlozonaKwadraturaNewtonaCotesa(a, b, funkcja8, n-2, 4, false))
% disp("Metoda Romberga - ostatni element wiersza(kwadratura Boole'a)")
% disp("Czas wykonania")
% timeit(@() rombergZWarunkiemStopu(a, b, funkcja8, n, @zlozonaKwadraturaTrapezow, false, 1, 2))


