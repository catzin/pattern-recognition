function [funcionFinal,cont] = clasificadorOR(funcion,Wn,r,opcion)

%inicialmente se propone wn
Wn = [1; 1; 1];
%se propone R
r = 1;
%x3 se propone en 1
x3 = 1;
%empezamos con 1 iteracion
iteraciones = 1;
cont = 0;

while(iteraciones)
    fprintf("Iteracion : %d\n",cont);
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
        
        %si es  [0 0] entonces es la clase 1
        if(combinacion == [0 0])
            factCheck = factEntrada * Wn;
            
            %si entras aqui entonces calcula una nueva Wn
            if(factCheck >= 0)
                iteraciones = 1;
                antWn = Wn;
                Wn = nuevaWn(antWn,r,factEntrada,combinacion);
                
                
            end
        else
            %aqui es clase 2 entonces
            factCheck = factEntrada * Wn;
            
            if(factCheck <= 0)
                
                iteraciones = 1;
                antWn = Wn;
                Wn = nuevaWn(antWn,r,factEntrada,combinacion);
                
            end
            
        end
        
    end
    disp(Wn);
    cont = cont+1;
end
funcionFinal = Wn;
%00 01 10 11
clase1 = [0;0]
clase2 = [0 1 1; 0 1 1];
x = linspace(-1,2,10);
y = funcionFinal(1)*x + funcionFinal(2)*x + funcionFinal(3);

figure(1)

plot(clase1(1,:),clase1(2,:),'ro','MarkerFaceColor','r','MarkerSize',10);

grid on
hold on
plot(clase2(1,:),clase2(2,:),'bo','MarkerFaceColor','b','MarkerSize',10);

plot(x,y);

xlabel('eje x');
ylabel('eje y');

legend('clase 1','clase 2');


end

