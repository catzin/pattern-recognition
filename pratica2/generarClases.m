function [matclases,nrep,nclases] = generarClases()

%Esta funcion lee la informacion y genera una matriz grandota donde estna
%contenidas todas las otras matrices correspondientes, a las cuales
%después vamos a acceder como submatrices,

%retona : matclases(matriz contenedora) , numero de representantes por
%clase , y numero de clases.

centroides = [];
disper = [];
matclases = [];

nclases = input("¿Cuantas clases quieres?\n");
nrep = input("Ingresa el numero de representantes por clase\n");

%leer centroide y dispersion de cada clase
fprintf("Ingresa el centroide y dispersion para cada clase\n");

clc;
%agregamos centroides y dispersion correspondientes de las n clases
for i=1:nclases 
    centroides(i) = input("centroide clase "+i+": \n");
    disper(i) = input("dispersion clase "+i+": \n");
    
end

%generamos cada matriz (correspondiente a cada clase ck) y 
%la agregamos a una matriz contenedora de todas las clases ck1 .... ckn
for i = 1:nclases
    if(disper(i) ~= 0)
        x = (randn(2,nrep)+centroides(i)) *  disper(i);
    else
        x = (randn(2,nrep)+centroides(i)) *  1;
    end
    
    matclases = [matclases x];
    x = [];
    
end



end

