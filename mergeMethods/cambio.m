#           ERROR absoluto(suma resta)= Eax+Eay 
#           ERROR absoluto(multi)= abs(x)*Eay + abs(y)*Eax
#                           divi = (abs(y)*Eax + abs(x)*Eay)/y^2
#
#           ERROR relativo (suma) abs(x/(x+y))Erx + abs(y/(x+y))Ery
#
# abs(x*(f'/f))
#
#
#
#
#
#
#

function [solucion] = cambio(a,b)
format long;
if (funcion(a)*funcion(b)>0) # si no hubo cambio de signo toma intervalo (x,b)
      disp('no')
      
      #b=b*abs(b);
else 
      disp('si')

      
endif

endfunction