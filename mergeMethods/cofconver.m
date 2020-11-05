function [solucion] = cofconver(matriz)

# Saca el el factor de convergencia cap1 de Biseccion, 

format long;
count = 0;

for i=1:(length(matriz)-1)
count = count + 1; 
matrix(i,1) = count;
matrix(i,2) = matriz((i+1),4)/matriz((i),4);


endfor
    

   
    
   [solucion] = matrix;
endfunction