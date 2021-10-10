
format long 
% formula = ( ((3*sin((2*n*pi)/3)-2*n*pi)) * (sin((2*n*pi)/3)) ) /n^2*pi^2
data = [];
frecuencia = (2/3)*pi;
% for n=1:20
%     parte1 = (-2*n*pi) + 3*(sin(2*pi*(n/3)));
%     final = parte1/(n^2 * pi^2);
%     fprintf("final:\n");
%     disp(final)
%     
%     fprintf("fn:\n");
%     fn = (n*frecuencia)/(2*pi);
% 
%  
% 
%     disp(fn)
%     
%     
% end 
 

%formula 2
for n=1:20 
 fprintf("n = %d\n",n);
a  = (3/(4*n^2*pi^2));
b =  (3 * cos((2*n*pi)/3))/(4*n^2*pi^2);
c = sin((4*n*pi)/3)/(n*pi);
d = cos((2*n*pi)/3);

partA = 2* (a - b + c) * d;

e = cos((4*n*pi)/3)/(n*pi);
f = (-3 * sin((2*n*pi)/3))/(4*n^2*pi^2);
g = sin((2*n*pi)/3);

partB = -2 * ((e - f ) * g);


final = partA + partB;

disp("Final : ");
disp(final)

fn = (n*frecuencia)/(2*pi);

disp("Fn ");
disp(fn)


end
    



