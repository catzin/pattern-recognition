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
c1X = randi([350,2000],2,500);
c1Y = randi([750,1300],2,500);
%clase rocas
c2X = randi([0,780],2,500);
c2Y = randi([890,1300],2,500);

%clase cielo
c3X = randi([200,2000],2,500);
c3Y = randi([0,300],2,500);

%clase verdes
c4X1 = randi([0,1500],2,200);
c4Y1 = randi([610,750],2,200);

c4X2 = randi([0,200],2,200);
c4Y2 = randi([0,800],2,200);

c4X3 = randi([250,800],2,200);
c4Y3 = randi([500,700],2,200);

%clase montaña
c5X = randi([230,1600],2,500);
c5Y = randi([230,580],2,500);

%graficamos sobre nuestro plano
Z1 = impixel(h,c1X(1,:),c1Y(2,:));
Z2 = impixel(h,c2X(1,:),c2Y(2,:));
Z3 = impixel(h,c3X(1,:),c3Y(2,:));
Z4 = impixel(h,c4X1(1,:),c4Y2(2,:));
Z41 = impixel(h,c4X2(1,:),c4Y2(2,:));
Z42 = impixel(h,c4X3(1,:),c4Y3(2,:));
Z4Total = [Z4 Z41 Z42];
Z5 = impixel(h,c5X(1,:),c5Y(2,:));

grid on
hold on

plot(c1X(1,:),c1Y(2,:),'ob','Markersize',10);
plot(c2X(1,:),c2Y(2,:),'or','MarkerSize',10);
plot(c3X(1,:),c3Y(2,:),'og','MarkerSize',10);
plot(c4X1(1,:),c4Y1(2,:),'oc','MarkerSize',10);
plot(c4X2(1,:),c4Y2(2,:),'oc','MarkerSize',10);
plot(c4X3(1,:),c4Y3(2,:),'oc','MarkerSize',10);
plot(c5X(1,:),c5Y(2,:),'ow','MarkerSize',10);
% plot(punto(1,:),punto(2,:),'oy','MarkerSize',10,'MarkerFaceColor','y');

