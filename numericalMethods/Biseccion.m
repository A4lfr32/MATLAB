function [solucion] = Biseccion(a,b,imax,delta,tolerancia)
% a, extremo derecho
% b, extremo izquierdo
% imax, iteraciones maximas 
% delta, 0.0001 de error en f(x) es 10e-5, delta 5
% tolerancia, es el rango entre a y b modificado
format long;
count = 0;
x=a;
error = abs(a-b);
disp('            n                        x                    f(x)                  error')
% ojo!: originalmente delta no es el exponencial ni la tolerancia
if (funcion(a)*funcion(b)<0) %verifica si el primer intervalo es valido (1)
  while (count < imax) && (abs(10^(-delta))<abs(funcion(x))) && (error >= 10^(-tolerancia))% 2condicion: criterio 2
    count = count + 1; 
    matrix(count,1)=count;
    x = (a+b)/2;
    matrix(count,2)=x;
    matrix(count,3)=funcion(x);
    
    
    if (funcion(a)*funcion(x)>0) % si no hubo cambio de signo toma intervalo (x,b)
      a=x;
    else % aca de (a,x)
      b=x;
    end
    
    error = abs(a-b);
    matrix(count,4)=error;
    
  end
else % (1)
  disp('La seccion propuesta no sirve')
%y = e^(2*x)+sin(x-1)+2*x^3-4*x+7;
end
%[solucion] = x
[solucion] = matrix;
end