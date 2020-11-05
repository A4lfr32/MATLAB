function [D,L,U] = separar()

format long;

A=matriz();

[m,n]=size(A);

for i=1:m
  D(i,i)=A(i,i);
endfor

L(m,m)=0;
U(m,m)=0;
for j=1:(m-1)
  for i=j+1:m
    L(i,j)=-A(i,j);
    U(j,i)=-A(j,i);
  endfor  
endfor





endfunction