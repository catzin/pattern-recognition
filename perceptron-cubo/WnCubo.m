function [Wn] = WnCubo()
fprintf("ingresa Wn [ x x x x] propuesto\n");
x1 = input("");
fprintf("[%d x x]\n",x1);
x2 = input("");
fprintf("[%d %d x]\n",x1,x2);
x3 = input("");
fprintf("[%d %d %d x]\n",x1,x2,x3);
x4 = input("");

Wn = [x1;x2;x3;x4];
fprintf("Wn ingresado:\n");
disp(Wn);


end

