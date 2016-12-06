% [eigenvalue, x] = powerIteration(A, x0, delta, iterationsLimit) - funkcja
% wykorzystujaca metode potegowa z normowaniem do obliczenia dominujacej
% wartosci wlasnej eigenvalue macierzy A oraz odpowiadajacego jej wektora
% wlasnego x, zaczynajac z przyblizeniem poczatkowym wektora wlasnego x0.
%
% Funkcja wykonuje obliczenia az limit iteracji iterationsLimit zostanie
% przekroczony, albo modul roznicy miedzy kolejnymi przyblizeniami wartosci
% wlasnych bedzie mniejszy niz delta.
%
% Wejscie:
% * A - macierz dla ktorej wartosci wlasnych szukamy
% * x0 - przyblizenie poczatkowe wektora wlasnego
% * delta - zadana dokladnosc (domyslnie 0.01)
% * iterationsLimit - ograniczenie iteracji (domyslnie 100)
%
% Wyjscie:
% * eigenvalue - dominujaca wartosc wlasna macierzy A
% * x - wektor wlasny odpowiadajacy wartosci wlasnej eigenvalue
%
% Autor: Grzegorz Rozdzialik (D4, gr. lab. 2)

function [eigenvalue, x] = powerIteration(A, x0, delta, iterationsLimit)
if nargin < 4
    iterationsLimit = 100;
end
if nargin < 3
    delta = 0.01;
end

x = x0;
eigenvalue = inf;
for k=1:iterationsLimit
    % Metoda potegowa
    y = A * x;
    
    % Obliczenie wartosci wlasnej (w metodzie nalezy uzyc y z aktualnej 
    % iteracji oraz x z poprzedniej iteracji, dlatego obliczam przed
    % normowaniem)
    previousEigenvalue = eigenvalue;
    eigenvalue = dot(y, x);
    
    % Normowanie
    x = y ./ norm(y);
    
    % Sprawdzenie warunku stopu
    if (abs(eigenvalue - previousEigenvalue) < delta)
        break
    end
end


end

