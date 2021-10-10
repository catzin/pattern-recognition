clc 
clear all



%parte de la imagen


h = imread("mar.jpeg");
[m,n] = size(h);

% figure(1)
% imshow(h);
% 
figure(2)
dato = imref2d(size(h));
imshow(h,dato);


% figure(3)
% impixel(h);

c1X = randi([100,910],2,200);
c1Y = randi([0,290],2,200);

c2X = randi([90,910],2,200);
c2Y = randi([400,650],2,200);


c3X = randi([300,910],2,200);
c3Y = randi([300,350],2,200);

%graficamos sobre nuestro plano
Z1 = impixel(h,c1X(1,:),c1Y(2,:));
Z2 = impixel(h,c2X(1,:),c2Y(2,:));
Z3 = impixel(h,c3X(1,:),c3Y(2,:));



punto = [px;py];

p1 = impixel(h,punto(1,:),punto(2,:));
grid on
hold on

plot(c1X(1,:),c1Y(2,:),'ob','Markersize',10);
plot(c2X(1,:),c2Y(2,:),'or','MarkerSize',10);
plot(c3X(1,:),c3Y(2,:),'og','MarkerSize',10);
plot(punto(1,:),punto(2,:),'oy','MarkerSize',10,'MarkerFaceColor','y');


%calculo de las medias

media1 = mean(Z1,'omitnan');
media2 = mean(Z2,'omitnan');
media3 = mean(Z3,'omitnan');


dist1 = norm(media1 - p1)

% Si se qiere usar el ejemplo de clase
% c1 = [0 1 1 1; 0 0 1 0;0 0 0 1];
% c2 = [0 1 0 0;0 1 1 1; 1 1 1 0];

% las medias deben ir de 1:3 , las varianzas 1:3 , y las matrices igual 1:3
%modificar las respecticas funciones(calcularMedias() ) y secciones de este codigo
%como e = 3 y filas de algunamatriz(1:3)
%como vamos a trabajar con 2D, no mover nada, ya funciona

colors = ['b','g','r','c','m','y','k','w'];

%se generan las N clases y se meten a una matriz contenedora
matClases = []
[matClases,nrep,nclases] = generarClases();
%calculamos donde inicia y termina cada matriz Ck
[inicio,fin] = generaInicioFin(nrep,matClases);
%calculamos las medias de cada Ck de forma 2 x 1 (dos filas una col)




mediasMat = calcularMedias(matClases,inicio,fin);
%matriz contenedora de varianzas de tamaño 2x2(matrices)
varianzasMat = [];
%vector para guardar las distancias finales su tamaño depende del numero de
%clases
distancias = [];

%funcion que lee el vector
% [x,y] = leerVector();
vectorPlot = [x;y];

%las varianzas quedan como submatrices de 2x2 y se concatenan a la matriz
%varianzasMat
for i=1:length(inicio)
    valor = calculaVarianza(nrep,matClases(1:2,inicio(i):fin(i)),mediasMat(1:2,i:i));
    varianzasMat = [varianzasMat valor];
end

% %para sacar submatrices de 2x2
s = 1;
e = 2;
%calculamos las distancias
for i=1:length(inicio)
    
    vector = vectorPlot';
    vectormed = vector - mediasMat(1:1,i:i);
    vectornormal = vectorPlot - mediasMat(1:1,i:i);
    var = varianzasMat(1:2,s:e);
    inversa = inv(var);

    if(isinf(inversa))
        disp('detectado');
        inversa = [0 0; 0 0];
    end;
    
    resul = vectormed * inversa * vectornormal;
    
    distancias(i) = resul;
    
    s = e+1;
    e = s+1;
    



end

color = 1;

for i=1:length(inicio)
    
    ck = matClases(1:2,inicio(i):fin(i));
    plot(ck(1,:),ck(2,:),'ro','MarkerSize',10,'MarkerFaceColor',colors(color));
   
    color = color+1;
   
    grid on;
    hold on;
  
   
end

 hold on;
 plot(vectorPlot(1,:),vectorPlot(2,:),'ro','MarkerSize',15,'MarkerFaceColor','k');
 title('Mahalanobis','FontSize',24);
 legend();
%  2 x 4  *  4 x2   = 2 x 2


minimo = min(min(distancias));
valor = find(minimo == distancias);
fprintf("El vector pertenece a la clase %d\n",valor);


