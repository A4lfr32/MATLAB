function [y] = DiferenciasDivididas()  

format long;

Matriz= [3 -4 7 1 -5; -2 1 3 6];
vectorsize= size(Matriz);
for i=1:(size(Matriz)(1,1)) #siempre 2
for j=1:(size(Matriz)(1,2)-1)

(matriz(2,j)-matriz(2,j+1))/(matriz(1,1)-matriz(1,(size(Matriz)(1,2)-j-1)))



endfor
endfor

i=0;
h=delta+1;
error=tol+2;
while i<nmax && h>delta && error>tol;
  i=i+1;
  [y]= T*X+c;
  h=norm(A*[y]-b);
  error=norm([y]-X);
  X=[y];
  
  Tabla = [i y' h error];
  #TAbla() = Tabla;
endwhile


Tabla
endfunction