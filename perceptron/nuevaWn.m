function [newWn] = nuevaWn(Wnpas,r,factorEntrada,vectCombinacion,opcion)
if(opcion == 1)
    if(vectCombinacion == [0 0])
        factorEntrada = factorEntrada';
        newWn = Wnpas - (1 * factorEntrada);
        
        
    else
        factorEntrada = factorEntrada';
        newWn = Wnpas + (1 * factorEntrada);
        
        
    end
    
else
    %si es diferente de 1 1 es la clase 1
    if(vectCombinacion ~= [1 1])
        factorEntrada = factorEntrada';
        newWn = Wnpas - (1 * factorEntrada);
        
        
    else
        %si es 1 1 es la clase 2
        factorEntrada = factorEntrada';
        newWn = Wnpas + (1 * factorEntrada);
        
        
    end
    
     
    
end


end

