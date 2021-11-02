clc
clear all

char name;
[name,pathname]=uigetfile('*.JPEG');
nombre=sprintf('%s%s',pathname,name);
h=imread(nombre);
figure(1)


[m,n] = size(h);
dato = imref2d(size(h));
dato2 = imref2d(size(h));


imshow(h,dato);
%paso 1
c1y = randi([0,450],500); 
c1x = randi([0,700],500);
classuno = [c1x;c1y];

mat = impixel(h,c1x(1,:),c1y(2,:));
[mf,mc] = size(mat);

% %dejo esto con los primeros 3 puntos
Z1 = [];
Z2 = [];
Z3 = [];

distancias = [];
%cada G debe iniciar con los tres primeros puntos correspondientes

%voy a ir guardando los puntos
G1 = [];
G2 = [];
G3 = [];

[f,c] = size(mat);
puntoi = [];

iteracion = 1;
mediaTotal = [];
anterior = [];
while(1)
    
    anterior = mediaTotal;
    
    %al inicio de cada iteracion se vacean las G's
    G1 = [];
    G2 = [];
    G3 = [];
    
    if(iteracion == 1)
        
 
        Z1 = [mat(1:1,1:3)'];
        Z2 = [mat(2:2,1:3)'];
        Z3 = [mat(3:3,1:3)'];
        
    else
   
        Z1 = c1;
        Z2 = c2;
        Z3 = c3;
    end
      
for i=4:f
   
    aux = isnan(mat(i:i,1:3));
   
    if(~(length(find(aux == 1)) >= 1))
       
        puntoi = mat(i:i,1:3)';
  
    end
    
    %calcular la distancia de ese punto a cada centroide
    distancias = [ norm(puntoi - Z1),norm(puntoi - Z2),norm(puntoi - Z3) ];
    auxmin = min(distancias);
    minimo = find(abs(distancias - auxmin) < 0.001);
    
    if(length(minimo) > 1)
         minimo = minimo(1);
    end
    
        %añadimos punto al punto donde corresponde
       switch minimo
           
        case 1
            
            G1 = [G1 puntoi];
        
        case 2
            G2 = [G2 puntoi];
         
        
        case 3
            G3 = [G3 puntoi];
       
       end
           
end

%calculo de la media
c1 = mean(G1,2,'omitnan');
c2 = mean(G2,2,'omitnan');
c3 = mean(G3,2,'omitnan');

mediaTotal = [c1,c2,c3];
iteracion = iteracion+1;

%ver si la matriz de medias concatenadas  es igual a la anterior
if(isequal(mediaTotal,anterior))
   
    break;
% else
%     disp('Media total');
%     disp(mediaTotal);
%     disp('Anterior');
%     disp(anterior);

end

end


    













