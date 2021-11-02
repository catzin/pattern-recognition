clc 
clear all
close all



mat = [0 0 0 0 0; 0 0 6 3 0; 0 4 5 0 0; 0 6 0 0 0; 0 0 0 0 0];

[f , c ] = size(mat);
resultxy = 0;
for i=1:f 
    for j=1:c
        
        if(mat(i,j) ~= 0)
            fprintf("%d %d\n",i,j);
            
        end
        
    end

end



