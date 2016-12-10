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
% Delta - warunek stopu na maksymalna roznice miedzy kolejnymi
% przyblizeniami wartosci wlasnej, jezeli bedzie mniejsza to obliczenia nie
% sa kontynuowane
delta = 0.001;
% Limit iteracji - ograniczenie na liczbe iteracji dla przyblizania
% pojedynczej wartosci wlasnej
limitIteracji = 100;
% n - rozmiar macierzy A
n = 10;

% * Koniec konfiguracji *



% Skonstruowanie macierzy, ktorej wartosci wlasnych szukamy
A = constructMatrix(n);

% Znalezienie wartosci i wektorow wlasnych
[eigenvalues, eigenvectors] = findEigenvaluesAndVectors(A, delta, limitIteracji);

% Weryfikacja czy wlasnosci wartosci wlasnych i wektorow wlasnych sa
% spelnione
E = calculateErrorMatrix(A, eigenvalues, eigenvectors);
Enorm = norm(E);

fprintf('Maksymalny odchyl A * x - lambda * x: %e\n', max(max(E)));
fprintf('Norma wektora bledu: %e\n', Enorm);

% Obliczenie wartosci wlasnych za pomoca funkcji eig dostepnej w Matlabie
matlabEigenvalues = eig(A);
matlabEigenvalues = matlabEigenvalues(end:-1:1);

realEigenvalues = real(eigenvalues);
fprintf('Znalezione wartosci wlasne (pierwsza kolumna) oraz te obliczone przez Matlaba (funkcja eig, druga kolumna):\n');
display([realEigenvalues, matlabEigenvalues]);

fprintf('Norma wektora roznicy wartosci przyblizonych ta metoda oraz obliczonych przez Matlaba: %e\n', ...
    norm(eigenvalues - matlabEigenvalues));