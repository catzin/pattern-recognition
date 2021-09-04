clc % limpia pantalla
clear all % limpia todo
close all %cierra todo

matclases = [];
centroides = [];
disper = [];

%color para ploteos
colors = ['b','g','r','c','m','y','k','w'];

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
    x = (randn(2,nrep)+centroides(i)) *  disper(i);
    matclases = [matclases x];
    x = [];
    
end

%generamos una coleccion de puntos nos indica en donde finaliza la matriz de
%la clase ckn
inicio = [];
finales = [];

j = 1;
for i=nrep:nrep:length(matclases) 
    finales(j) = i;
    j = j+1;
   
end

%generamos una coleccion de puntos nos indica en donde inicia la matriz de
%la clase ck
for k = 1: length(finales)
    
    if(k == 1) 
        inicio(k) = 1;
        
    else
        if(k >= 2)
            inicio(k) = finales(k-1) + 1;
        end
    end
    
end

medias = [];
distancias = [];

%calculamos las medias y vamos añadiendo a una matriz contenedora de todas
%las medias  para cada matriz de clase ckn
for i=1:length(inicio)
    media = mean(matclases(1:2,inicio(i):finales(i)),2);
    medias = [medias media];
end

while(1)
clc;

 data_x = input("ingresa x \n");
 data_y = input("ingresa y \n");

 vector = [data_x;data_y];
  
 for i=1:nclases 
     distancias(i) = norm(vector- medias(1:2,i));
 end
 
 
 figure(1)
color = 1;

for i=1:length(inicio)
    
    ck = matclases(1:2,inicio(i):finales(i));
    plot(ck(1,:),ck(2,:),'ro','MarkerSize',10,'MarkerFaceColor',colors(color));
   
    color = color+1;
    ck = [];
    
    grid on;
    hold on;
   
end

 hold on;
 plot(vector(1,:),vector(2,:),'ro','MarkerSize',15,'MarkerFaceColor','k');
 title('PRACTICA 1');

 dist_total= distancias;
 minimo = min(min(dist_total));
 valor = find(dist_total==minimo);
 fprintf('el vector desconocido pertenece a la clase = %d\n',valor);
 
 respuesta = input("¿Deseas probar con otro vector ? si = 1 , no = 0 \n");
 
 if(respuesta == 0)
     break;
 end
 
 end
 




