function [solucion] = Secante(a,b,imax,delta,tolerancia)
format long;
count = 0;
x = 0;
error = abs(a-b);
disp('            n                        x                    f(x)                  error')
while (funcion(a)!=funcion(b) && count < imax) && (abs(10^(-delta))<abs(funcion(x))) && (error >= 1/60 )#10^(-tolerancia))                                  # 2condicion: criterio 2
    count = count + 1; 
    matrix(count,1)=count;
    x =  b-(funcion(b)*(b-a)/(funcion(b)-funcion(a)));
    matrix(count,2)=x;
    matrix(count,3)=funcion(x);
    
    error = abs(x-b);
    matrix(count,4)=error;
    a=b;
    b=x;
endwhile
[solucion] = matrix;
endfunction