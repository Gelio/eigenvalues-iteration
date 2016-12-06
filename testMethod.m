% Skrypt umozliwiajacy sprawdzenie dzialania metody potegowej z normowaniem
% i deflacja obliczajacej wszystkie wartosci wlasne i odpowiadajace im
% wektory wlasne dla macierzy trojdiagonalnej:
% a(k, k) = 5
% a(k, k-1) = 2 + i
% a(k, k+1) = 2 - i
%
%
% Autor: Grzegorz Rozdzialik (D4, gr. lab. 2)

% * Konfiguracja *
% Delta obliczen - warunek stopu na maksymalna roznice miedzy kolejnymi
% przyblizeniami wartosci wlasnej, jezeli bedzie mniejsza to obliczenia nie
% sa kontynuowane
deltaObliczen = 0.1;
% Delta wyniku - maksymalna roznica A * x - lambda * x, dla ktorej zestaw
% wartosci i wektorow wlasnych nadal bedzie uwazany jako prawidlowy
deltaWyniku = 1;
% Limit iteracji - ograniczenie na liczbe iteracji dla przyblizania
% pojedynczej wartosci wlasnej
limitIteracji = 100;
% n - rozmiar macierzy A
n = 10;

% * Koniec konfiguracji *



% Skonstruowanie macierzy, ktorej wartosci wlasnych szukamy
A = constructMatrix(n);

% Znalezienie wartosci i wektorow wlasnych
[eigenvalues, eigenvectors] = findEigenvaluesAndVectors(A, deltaObliczen, limitIteracji);

% Weryfikacja czy wlasnosci wartosci wlasnych i wektorow wlasnych sa
% spelnione
[result, maxDivergence] = verifyEigensystem(A, eigenvalues, eigenvectors, deltaWyniku);

if result == 1
    resultText = 'zgadza sie';
else
    resultText = 'nie zgadza sie';
end

fprintf('Wynik: %s\n', resultText);
fprintf('Maksymalny odchyl A * x - lambda * x: %e\n', maxDivergence);

realEigenvalues = real(eigenvalues);
fprintf('Znalezione wartosci wlasne:\n');
display(realEigenvalues);