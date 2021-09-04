clc % limpia pantalla
clear all % limpia todo
close all %cierra todo


r = 1;
opcion = 0;

while(r ~= 0)
 opcion = input("¿Que clasificador deseas usar? 1 = Primer Clasificador , 2 = Clasificador de Bayes\n");
if(opcion == 1)
    clasificador();
    clc;
    r = input('¿Quieres probar otra opcion? si = 1 , no = 0\n');
    
else
    bayesClass();
    clc;
    r = input('¿Quieres probar otra opcion? si = 1 , no = 0\n');
end

end

