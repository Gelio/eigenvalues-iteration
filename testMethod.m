% Skrypt umozliwiajacy sprawdzenie dzialania metody potegowej z normowaniem
% i deflacja obliczajacej wszystkie wartosci wlasne i odpowiadajace im
% wektory wlasne dla macierzy trojdiagonalnej:
% a(k, k) = 5
% a(k, k-1) = 2 + i
% a(k, k+1) = 2 - i
%
% Skrypt poza przyblizeniem szukanych wartosci i wektorow wlasnych
% porownuje te wyniki oraz szybkosc obliczen z funkcja eig dostepna w
% Matlabie.
%
% Autor: Grzegorz Rozdzialik (D4, gr. lab. 2)

% * Konfiguracja *
% Delta - warunek stopu na maksymalna roznice miedzy kolejnymi
% przyblizeniami wartosci wlasnej, jezeli bedzie mniejsza to obliczenia nie
% sa kontynuowane
delta = 0.1;
% Limit iteracji - ograniczenie na liczbe iteracji dla przyblizania
% pojedynczej wartosci wlasnej
limitIteracji = 100;
% n - rozmiar macierzy A
n = 1000;

% * Koniec konfiguracji *



% Skonstruowanie macierzy, ktorej wartosci wlasnych szukamy
A = constructMatrix(n);

% Znalezienie wartosci i wektorow wlasnych
tic;
[eigenvalues, eigenvectors] = findEigenvaluesAndVectors(A, delta, limitIteracji);
methodTime = toc;

% Informacje dotyczace bledu przyblizenia metoda potegowa
E = calculateErrorMatrix(A, eigenvalues, eigenvectors);
Enorm = norm(E);

fprintf('Metoda potegowa z normowaniem:\n');
fprintf('Maksymalny odchylenie A * x - lambda * x: %e\n', max(max(abs(E))));
fprintf('Norma wektora bledu: %e\n\n', Enorm);


% Obliczenie wartosci wlasnych za pomoca funkcji eig dostepnej w Matlabie
tic;
[matlabEigenvectors, matlabEigenvalues] = eig(A);
matlabTime = toc;
matlabEigenvalues = diag(matlabEigenvalues);
matlabEigenvalues = matlabEigenvalues(end:-1:1);

% Informacje dotyczace bledu przyblizenia funkcja eig
EMatlab = calculateErrorMatrix(A, matlabEigenvalues, matlabEigenvectors);
EMatlabNorm = norm(EMatlab);

fprintf('Funkcja eig dostepna w Matlabie:\n');
fprintf('Maksymalny odchylenie A * x - lambda * x: %e\n', max(max(abs(EMatlab))));
fprintf('Norma wektora bledu: %e\n\n', EMatlabNorm);



if n <= 10
    realEigenvalues = real(eigenvalues);
    fprintf('Znalezione wartosci wlasne (pierwsza kolumna) oraz te obliczone przez Matlaba (funkcja eig, druga kolumna):\n');
    display([realEigenvalues, matlabEigenvalues]);
else
    fprintf('Znalezione wartosci wlasne znajduja sie w zmiennej "eigenvalues"\n');
end
fprintf('\n');

% Statystyki dotyczace czasu przyblizania
fprintf('Czas obliczania wartosci wlasnych:\n');
fprintf('* metoda potegowa: %.4f ms\n', methodTime * 1000);
fprintf('*     funkcja eig: %.4f ms\n', matlabTime * 1000);

fprintf('\n');