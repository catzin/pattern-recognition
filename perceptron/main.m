clc
clear all

%aqui estan las combinaciones de nuestra tabla de verdad
funcion = [0 0; 0 1; 1 0; 1 1];
%inicialmente se propone wn
Wn = [1; 1; 1];
%se propone R
r = 1;

opcion = 2;
[funcionFinal,iteraciones] = Reglaclasificacion(funcion,Wn,r,opcion);

disp(funcionFinal);
fprintf("Funcion Final : %dx1 %dx2 %d\n",funcionFinal);