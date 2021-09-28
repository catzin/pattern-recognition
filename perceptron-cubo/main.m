clc
clear all

%Perceptrón con funcion AND
% @Autor: Ehecatzin Vallejo
%Email : catzin9617@gmail.com


opcion = input("Elige una opcion:\n\n1.Perceptrón AND\n2.Cubo\n");

switch opcion
    case 1
        Wn = WnAnd();
        r = input("Ingresa valor de r : ");
        [funcionFinal,iteraciones] = AND(Wn,r);
        fprintf("Funcion Wn Final :\n");
        disp(funcionFinal);
        
    case 2
        Wn = WnCubo();
        r = input("Ingresa valor de r : ");
        [funcFinal,noIteraciones] = cubo(Wn,r);
        fprintf("Funcion Wn Final :\n");
        disp(funcFinal);
end





