function graficador(diagRes,diagCross,diagHO,nclases,nameClasificador,numPlot)

NumClasesVec = 1:1:nclases;

figure(numPlot)
%primera grafica para resustitucion
subplot(2,2,1);
plot(NumClasesVec,diagRes,'-o');
%Genera nuestra grafica, en este caso estamos generando mas de una grafica a la vez.
grid on; %Activa la rejilla de la grafica.
title(strcat("Clasificador ","Resustitucion")); %Define el titulo de la grafica.
                                                %strcat() concatena dos string.
xlabel('Numero de Clase'); %Define la etiqueta que tendra el eje x.
ylabel('% de Eficiencia'); %Define la etiqueta que tendra el eje x.
axis([1 nclases 0 100]); %Define los valores limite que tendra nuestra
                           %grafica en sus ejes "x" y "y" respectivamente.

%termina primera grafica para resustitucion

%grafica CrossOver

subplot(2,2,2);
plot(NumClasesVec,diagCross,'-o');
%Genera nuestra grafica, en este caso estamos generando mas de una grafica a la vez.
grid on; %Activa la rejilla de la grafica.
title(strcat("Clasificador ","Cross-Over")); %Define el titulo de la grafica.
                                                %strcat() concatena dos string.
xlabel('Numero de Clase'); %Define la etiqueta que tendra el eje x.
ylabel('% de Eficiencia'); %Define la etiqueta que tendra el eje x.
axis([1 nclases 0 100]); %Define los valores limite que tendra nuestra
                           %grafica en sus ejes "x" y "y" respectivamente.
%fin Croos-over

%hold in one

subplot(2,2,3);
plot(NumClasesVec,diagHO,'-o');
%Genera nuestra grafica, en este caso estamos generando mas de una grafica a la vez.
grid on; %Activa la rejilla de la grafica.
title(strcat("Clasificador ","Hold in one")); %Define el titulo de la grafica.
                                                %strcat() concatena dos string.
xlabel('Numero de Clase'); %Define la etiqueta que tendra el eje x.
ylabel('% de Eficiencia'); %Define la etiqueta que tendra el eje x.
axis([1 nclases 0 100]); %Define los valores limite que tendra nuestra
                           %grafica en sus ejes "x" y "y" respectivamente.

%fin hold in one

sgtitle(nameClasificador);

end

