clc 
clear all
close all

h = imread("lago.jpg");
[m,n] = size(h);

% figure(1)
% imshow(h);
% 
figure(2)
dato = imref2d(size(h));
imshow(h,dato);
% figure(3)
% impixel(h);

%clase mar
c1X = randi([350,2000],2,2000);
c1Y = randi([750,1300],2,2000);

%clase rocas
c2X = randi([0,800],2,2000);
c2Y = randi([890,1800],2,2000);


%clase cielo
c3X = randi([230,1900],2,2000);
c3Y = randi([0,400],2,2000);




%graficamos sobre nuestro plano
Z1 = impixel(h,c1X(1,:),c1Y(2,:));
Z2 = impixel(h,c2X(1,:),c2Y(2,:));




grid on
hold on


plot(c1X(1,:),c1Y(2,:),'ob','Markersize',10);
plot(c2X(1,:),c2Y(2,:),'or','MarkerSize',10);
plot(c3X(1,:),c3Y(2,:),'oc','MarkerSize',10);



[x,y] = leerVector();
% x = 100;
% y = 100;
punto = [x;y];

Zpunto = impixel(h,punto(1,:),punto(2,:));
% 
% kvecinos = input("Numero de vecinos para Knn ");
% plot(punto(1,:),punto(2,:),'oy','MarkerSize',10,'MarkerFaceColor','y');

%resultados 

resultados = [];
matClases = [Z1 Z2];

[inicio,finales]= inicioFinMatsImgs(2);

valor = euclideanClassifierImgs(matClases,2,Zpunto,inicio,finales);


