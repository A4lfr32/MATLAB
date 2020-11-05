function [solucion] = Conver(a,b,num)
format long;
count = 0;
while (num>b)
count = count + 1
vect(count) =(num-floor(num/b)*b)
num = floor(num/b)
endwhile
count = count + 1
vect(count) =(num-floor(num/b)*b)
num = floor(num/b)
disp('RECUERDA QUE ES DESDE EL ULTIMOO AL PRIMERO')
[solucion] = vect;
endfunction