% E = calculateErrorMatrix(A, eigenvalues, eigenvectors) - funkcja
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
% * E - macierz rozmiaru nxn zawierajacy bledy A*x - lambda*x dla kazdej
% wartosci wlasnej. W i-tej kolumnie znajduje sie blad A*x_i - lambda_i *
% x_i
%
% Autor: Grzegorz Rozdzialik (D4, gr. lab. 2)

function E = calculateErrorMatrix(A, eigenvalues, eigenvectors)
eigenvaluesMatrix = repmat(eigenvalues, 1, length(eigenvalues));
E = A * eigenvectors - eigenvaluesMatrix * eigenvectors;

end

