clc 
clear all
% Si se qiere usar el ejemplo de clase
% c1 = [0 1 1 1; 0 0 1 0;0 0 0 1];
% c2 = [0 1 0 0;0 1 1 1; 1 1 1 0];
% las medias deben ir de 1:3 , las varianzas 1:3 , y las matrices igual 1:3
%modificar las respecticas funciones(calcularMedias() ) y secciones de este codigo
%como e = 3 y filas de algunamatriz(1:3)
%como vamos a trabajar con 2D, no mover nada, ya funciona

colors = ['b','g','r','c','m','y','k','w'];
%aqui voy a guardar las distancias finales
distancias = [];
%aqui se contienen las N clases
[matClases,nrep,nclases] = generarClases();
[inicio , fin ] = generaInicioFin(nrep,matClases);
mediasMat = calcularMedias(matClases,inicio , fin );
varianzasMat = [];

[x y] = leerVector();
vector = [x;y];


for i=1:length(inicio)
    valor = calculaVarianza(nrep,matClases(1:2,inicio(i):fin(i)),mediasMat(1:2,i:i));
    varianzasMat = [varianzasMat valor];
end

%para sacar submatrices de 2x2
s = 1;
e = 2;
%calculamos las distancias
for i=1:length(inicio)
  
    firstPart = transpose( vector - mediasMat(1:2,i:i) )* inv(varianzasMat(1:2,1:2));
    second = firstPart * (vector - mediasMat(1:2,i:i));
    distancias(i) = second;
    s = s+e;
    e = e+3;

end

color = 1;

for i=1:length(inicio)
    
    ck = matClases(1:2,inicio(i):fin(i));
    plot(ck(1,:),ck(2,:),'ro','MarkerSize',10,'MarkerFaceColor',colors(color));
   
    color = color+1;
    ck = [];
    
    grid on;
    hold on;
   
end

 hold on;
 plot(vector(1,:),vector(2,:),'ro','MarkerSize',15,'MarkerFaceColor','k');
 title('Mahalanobis','FontSize',24);
 legend();


minimo = min(min(distancias));
valor = find(minimo == distancias);
fprintf("El vector pertenece a la clase %d\n",valor);


