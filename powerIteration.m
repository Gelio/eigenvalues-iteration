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
    x = y / norm(y);
    
    % Sprawdzenie warunku stopu
    if (abs(eigenvalue - previousEigenvalue) < delta)
        break
    end
end


end

