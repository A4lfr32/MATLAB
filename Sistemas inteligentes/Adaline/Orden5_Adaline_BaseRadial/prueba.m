% Parte 2
alfa=0.000001;
% deseados=0;
Aux=0

x2=[0,0,0];
% 
for i=1:length(y)-3
% 


entradas=[x(i:3+i)';x2(i:i+2)'];
% entradas=[x(i:2+i)';y(i:1+i)'];

deseados = y(i+3);


   [yrk, ecm,w] = feedForwardAdaline(alfa,entradas,w,deseados,0);
%  [yrk, ecm,w,c] = feedForwardMadaline(alfa,entradas,w,c,no,deseados,0);

Aux(i)=ecm;
[M,I]=sort(Aux,'descend');


x2(i+3)=yrk;
end
hold on
plot(x)
plot(y)
plot(x2)






