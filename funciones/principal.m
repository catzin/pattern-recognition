clear all

[matclases,nrep,nclases] = generarClases();
[inicio,fin] = generaInicioFin(nrep,matclases);

opcion = 1;
while(opcion ~= 0)
[x,y] = leerVector();
vector = [x;y];
fprintf("Menu:\n 1.Clasificador Euclidiano \n 2.Clasificador de Bayes \n 3.Clasificador de Halanobis \n 4.Clasificador de Vecinos \n 5.Todos\n");
entrada = input("ingresa opcion : ");

switch  entrada 
    case 1
        plotear(matclases,vector,inicio,fin);
        clasificadorFun(matclases,nrep,nclases,x,y,inicio,fin);
        
        opcion = input("¿Quieres probar otra opcion? si = 1 no = 0 ");
        if(opcion == 1) 
            close();
        else
            close();
        end
        
        
    case 2
        plotear(matclases,vector,inicio,fin);
         bayesFun(matclases,nrep,nclases,x,y,inicio,fin);
         opcion = input("¿Quieres probar otra opcion? si = 1 no = 0 ");
         if(opcion == 1) 
            close();
        else
            close();
        end

         
    case 3
        plotear(matclases,vector,inicio,fin);
        HalanobisFun(matclases,nrep,nclases,x,y,inicio,fin);
        opcion = input("¿Quieres probar otra opcion? si = 1 no = 0 ");
        if(opcion == 1) 
            close();
        else
            close();
        end

        
    case 4
        plotear(matclases,vector,inicio,fin);
        vecinosFunc(matclases,nrep,nclases,x,y,inicio,fin);
        opcion = input("¿Quieres probar otra opcion? si = 1 no = 0 ");
        
    case 5
        plotear(matclases,vector,inicio,fin);
        clasificadorFun(matclases,nrep,nclases,x,y,inicio,fin);
        bayesFun(matclases,nrep,nclases,x,y,inicio,fin);
        HalanobisFun(matclases,nrep,nclases,x,y,inicio,fin);
        vecinosFunc(matclases,nrep,nclases,x,y,inicio,fin);
        opcion = input("¿Quieres probar otra opcion? si = 1 no = 0 ");
        if(opcion == 1) 
            close();
        else
            close();
        end      
end

end