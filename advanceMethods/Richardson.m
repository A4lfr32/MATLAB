function [y] = Richardson(X,nmax,delta,tol)  ## en SOR tambien metes W

format long;

A=matriz();
b=vectorb();

[D,L,U]=separar();

T=eye(length(X))-A; #d^-1 == inv(D)    ##estas cambian segun el metodo
c=b;                        ##jaja


i=0;
d=delta+1;
errorTol=tol+2;
Tabla=[0 0 0 0 0 0];
while i<nmax && d>delta && errorTol>tol;
  i=i+1;
  [y]= T*X+c;
  d=norm(A*[y]-b);
  errorTol=norm([y]-X);
  X=[y];
  
  if i==1
  Tabla = [i y' d errorTol];
  else
  Tabla = [Tabla;i y' d errorTol];
  endif
  
endwhile

disp('      iteracion                 x                         y                        z                     d                 errorTol')
Tabla
endfunction