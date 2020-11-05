% Parte 2
alfa=0.000001;
% deseados=0;
Aux=0

x2=[0,0,0];
% 
xAux=[zeros(1,10),ones(1,1000)];
xAux0=x(1:4)';

for i=1:length(x)-3
% 

    xAux0(1)=xAux0(2);
    xAux0(2)=xAux0(3);
    xAux0(3)=xAux0(4);
    xAux0(4)=x(3+i);
if abs(xAux0(4)-x2(end))>0.22
    jaja(i)=xAux0(4)-x2(end);
else
    jaja(i)=0;
    xAux0(4)=x2(end);
end

entradas=[xAux0;x2(i:i+2)'];
% entradas=[x(i:2+i)';y(i:1+i)'];

deseados = y(i+3);


   [yrk, ecm,w] = feedForwardAdaline(alfa,entradas,w,deseados,0);
%  [yrk, ecm,w,c] = feedForwardMadaline(alfa,entradas,w,c,no,deseados,0);

Aux(i)=ecm;
[M,I]=sort(Aux,'descend');


x2(i+3)=yrk;
end
hold on
% plot(xAux)
plot(y)
plot(x2)






