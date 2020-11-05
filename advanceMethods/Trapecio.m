function [y] = Trapecio(pasos,liminf,limsup)  ## en SOR tambien metes W

format long;
disp('puntos') 
n=2^pasos+1

h=(limsup-liminf)/(n-1)


resultado=0;
matriz = [];
cont = 0;

for i=liminf:h:limsup
cont = cont +1;
matriz = [matriz;cont i funzi(i)]; #(liminf-i)/h 
if i>liminf && i<limsup
resultado = resultado + funzi(i);
endif
endfor

resultado = resultado*2;
resultado = resultado + funzi(liminf) + funzi(limsup);
resultado = resultado * h / 2;



matriz
y=resultado;

endfunction