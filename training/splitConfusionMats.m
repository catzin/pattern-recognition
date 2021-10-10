function splitConfusionMats(containerMatsConfusion)
fprintf("Matriz de confusion: Resustitución\n");
disp(containerMatsConfusion(:,1:5));
fprintf("\n");
fprintf("Matriz de confusion: Cross Validation\n");
disp(containerMatsConfusion(:,6:10));
fprintf("\n");
fprintf("Matriz de confusion: Hold in one\n");
disp(containerMatsConfusion(:,11:15));

end

