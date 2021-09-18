function [newWn] = nuevaWn(Wnpas,r,factorEntrada,vectCombinacion)
     %clase 1
    if(vectCombinacion == [0 0])
        factorEntrada = factorEntrada';
        newWn = Wnpas - (1 * factorEntrada);
        
    %clase 2
    else
        factorEntrada = factorEntrada';
        newWn = Wnpas + (1 * factorEntrada);
        
    end
   
end

