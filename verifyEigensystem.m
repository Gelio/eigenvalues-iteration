% result = verifyEigensystem(A, eigenvalues, eigenvectors, delta) - funkcja
% sprawdzajaca czy dany zestaw wartosci wlasnych i wektorow wlasnych
% ma wlasciwosci wartosci wlasnych macierzy A (tzn. A * x = lambda * x).
% Dopuszcza sie blad delta.
%
% Wejscie:
% * A - macierz dla ktorej wartosci wlasnych szukalismy
% * eigenvalues - wektor znalezionych wartosci wlasnych macierzy A
% * eigenvectors - macierz wektorow wlasnych odpowiadajacych wartosciom
% wlasnym macierzy A. Struktura macierzy jak w wyjsciu funkcji
% findEigenvaluesAndVectors
% * delta - mozliwy blad
%
% Wyjscie:
% * result - wynik sprawdzenia (0 - nie zgadza sie, 1 - zgadza sie)
% * maxDivergence - maksymalna roznica A * x - lambda * x dla zestawu
%
% Autor: Grzegorz Rozdzialik (D4, gr. lab. 2)

function [result, maxDivergence] = verifyEigensystem(A, eigenvalues, eigenvectors, delta)
maxDivergence = 0;

for i=1:length(eigenvalues)
    lambda = eigenvalues(i);
    x = eigenvectors(:, i);
    
    % Sprawdzenie normy
    divergence = norm(A * x - lambda * x);
    if (maxDivergence < divergence)
        maxDivergence = divergence;
    end
    if (divergence > delta)
        result = 0;
        return
    end
end
result = 1;


end

