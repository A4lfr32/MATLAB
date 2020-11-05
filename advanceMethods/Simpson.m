function [y] = Simpson(pasos,liminf,limsup)  %% en SOR tambien metes W

format long;
disp('puntos')

n=2*pasos + 1
h=(limsup-liminf)/(n-1)


matriz = [];
cont = 0;
resultadoa=0;
resultadob=0;

for i=liminf:h:limsup
cont = cont +1;
matriz = [matriz;cont i funzi(i)];


if mod(cont,2)==0 && i>liminf
resultadoa = resultadoa + funzi(i);
elseif i>liminf && i<limsup
resultadob = resultadob + funzi(i);
endif
endfor

resultado = 4*resultadoa + 2*resultadob; 
resultado = resultado + funzi(liminf) + funzi(limsup);
resultado = resultado *( h / 3);



matriz
y=resultado;

endfunction