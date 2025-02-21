function [] = przyklad4()
% Szybkość zbieżności metody SOR zależy od wartości promienia spektralnego
% macierzy iteracji B_SOR, która z kolei zależy od wartości parametru
% relaksacji w (jak było pokazanie w przykładzie 3.). Im promień spektralny
% macierzy iteracji ma mniejszą wartośc, tym szybkość zbiegania
% do prawidłowego wyniku jest szybsza. Ten przykład ilustruje zależność
% ilości iteracji potrzebnych do uzyskania wyniku z pewną dokładnością od
% parametru elaksacji (czyli za razem od promienia spektralnego macierzy
% iteracji, na zasadzie porównanie tego wykresu z wykresem z przykładu 3.).

% Rysowanie wykresu
figure,
hold on
A = [1 0.3; 0.3 1];
b = [1.3 1.3];
XDokladny = [1 1];
w = linspace(0.1, 1.9, 10000);
n = length(A(1,:));
D = diag(diag(A));
L = tril(A)-D;
U = triu(A)-D;
iloscIteracji = zeros(length(w), 1);
for j = 1:length(w)
    X = zeros(n, 1);
    B = ((D+w(j)*L)^(-1))*((1-w(j))*D-w(j)*U);
    c = w(j)*(D+w(j)*L)^(-1)*b';
    for i = 1:100
        X = B*X+c;
        iloscIteracji(j) = i;
        if abs(max(XDokladny - X)) < 0.1
            break;
        end
    end
    % Usuwanie punktów nieciągłości
    if j > 1 && iloscIteracji(j-1) ~= iloscIteracji(j)
        w(j) = NaN;
    end
end



plot(w, iloscIteracji, 'Color', 'red', 'LineWidth', 2.5)

A = [1 0.5; 0.5 1];
b = [1.5 1.5];
XDokladny = [1 1];
w = linspace(0.1, 1.9, 10000);
n = length(A(1,:));
D = diag(diag(A));
L = tril(A)-D;
U = triu(A)-D;
iloscIteracji = zeros(length(w), 1);
for j = 1:length(w)
    X = zeros(n, 1);
    B = ((D+w(j)*L)^(-1))*((1-w(j))*D-w(j)*U);
    c = w(j)*(D+w(j)*L)^(-1)*b';
    for i = 1:100
        X = B*X+c;
        iloscIteracji(j) = i;
        if abs(max(XDokladny - X)) < 0.1
            break;
        end
    end
    % Usuwanie punktów nieciągłości
    if j > 1 && iloscIteracji(j-1) ~= iloscIteracji(j)
        w(j) = NaN;
    end
end
plot(w, iloscIteracji, 'Color', 'green', 'LineWidth', 2)

A = [1 0.7; 0.7 1];
b = [1.7 1.7];
XDokladny = [1 1];
w = linspace(0.1, 1.9, 10000);
n = length(A(1,:));
D = diag(diag(A));
L = tril(A)-D;
U = triu(A)-D;
iloscIteracji = zeros(length(w), 1);
for j = 1:length(w)
    X = zeros(n, 1);
    B = ((D+w(j)*L)^(-1))*((1-w(j))*D-w(j)*U);
    c = w(j)*(D+w(j)*L)^(-1)*b';
    for i = 1:100
        X = B*X+c;
        iloscIteracji(j) = i;
        if abs(max(XDokladny - X)) < 0.1
            break;
        end
    end
    % Usuwanie punktów nieciągłości
    if j > 1 && iloscIteracji(j-1) ~= iloscIteracji(j)
        w(j) = NaN;
    end
end
plot(w, iloscIteracji, 'Color', 'blue', 'LineWidth', 2)

legend("a=0.3","a=0.5","a=0.7")
title({'Ilość iteracji potrzebnych do uzyskania wyniku z dokładością bezwzględną', '0.1 w metodzie SOR w zależności od wartości parametru relaksacji', 'dla macierzy A=[1 a; a;1] i wektora b=[1+a 1+a]'}, 'FontSize', 14)
xlabel('Parametr relaksacji')
ylabel('Ilość iteracji')
xlim([w(1), w(length(w))])
yticks(0:25)
hold off

end