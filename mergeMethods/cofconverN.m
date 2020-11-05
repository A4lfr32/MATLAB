function [solucion] = cofconverN(matriz)
format long;
count = 0;
#disp('            n                        x                    f(x)                  error')
## ojo!: originalmente delt(a no es el exponencial ni la tolerancia
for i=1:(length(matriz)-1)
count = count + 1; 
matrix(i,1) = count;
matrix(i,2) = matriz((i+1),4)/(matriz((i),4))^2;


endfor
    

   
    
   [solucion] = matrix;
endfunction