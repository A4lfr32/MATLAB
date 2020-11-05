function [y] = SplinesCubicos()  ## en SOR tambien metes W

format long;

p1=[0 60];
p2=[15 80];
p3=[57 110];
p4=[90 72];
p5=[120 44];

pall= [p1;p2;p3;p4;p5];

# si hay n(size(pall(1))) puntos entonces saco polinomio n-1(size(pall(1)) - 1)
A=[];
Tabla=[];
for j=1:(size(pall)(1))#(size(pall)(1)-1)*2
for i=size(pall)(1)-1:-1:0
  A=[A (pall(j,1))^i];
endfor
if j>1 && j < (size(pall)(1))
Tabla=[Tabla;A];
Tabla=[Tabla;A];
elseif j=1
Tabla=[Tabla;A];
elseif j=1
Tabla=[Tabla;A];
endif
A=[];
endfor
y=Tabla;
endfunction