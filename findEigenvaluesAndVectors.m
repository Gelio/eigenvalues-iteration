% [eigenvalues, eigenvectors] = findEigenvaluesAndVectors(A, delta,
% iterationsLimit) - funkcja wykorzystujaca metode potegowa z normowaniem i
% deflacja do znalezienia wszystkich wartosci wlasnych eigenvalues
% i odpowiadajacych im wektorow wlasnych eigenvectors macierzy A.
% Obliczenia dla pojedynczej wartosci wlasnej sa kontynuowane dopoki 
% roznica miedzy kolejnymi przyblizeniami wartosci wlasnymi nie przekroczy
% delta, lub osiagnieta zostanie maksymalna liczba iteracji
% iterationsLimit.
%
% Wejscie:
% * A - macierz dla ktorej wartosci wlasnych szukamy
% * delta - zadana dokladnosc (domyslnie 0.01)
% * iterationsLimit - ograniczenie iteracji (domyslnie 100)
%
% Wyjscie:
% * eigenvalues - wektor wartosci wlasnych macierzy A
% * eigenvectors - macierz, ktorej kolumnami sa wektory wlasne
% odpowiadajace wartosciom wlasnym z eigenvalues.
% W i-tej kolumnie znajduje sie wektor wlasny odpowiadajacy wartosci
% wlasnej i z wektora eigenvalues.
%
% Autor: Grzegorz Rozdzialik (D4, gr. lab. 2)


function [eigenvalues, eigenvectors] = findEigenvaluesAndVectors(A, delta, iterationsLimit)
if nargin < 4
    iterationsLimit = 100;
end
if nargin < 3
    delta = 0.01;
end

n = size(A, 1);

% Przygotowanie struktur na przechowywanie wartosci i wektorow wlasnych
eigenvalues = complex(zeros(n, 1), 0);
eigenvectors = complex(zeros(n, n), 0);

% Wektor przyblizenia poczatkowego
x0 = ones(n, 1);

% Znajdowanie kolejnych wartosci i wektorow wlasnych
for i=1:n
    [eigenvalues(i), eigenvectors(:, i)] = powerIteration(A, x0, delta, iterationsLimit);
    A = A - eigenvalues(i) * eigenvectors(:, i) * eigenvectors(:, i)';
end


end

