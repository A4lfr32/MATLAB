function [solucion] = PFijo(x,b,imax,delta,tolerancia)
% ojo esta es con guncion
disp('nota*: Solo necesita un parametro, el segundo(b) no es utilizado')
format long;
count = 0;
error = abs(x-guncion(x));

disp('            n                        x                    f(x)                  error')


  while (count < imax) && (abs(10^(-delta))<abs(funcion(x))) && (error >= 10^(-tolerancia)) % 2condicion: criterio 2
    count = count + 1; 
    matrix(count,1)=count;
    x = guncion(x);
    matrix(count,2)=x;
    matrix(count,3)=guncion(x);
    
    
    
    error = abs(x-guncion(x));
    matrix(count,4)=error;
    
  end


[solucion] = matrix;
end