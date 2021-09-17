function [funcionFinal,cont] = Reglaclasificacion(funcion,Wn,r,opcion)
%Esta funcion me va a retornar un valor




%inicialmente se propone wn
Wn = [1; 1; 1];
%se propone R
r = 1;
%x3 se propone en 1
x3 = 1;
%empezamos con 1 iteracion
iteraciones = 1;
cont = 0;

%Or
if(opcion == 1)
    

    fprintf("Opcion OR\n");

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
        
        %aqui es clase 1
        if(combinacion == [0 0])
            factCheck = factEntrada * Wn;
            
            %si entras aqui entonces calcula una nueva Wn
            if(factCheck >= 0)
                iteraciones = 1;
                antWn = Wn;
                Wn = nuevaWn(antWn,r,factEntrada,combinacion,opcion);
                
                
            end
        else
            %aqui es clase 2 entonces
            factCheck = factEntrada * Wn;
            
            if(factCheck <= 0)
                
                iteraciones = 1;
                antWn = Wn;
                Wn = nuevaWn(antWn,r,factEntrada,combinacion,opcion);
                
            end
            
        end
        
    end
    
    cont = cont+1;
end
funcionFinal = Wn;
end

if(opcion == 2)
    fprintf("Opcion AND\n");
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
            
       
            %si es diferente de [1 1] es la clase 1
            if(combinacion ~= [1,1])
               
                factCheck = factEntrada * Wn;
                
                %si entras aqui entonces calcula una nueva Wn
                if(factCheck >= 0)
             
                    iteraciones = 1;
                    antWn = Wn;
                    Wn = nuevaWn(antWn,r,factEntrada,combinacion,opcion);
                    
                    
                end
            else
                %si es [ 1 1] es la clase 2
                factCheck = factEntrada * Wn;
                
                if(factCheck <= 0)
                    
                    iteraciones = 1;
                    antWn = Wn;
                    Wn = nuevaWn(antWn,r,factEntrada,combinacion,opcion);
                    
                end
                
            end
            
        end
       
        cont = cont+1;
    end
funcionFinal = Wn;
end


% x = 0 : 10;
% m = -1;
% b = 0.5;
% y = m*x + b;
% figure(1)
% plot(x, y)
% grid
% axis([0  5    0  12])








end

