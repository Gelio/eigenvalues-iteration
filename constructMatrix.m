% A = constructMatrix(n) - funkcja konstruujaca macierz trojdiagonalna A 
% rozmiaru n x n, gdzie elementy z diagonali maja wartosc 5, elementy pod
% glowna przekatna sa rowne (2 + i), a nad glowna przekatna (2 - i).
%
% Wejscie:
% * n - rozmiar macierzy A
%
% Wyjscie:
% * A - macierz trojdiagonalna rozmiaru n x n o wlasciwosciach opisanych
% powyzej
%
% Autor: Grzegorz Rozdzialik (D4, gr. lab. 2)

function A = constructMatrix(n)
emptyMatrix = zeros(n, n);
A = complex(emptyMatrix, 0);
for i=1:n
    A(i, i) = complex(5, 0);
end

for i=2:n
    A(i, i-1) = complex(2, 1);
end

for i=1:(n-1)
    A(i, i+1) = complex(2, -1);
end


end

