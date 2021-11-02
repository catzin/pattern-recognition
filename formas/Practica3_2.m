clc %limpiar pantalla de resultados
clear all %limpia todas las variables
close all %cierra todo

disp('Práctica #3.1 - Figuras')
disp('Torres Barajas Bryan Oswaldo - Alcantara Luna Diego Alexis - Ehecatzin Vallejo Serrano')

%Proceso para leer una imagen
a = imread('figurasfinal.png');

%Binarizamos la imagen
b = im2bw(a);
a = rgb2gray(a); 
BW = im2bw(a);

%Hacemos una copia de nuestra imagen binarizada
A = b;

figure(1);
imshow(b);
title('Imagen binarizada');


%Definimos nuestro elemento estructural
B = [1, 1, 1;
     1, 1, 1;
     1, 1, 1]

%Buscamos los elementos diferentes de 0 en nuestra 
p = find(A == 1);  %Hallamos la posición de los 1 en la imagen binarizada
p = p(1);

Label = zeros(391, 818);
N = 0;

while(~isempty(p))
    N = N + 1; %Etiqueta para cada elemento de la imagen
    p = p(1);
    X = false(391, 818); %Arreglo de tipo lógico con ceros
    X(p) = 1;

    Y = A&imdilate(X, B);
    
    while(~isequal(X, Y))
        X = Y;
        Y = A&imdilate(X,B);
    end

    Pos = find(Y==1); 

    A(Pos)=0;
    %Label the components
    Label(Pos) = N;

    p = find(A==1);

end


%Hallamos las propiedades necesarias

stats = regionprops(BW, 'Perimeter', 'Area', 'Centroid', 'Boundingbox','Image');

%Definimos para poder modificar la imagen
hold on

for k = 1:length(stats)
    
    thisboundingbox = stats(k).BoundingBox;
    
    if (stats(k).Perimeter^2)/(stats(k).Area) > 18 %Triangulo
            
        if stats(k).Area > 10000
            rectangle('Position', [thisboundingbox(1), thisboundingbox(2), thisboundingbox(3), thisboundingbox(4)], 'EdgeColor', 'r', 'LineWidth', 2);
           
            t1=stats(k).Image;
            t1=uint8(t1);
            
            
            for i=1:141
                for j=1:150
                    if(t1(i,j)==1)
                            t1(i,j)=255;
                    end
                end
            end
            
           
            for i=1:141
                for j=1:150
                    if(t1(i,j)~=0)
                            t1(i,j,1);
                            t1(i,j,2) = 0;
                            t1(i,j,3) = 0;
                    end
                end
            end
          
        else
            rectangle('Position', [thisboundingbox(1), thisboundingbox(2), thisboundingbox(3), thisboundingbox(4)], 'EdgeColor', 'r', 'LineWidth', 2);
            
            t2=stats(k).Image;
            
            t2=uint8(t2);
            for i=1:103
                for j=1:115
                    if(t2(i,j)==1)
                            t2(i,j)=255;
                    end
                end
            end
            
           
            for i=1:103
                for j=1:115
                    if(t2(i,j)~=0)
                            t2(i,j,1);
                            t2(i,j,2) = 0;
                            t2(i,j,3) = 0;
                    end
                end
            end
            
        end
        
    elseif (stats(k).Perimeter^2)/(stats(k).Area) < 14.3 %Circulo
        
        if(stats(k).Area > 10000)
            rectangle('Position', [thisboundingbox(1), thisboundingbox(2), thisboundingbox(3), thisboundingbox(4)], 'EdgeColor', 'g', 'LineWidth', 2);
            
            c1=stats(k).Image;
            filler = zeros(size(img),'uint8');  % For the green and blue color planes
            c1 = cat(3,filler,c1,filler);  % Make the RGB image
            
            
        else
            rectangle('Position', [thisboundingbox(1), thisboundingbox(2), thisboundingbox(3), thisboundingbox(4)], 'EdgeColor', 'g', 'LineWidth', 2);
            
            c2=stats(k).Image;
            
            c2=uint8(c2);
            
        
    else
        %Cuadrado
        if(stats(k).Area > 10000)
            rectangle('Position', [thisboundingbox(1), thisboundingbox(2), thisboundingbox(3), thisboundingbox(4)], 'EdgeColor', 'b', 'LineWidth', 2);
        else
            rectangle('Position', [thisboundingbox(1), thisboundingbox(2), thisboundingbox(3), thisboundingbox(4)], 'EdgeColor', 'b', 'LineWidth', 2);
        end 
    end
end



arreglotriangulo=imfuse(t1,t2,'montage');
arreglorect=imfuse(c1,c2,'montage');

figure(2);
imshow(arreglotriangulo);
title('Triangulos');

figure(3);
imshow(arreglorect);
title('Cirulos');
