clc;
clear all;

%Buscamos la imagen a abrir
char name;
[name,pathname] = uigetfile('*.JPEG');
nombre = sprintf('%s%s',pathname,name);
I = imread(nombre);

%Ploteo de la imagen
figure(1);
Idim = size(I); %Sacamos las dimensiones de la imagen 1=y, 2=x
I2D = imref2d(Idim); %Pasamos la imagen a coordenadas 2D (?)
imshow(I,I2D); %Mostramos la imagen

%Se pide al usuario el numero de puntos a generar
np = input("Numero de puntos a generar sobre la imagen: ");

%Generacion de los puntos aleatorios que vamos a ordenar
Px = randi(Idim(2), 1, np); %Arreglo de x's generadas al azar
Py = randi(Idim(1), 1, np); %Arreglo de y's generadas al azar
puntos = [Px;Py]; %Arreglo de los puntos generados aleatoriamente

%Ploteo de los puntos generados al azar sobre la imagen
figure(2)
imshow(I,I2D); %Mostramos la imagen de nuevo (?)
grid on; %Ponemos la rejilla
hold on; %Mantemos lo que ya habiamos ploteado (La imagen)
plot(Px,Py,'.k','MarkerSize',15); %Ploteamos los puntos sobre lo que "holdeamos"

%Pedimos al usuario cuantos k quiere y mandamos la matriz RGB al K-means
k = input("Numero de k: ");

%Sacamos el RGB respectivo de cada punto
puntosRGB = impixel(I,Px,Py);

%K-MEANS(INICIO)------------------------------------------------------------------------------------------------------------
Zr = randi([0,255], k, 1); %Arreglo de x's generadas al azar del centroide en rgb (columnas)
Zg = randi([0,255], k, 1); %Arreglo de y's generadas al azar del centroide en rgb (columnas)
Zb = randi([0,255], k, 1); %Arreglo de z's generadas al azar del centroide en rgb (columnas)
Z = [Zr,Zg,Zb]; %Inicializamos el arreglo de centroides con centroides aleatorios

Zop(1:k,1:3) = -1; %Inicializamos "Z optima" a un valor que no puedan tomar las Z generadas al azar
Itcont = 1; %Contador de iteraciones

%Pedimos al usuario el umbral que deben satisfacer los nuevos centroide para considerarse optimos
Mmax = input("Distancia maxima que los centroides pueden recorrer sin que se considere que se movieron: ");
M = Mmax+1; %Inicializamos la variable "Movimiento"

%While de las iteraciones
%(Mientras el promedio de las distancias entre los respectivos puntos de Z y Zop sean mayores al movimiento maximo permitido)
while( M > Mmax )
    
    Zop = Z; %Guardamos los centroides actuales como los mas optimos
    Ci = []; %Inicializamos el arreglo de clases (que solo contendra los indices de los puntos de la clase)
    Ccont = zeros(1,k); %Inicializamos el arreglo que contendra los contadores de las clases
    
    %for que revisa los puntos
    for i=1:np
        
        Zmin = 0; %Inicializamos la variable que nos dice el centroide mas cercano
        Dmin = 450; %Asignamos como distancia minima inicial una mas grande que la distancia maxima posible en la escala RGB
                
        %for que revisa cada una de las distacias con los centroides
        for j=1:k
            Dtest = pdist([puntosRGB(i,:); Z(j,:)]); %Medimos la distancia entre el punto RGB i y el centroide j 
            if( Dtest < Dmin ) %Si la distancia testeada es menor a la Dmin actual
                Dmin = Dtest; %La asignamos como la nueva distancia minima
                Zmin = j; %Y guardamos el centroide que nos genero esa distancia 
            end
        end
        Ccont(Zmin) = Ccont(Zmin)+1; %Aumentamos el contador de la clase correspondiente
        Cdim = size(Ci); %Medimos el arreglo de clases
        if( Ccont(Zmin) > Cdim(1) ) %Si alguno de los contadores supera la capacidad de la matriz de clases
            Ci = [Ci; zeros(1,k)]; %Agregamos una nueva fila de ceros a dicha matriz
        end
        
        %Ingresamos el indice del punto que estabamos revisando a la clase cuyo centroide esta mas cercano al mismo
        Ci(Ccont(Zmin),Zmin) = i;
        %Y medimos el nuevo centroide sacando la media entre el punto que estamos revisando y el centroide actual
        Z(Zmin,:) = [ (Z(Zmin,1)+puntosRGB(i,1))/2, (Z(Zmin,2)+puntosRGB(i,2))/2, (Z(Zmin,2)+puntosRGB(i,2))/2 ];
        
        %Calculamos cuanto se movieron los centroides con respecto a su anterior posicion
        Maux = zeros(1,k); %Inicializamos una variable auxiliar
        for j=1:k %Por cada punto en Z y Zop
            Maux = [ Maux(1,:), pdist([Z(j,:); Zop(j,:)])]; %Añadimos la distancia que hay entre los respectivos puntos de Z y Zop a Maux
        end
        M = mean(Maux); %Y luego promediamos esas distancias
        
        Itcont = Itcont+1; %Aumentamos el contador de iteraciones
    end
end
%K-MEANS(FIN)---------------------------------------------------------------------------------------------------------------

%Ploteo de las clases
figure(3)
imshow(I,I2D); %Mostramos la imagen de nuevo (?)
grid on; %Ponemos la rejilla
hold on; %Mantemos lo que ya habiamos ploteado (La imagen)
for i=1:k %for que plotea cada clase
    color = [ randi([0, 10])/10, randi([0, 10])/10, randi([0, 10])/10]; %Color de la clase generado al azar
    for j=1:max(Ccont) %for que revisa cada punto de la clase
        if( Ci(j,i) == 0 )
            break;
        else
            plot( puntos(1,Ci(j,i)), puntos(2,Ci(j,i)), '.', 'MarkerSize',15, 'Color', color); %Ploteamos los puntos de la clase
        end
    end
end