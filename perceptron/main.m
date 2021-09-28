clc
clear all

%Perceptrón con funcion AND
% @Autor: Ehecatzin Vallejo
%Email : catzin9617@gmail.com

%aqui estan las combinaciones de nuestra tabla de verdad
funcion = [0 0; 0 1; 1 0; 1 1];
%inicialmente se propone wn
Wn = [1; 1; 1];
%se propone R
r = 1;
x3 = 1;

% Ejemplo de Funcion OR visto en clase
% [funcionFinal,iteraciones] = clasificadorOR(funcion,Wn,r);
% 
% disp(funcionFinal);
% fprintf("Funcion Final : %dx1 %dx2 %d\n",funcionFinal);

iteraciones = 1;
cont = 0;

while(iteraciones)
    %a lo largo del ciclo for, se modifica la bandera(se pone en 1) para saber si hay mas
    %iteraciones posteriores(por un cambio en Wn que nos fuerza a eso),
    %cuando vuelve a entrar necesito que sea cero, para si en
    %este ciclo se vuelve a enceder la bandera,para que posteriormente se vuelva a
    %hacer el ciclo y asi , hasta que llegemos a una solucion sin cambios
    %y por lo tanto sin nuevas iteraciones
    iteraciones = 0;
    for i=1:4
        
        combinacion = funcion(i:i,:);
        factEntrada = [combinacion x3];
        %aqui esta la operacion factentrada * Wn actual
        
        %ai es diferente de [ 1 1] entonces es la clase 1
        if(combinacion == [1 1])
            factCheck = factEntrada * Wn;
            
            %si entras aqui entonces calcula una nueva Wn
            if(factCheck >= 0)
                iteraciones = 1;
                antWn = Wn;
                
                factorEntrada = factEntrada';
                Wn = antWn - (1 * factorEntrada);
                
                
            end
        else
            %aqui es [ 1 1 ] entonces es la clase 2 
            factCheck = factEntrada * Wn;
            
            if(factCheck <= 0)
                
                iteraciones = 1;
                antWn = Wn;
                factorEntrada = factEntrada';
                Wn = antWn + (1 * factorEntrada);
            
            end
            
        end
        
    end
   
    cont = cont+1;
end

funcionFinal = Wn;

figure(1)
b = 0;
x = -5:0.01:5;
y = -3*x -2*x + 4;
z = zeros(size(x));
plot(x,y,'r');
hold on
plot(x,z,'b');
plot(z,y,'b');
hold off


