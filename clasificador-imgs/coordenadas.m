clc 
clear all
close all

h = imread("playa.jpeg");
[m,n] = size(h);

% figure(1)
% imshow(h);
% 
figure(2)
dato = imref2d(size(h));
imshow(h,dato);
% figure(3)
% impixel(h);

%clase cielo
c1x = randi([0,1000],2,1500);
c1y = randi([0,215],2,1500);

classCielo = [c1x c1y];

%clase mar
c2x = randi([0,1000],2,1500);
c2y = randi([220,420],2,1500);
classMar = [c2x c2y];

%clase arena
c3x = randi([0,1000],2,1500);
c3y = randi([430,700],2,1500);
classArena = [c3x c3y];


%graficamos sobre nuestro plano
Z1 = impixel(h,c1x(1,:),c1y(2,:));
Z2 = impixel(h,c2x(1,:),c2y(2,:));
Z3 = impixel(h,c3x(1,:),c3y(2,:));
% Z4 = impixel(h,c4X(1,:),c4Y(2,:));

matclases = [classCielo classMar classArena];
[inicio,finales] = generaInicioFin(3000,matclases);

[x,y] = leerVector();
punto = [x;y];
kvecinos = input("Numero de vecinos para Knn ");

Zpunto = impixel(h,punto(1,:),punto(2,:));

grid on
hold on


plot(c1x(1,:),c1y(2,:),'ob','Markersize',10);
plot(c2x(1,:),c2y(2,:),'or','MarkerSize',10);
plot(c3x(1,:),c3y(2,:),'oc','MarkerSize',10);
plot(punto(1,:),punto(2,:),'oy','MarkerSize',10,'MarkerFaceColor','y');
legend('Cielo','Mar','Arena');

resultados = zeros(1,4);

resultados(1) = clasificadorFun(matclases,3000,3,x,y,inicio,finales);
resultados(2) = bayesFun(matclases,3000,3,x,y,inicio,finales);
resultados(3) = HalanobisFun(matclases,3000,3,x,y,inicio,finales);
resultados(4) = vecinosFunc(matclases,3000,3,x,y,inicio,finales,kvecinos);

cadResult ='';
for i=1:4 
    
    result = resultados(i);
    switch i 
        case 1
            cadResult = 'Distancia Euclidiana';
        case 2
            cadResult = 'Bayes';
        case 3
            cadResult = 'Mahalanobis';
        case 4
            cadResult = 'KNN';
    end
    
    fprintf("El vector desconocido pertenece a la clase %s segun %s\n",asignaNombre(result),cadResult);
    
end




