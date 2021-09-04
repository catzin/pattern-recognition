function clasificadorFun(matclases,nrep,nclases,x,y,inicio,finales)

colors = ['b','g','r','c','m','y','k','w'];
medias = [];
distancias = [];

%calculamos las medias y vamos añadiendo a una matriz contenedora de todas
%las medias  para cada matriz de clase ckn
for i=1:length(inicio)
    media = mean(matclases(1:2,inicio(i):finales(i)),2);
    medias = [medias media];
end

% [data_x, data_y] = leerVector();
% vector = [data_x;data_y];
%  data_x = input("ingresa x \n");
%  data_y = input("ingresa y \n");
% 
 vector = [x;y];
  
 for i=1:nclases 
     distancias(i) = norm(vector- medias(1:2,i));
 end


figure(4)
color = 1;

for i=1:length(inicio)
    
    ck = matclases(1:2,inicio(i):finales(i));
    plot(ck(1,:),ck(2,:),'ro','MarkerSize',10,'MarkerFaceColor',colors(color));
   
    color = color+1;
    ck = [];
    
    grid on;
    hold on;
   
end

 hold on;
 
 plot(vector(1,:),vector(2,:),'ro','MarkerSize',15,'MarkerFaceColor','k');
 title('Clasificador 1','FontSize',24);
 legend();

 dist_total= distancias;
 minimo = min(min(dist_total));
 valor = find(dist_total==minimo);
%  fprintf("La distancias obtenidas son\n");
%  disp(distancias);
 fprintf('(Clasificador1 :)el vector desconocido pertenece a la clase = %d\n',valor);



