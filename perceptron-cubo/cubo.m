function [final,iteraciones] = cubo(wn,r)

c1 = [1 0 1 1; 0 0 0 1; 1 0 0 0];
c2 = [0 0 1 0; 0 1 1 1;1 1 1 0];

ctotal = [c1;c2];
x4 = 1;
%bandera para saber si se hace otra iteracion
iteraciones = 1;
%contador de iteraciones
cont = 1;
while(iteraciones)
    
    fprintf("iteracion %d\n",cont);
    iteraciones = 0;
    
    for i=1:2
        
        for j=1:4
            
            if(i ~= 2)
                %             disp("primeros 4");
                data = ctotal(1:3,j:j)';
                
                factEntrada = [data x4];
                
                fsal = factEntrada * wn;
                
                if(fsal >= 0)
                    iteraciones = 1;
                    wn = wn - (r * factEntrada');
                end
                
            else
                %             disp("segundos 4");
                data = ctotal(4:6,j:j)';
                
                factEntrada = [data x4];
                fsal = factEntrada * wn;
                
                if(fsal <= 0)
                    iteraciones = 1;
                    wn = wn + (r * factEntrada');
                end
                
            end
            
        end
        
    end
    %se imprime en cuanto queda wn en esta iteracion
    disp(wn);
    disp("----------------");
    
    %contador de iteraciones
    cont = cont+1;
    
    
end

final = wn;

figure(1)
[x,y] = meshgrid(-2:0.25:2,-1:0.2:1);
z = final(1)*x + final(2)*x + final(3)+ final(4);

[U,V,W] = surfnorm(x,y,z);

quiver3(x,y,z,U,V,W)
hold on
surf(x,y,z)
hold on
plot3(c2(:,1:1),c2(:,2:2),c2(:,2:2),'ro','MarkerFaceColor','r','Markersize',10);
plot3(c1(:,1:1),c1(:,2:2),c1(:,2:2),'bo','MarkerFaceColor','b','Markersize',10);


axis equal



end

