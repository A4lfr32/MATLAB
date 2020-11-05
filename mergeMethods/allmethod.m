function [solucion] = allmethod()

# prueba todos los metodos de ecuaciones no lineales
# pero se deben ingresar los datos desde acá, incluyendo el cambio de signo


format long;
a = 1;
b = 2;
imax = 16;
delta = 10;
tolerancia = 10;

matrix(1,1)=length(Biseccion(a,b,imax,delta,tolerancia));
matrix(1,2)=length(RFalsa(a,b,imax,delta,tolerancia));
matrix(1,3)=length(PFijo(a,b,imax,delta,tolerancia)); #b es inutil
matrix(1,4)=length(NRaphson(a,b,imax,delta,tolerancia));
matrix(1,5)=length(Secante(a,b,imax,delta,tolerancia));

matrix(2,1)=Biseccion(a,b,imax,delta,tolerancia)(length(Biseccion(a,b,imax,delta,tolerancia)),4);
matrix(2,2)=RFalsa(a,b,imax,delta,tolerancia)(length(RFalsa(a,b,imax,delta,tolerancia)),4);
matrix(2,3)=PFijo(a,b,imax,delta,tolerancia)(length(PFijo(a,b,imax,delta,tolerancia)),4); #b es inutil
matrix(2,4)=NRaphson(a,b,imax,delta,tolerancia)(length(NRaphson(a,b,imax,delta,tolerancia)),4);
matrix(2,5)=Secante(a,b,imax,delta,tolerancia)(length(Secante(a,b,imax,delta,tolerancia)),4);

[solucion] = matrix;
disp('      n      Biseccion     RFalsa      Pfijo     NRaphson      Secante')
endfunction