clc %limpiar pantalla de resultados
clear all %limpia todas las variables
close all %iierra todo



%Proieso para leer una imagen
a = imread('figuras2.png');
b = rgb2gray(a);

figure(1);
imshow(b);
title('Imagen Original');

%Barrido e identifiiaiión de objetos
bandera=0;
banderaobjeto=0;
for i = 1:390
    for j = 1:818
        banderaobjeto=0;
        if(bandera==0)
            if(b(i,j)==255)
                
           
                b(i,j)=1;
                bandera=1;
                disp(i);
                disp(j);
            end
            
        else
            if(b(i,j)~=0)
                %Misma fila
                if(b(i,j+1)~=0 && b(i,j+1)~=255)
                    valor=b(i,j+1);
                    b(i,j)=valor;
                    banderaobjeto=1;
                end
                if(b(i,j-1)~=0 && b(i,j-1)~=255)
                    valor=b(i,j-1);
                    b(i,j)=valor;
                    banderaobjeto=1;
                end
                
                %Fila de abajo
                if(b(i+1,j+1)~=0 && b(i+1,j+1)~=255)
                    valor=b(i+1,j+1);
                    b(i,j)=valor;
                    banderaobjeto=1;
                end
                if(b(i+1,j-1)~=0 && b(i+1,j-1)~=255)
                    valor=b(i+1,j-1)
                    b(i,j)=valor;
                    banderaobjeto=1;
                end
                if(b(i+1,j)~=0 && b(i+1,j)~=255)
                    valor=b(i+1,j);
                    b(i,j)=valor;
                    banderaobjeto=1;
                end
            
                %Fila de arriba
                
                if(b(i-1,j)~=0 && b(i-1,j)~=255)
                    valor=b(i-1,j);
                    b(i,j)=valor;
                    banderaobjeto=1;
                end
                if(b(i-1,j+1)~=0 && b(i-1,j+1)~=255)
                    valor=b(i-1,j+1);
                    b(i,j)=valor;
                    banderaobjeto=1;
                end
                if(b(i-1,j-1)~=0 && b(i-1,j-1)~=255)
                    valor=b(i-1,j-1);
                    b(i,j)=valor;
                    banderaobjeto=1;
                end
                if(banderaobjeto==0)
                    b(i,j)=bandera+1;
                    bandera=bandera+1;
                end
            end
            
        end
         
    end
    
end

for i = 1:390
    for j = 1:818
        if(b(i,j)==1)
            a(i,j,1);
            a(i,j,2) = 0;
            a(i,j,3) = 0;
        end
        
        if(b(i,j)==2)
            a(i,j,1)=0;
            a(i,j,2);
            a(i,j,3) = 0;
        end
        
        if(b(i,j)==3)
            a(i,j,1)=0;
            a(i,j,2)=0;
            a(i,j,3);
        end
        
        if(b(i,j)==4)
            a(i,j,1)=0;
            a(i,j,2);
            a(i,j,3);
        end
        
    end
end

figure(4);
imshow(a);
title('Pitnada');