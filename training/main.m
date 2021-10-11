clear all
clc
format long;

fileMatsCvHalanobis = fopen('./halanobisCrossVaidation.txt','w');
fileMatsCvEuclidean = fopen('./EuclidianCrossVaidation.txt','w');
fileMatsCvBayes = fopen('./BayesCrossVaidation.txt','w');
fileMatsCvKnn = fopen('./KnnCrossVaidation.txt','w');
porcentajesFinales = fopen('./pFinales.txt','wt');
[matclases,nrep,nclases] = generarClases();
[inicio,finales] = generaInicioFin(nrep,matclases);
k = input("Numero de vecinos para Knn ");

%aqui voy a concatenar las 3 matrices de confusion de 5x5 correspondiente a
%cada metodo de entrenamiento correspondiste para cada clasificador
matsConfEndDistMinima = [];
matsConfEndBayes = [];
matsConfEndHalanobis = [];
matsConfEndKnn = [];

clc;
colors = ['b','g','r','c','m','y','k','w'];
color = 1;

figure(1)
for i=1:length(inicio)

    ck = matclases(1:2,inicio(i):finales(i));
    plot(ck(1,:),ck(2,:),'ro','MarkerSize',10,'MarkerFaceColor',colors(color));
    color = color+1;

    grid on;
    hold on;
end
legend();

for i=1:4
    switch i
         
    case 1
        [matsConfEndDistMinima,porcentaje] = pruebasDistMinima(matclases,nrep,nclases,inicio,finales,fileMatsCvEuclidean,porcentajesFinales);
        fprintf("Matrices Distancia Minima \n");
        splitConfusionMats(matsConfEndDistMinima,nclases);
        fprintf("- - - - - - - - - - - - - - \n");
    case 2
        fprintf("Matrices Bayes \n");
        matsConfEndBayes = pruebasBayes(matclases,nrep,nclases,inicio,finales,fileMatsCvBayes,porcentajesFinales);
        splitConfusionMats(matsConfEndBayes,nclases);
        fprintf("- - - - - - - - - - - - - -\n");
    case 3
        fprintf("Matrices Mahalanobis \n");
        matsConfEndHalanobis = pruebasHalanobis(matclases,nrep,nclases,inicio,finales,fileMatsCvHalanobis,porcentajesFinales); 
        splitConfusionMats(matsConfEndHalanobis,nclases);
        fprintf("- - - - - - - - - - - - - - \n");
    case 4
        fprintf("Matrices Knn \n");
        matsConfEndKnn = pruebasKnn(matclases,nrep,nclases,inicio,finales,fileMatsCvKnn,k,porcentajesFinales);
        splitConfusionMats(matsConfEndKnn,nclases);
        fprintf("- - - - - - - - - - - - - - \n");
               
    end
end
       



