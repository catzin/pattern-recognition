function bayesClass()

clc % limpia pantalla
clear all % limpia todo
close all %cierra todo
format shortEng

colors = ['b','g','r','c','m','y','k','w'];
%caso de clase
% nrep = 5;
% nclases = 3;
% c1 = [0 0 1 0 2;0 1 1 1 1];
% c2 = [5 5 4 6 6; 5 6 5 5 9];
% c3 = [9 10 11 10 9; 10 11 9 12 12];
% vector = [8 6];
% vectorplot = [8;6];
% matclases = [c1 c2 c3];

[matclases,nrep,nclases] = generarClases();
[inicio,finales] = generaInicioFin(nrep,matclases);

[x,y] = leerVector();
vector = [x y];
vectorplot = [x;y];
respuesta = 1;

while(respuesta ~=3)
   
[mediasmat] = calcularMedias(matclases,inicio,finales);
varianzas = [];
partA = [];
partB = [];
subFinal = [];


%part A of operation  
for i=1:length(mediasmat)
    resta = vector - transpose(mediasmat(1:2,i));

    %saco su transpuesta de una vez
    transResta = transpose(resta);
    %calculamos la varianza para ck recibe ck,#representantes,media ck
    varianza = calculaVarianza(matclases(1:2,inicio(i):finales(i)),nrep,mediasmat(1:2,i));
    %despues utilizo un aux para agarrar la transpuesta de la actual varian
    %za de ck
    invvarianzack = inv(varianza);
    %guardo la varianza original de ck en varianzas para ocuparla mas
    %adelante
    varianzas = [varianzas varianza];
    %caculo la parte A de todo el choro matematico para cada Ck
    partA(i) = exp(-0.5 * resta * invvarianzack * transResta);
   
end

%parte B de cada Ck

defaultb = (1/ (2 * pi)); 
init = 1;
endd = 2;
%varianzas son submatrices de 2x2 para cada Ck
for i=1:length(mediasmat)
    partB(i) = defaultb * det(varianzas(1:2,init:endd) ^ -0.5);
    init = endd + 1;
    endd = init +1;
    
end

%por ultimo calculo los resultados de multiplicar la parte A por la parte B
%de todo el choro matematico
for i=1:length(mediasmat)
        aux  = partA(i) * partB(i);
        subFinal = [subFinal aux];
end

%ploteo
figure(3)
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
 plot(vectorplot(1,:),vectorplot(2,:),'ro','MarkerSize',15,'MarkerFaceColor','k');
 title('Clasificado de Bayes','FontSize',24);
 legend();
 

%calcular las ps
ps =[ ];
%sumatoria de probabilidades
sumaProb = 0;
for i=1:length(subFinal)
    sumaProb = sumaProb + subFinal(1);
end

for i=1:length(subFinal)
    ps(i) = (subFinal(i) / sumaProb)*100;
end

prob_total = ps;
maximo = max(max(prob_total));
valor = find(prob_total == maximo);

fprintf("(Bayes: ) El vector desconocido pertenece a la clase %d\n",valor);
 respuesta = input("ELige una nueva opcion\n 1.Otro Vector\n 2.Comparar con Clasificador 1 \n 3.Salir\n");

 if(respuesta == 1)
     clc;
     close();
     [x,y] = leerVector();
     vector = [x y];
     vectorplot = [x;y];

 else
     
     if(respuesta == 2)
         clc;
         close();
         %funcion individual de clasificador1
         clasificadorFun(matclases,nrep,nclases,x,y,inicio,finales);
     else
         %salir
         close();
         break;
      
     end
     
 end
 
 end
 
end

