function clasificador()
%caso de clase
% nrep = 5;
% nclases = 3;
% c1 = [0 0 1 0 2;0 1 1 1 1];
% c2 = [5 5 4 6 6; 5 6 5 5 9];
% c3 = [9 10 11 10 9; 10 11 9 12 12];
% 
% matclases = [c1 c2 c3];

 colors = ['b','g','r','c','m','y','k','w'];
%regreso matriz y nuemero de representantes por clase y cuantas clases
[matclases,nrep,nclases] = generarClases();

%generamos una coleccion de puntos nos indica en donde finaliza la matriz de
%la clase ckn
[inicio,finales] = generaInicioFin(nrep,matclases);
medias = [];
distancias = [];

%calculamos las medias y vamos añadiendo a una matriz contenedora de todas
%las medias  para cada matriz de clase ckn
for i=1:length(inicio)
    media = mean(matclases(1:2,inicio(i):finales(i)),2);
    medias = [medias media];
end

respuesta = 1;

[data_x, data_y] = leerVector();
vector = [data_x;data_y];
numVeces = 0;
while(respuesta ~= 3)
 
%  data_x = input("ingresa x \n");
%  data_y = input("ingresa y \n");
% 
%  vector = [data_x;data_y];
  
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
 title('Clasificador 1','FontSize',24);
 legend();
 
 dist_total= distancias;
 minimo = min(min(dist_total));
 valor = find(dist_total==minimo);
 %fprintf("La distancias obtenidas son\n");
 %disp(distancias);
 fprintf('(Clasificador1 :) El vector desconocido pertenece a la clase = %d\n',valor);
 
 respuesta = input("ELige una nueva opcion\n 1.Otro Vector\n 2.Comparar con Bayes\n 3.Salir\n");
 
 if(respuesta == 1)
     clc;
     close();
     
     [data_x, data_y] = leerVector();
     vector = [data_x;data_y];
 else
     if(respuesta == 2)
         clc;
         fprintf("Elegiste Bayes\n");
         close();
         Bayes(matclases,nrep,nclases,data_x,data_y,inicio,finales);
     else
         close();
         break;
     end
    
 end
  
end
 














