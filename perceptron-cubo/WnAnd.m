function [Wn] = WnAnd()
fprintf("ingresa Wn [ x x x] propuesto\n");
x1 = input("");
fprintf("[%d x x]\n",x1);
x2 = input("");
fprintf("[%d %d x]\n",x1,x2);
x3 = input("");

Wn = [x1;x2;x3];
fprintf("Wn ingresado:\n");
disp(Wn);

end

