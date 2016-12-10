% E = calculateErrorVector(A, eigenvalues, eigenvectors) - funkcja
% obliczajaca blad e = A * x - lambda * x dla kazdej wartosci wlasnej i
% wektora wlasnego z nia zwiazanego.
%
% Wejscie:
% * A - macierz dla ktorej wartosci wlasnych szukalismy
% * eigenvalues - wektor znalezionych wartosci wlasnych macierzy A
% * eigenvectors - macierz wektorow wlasnych odpowiadajacych wartosciom
% wlasnym macierzy A. Struktura macierzy jak w wyjsciu funkcji
% findEigenvaluesAndVectors
%
% Wyjscie:
% * E - wektor rozmiaru n zawierajacy blad A*x - lambda*x dla kazdej
% wartosci wlasnej
%
% Autor: Grzegorz Rozdzialik (D4, gr. lab. 2)

function E = calculateErrorVector(A, eigenvalues, eigenvectors)
E = A .* eigenvectors - eigenvalues .* eigenvectors;

end

