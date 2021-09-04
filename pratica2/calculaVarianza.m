function [varianza] = calculaVarianza(ck,nrep,media)
subvar = (ck - media);
varianza = 1/nrep  * (subvar * transpose(subvar));

end

