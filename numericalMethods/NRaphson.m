function [solucion] = NRaphson(x,b,imax,delta,tolerancia)
    format long;
    count = 0;
    b=0;
    xant = x;
    error =1;
    disp('            n                        x                    f(x)                  error')
    % ojo!: originalmente delta no es el exponencial ni la tolerancia
    while (count < imax && (error >= 10^(-tolerancia))  && 10^(-delta)<abs(funcion(x)))
        count = count + 1;
        matrix(count,1)=count;
        matrix(count,2)=x;
        matrix(count,3)=funcion(x);
        x = x-(funcion(x)/(duncion(x)));
        matrix(count,4)= abs(funcion(x)-funcion(xant));
        xant = x;
    end
    [solucion] = matrix;
end