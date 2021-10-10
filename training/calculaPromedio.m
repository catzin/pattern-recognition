function [promedio] = calculaPromedio(diagonalPrincipal)

suma = 0;
for i=1:length(diagonalPrincipal)
    suma = suma + diagonalPrincipal(i);

end

promedio = suma/length(diagonalPrincipal);

