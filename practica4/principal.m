clear all


[matclases,nrep,nclases] = generarClases();
[inicio,fin] = generaInicioFin(nrep,matclases);
[x,y] = leerVector();
vector = [x;y];
fprintf("Menu:\n 1.Clasificador Euclidiano \n 2.Clasificador de Bayes \n 3.Clasificador de MejalasNobis \n 4.Clasificador de Vecinos \n 5.Todos\n");
entrada = input("ingresa opcion : ");

switch  entrada 
    case 1
        clasificadorFun(matclases,nrep,nclases,x,y,inicio,fin);
        
    case 2
         bayesFun(matclases,nrep,nclases,x,y,inicio,fin);
         
    case 3
        HalanobisFun(matclases,nrep,nclases,x,y,inicio,fin);
        
    case 4
        vecinosFunc(matclases,nrep,nclases,x,y,inicio,fin);
        
        
end