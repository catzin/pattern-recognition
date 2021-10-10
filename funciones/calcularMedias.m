function [mediasmat] = calcularMedias(matclases,inicio,finales)
%calculamos las medias y vamos añadiendo a una matriz contenedora de todas
%las medias  para cada matriz de clase ckn
mediasmat = [];
for i=1:length(inicio)
    media = mean(matclases(1:2,inicio(i):finales(i)),2);
    mediasmat = [mediasmat media];
end

end

