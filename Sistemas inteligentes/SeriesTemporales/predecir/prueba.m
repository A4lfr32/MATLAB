% Parte 2
alfa=0.000001;
% deseados=0;
Aux=0
% w=[0.0003,0.0003,0.0000,-0.9441,1.9433];

% primero 2 retrasos en la entrada
% segundo 1 retraso en la entrada
% sin retraso en la entrada
%  1 retraso en la salida
%  2 retrasos en la salida
x2=[0,0];
% 
for i=1:length(y)-3
% 


entradas=[x(i:2+i)';x2(i:1+i)'];
% entradas=[x(i:2+i)';y(i:1+i)'];

% salida= Planta'*entradas;
% y(end+1)=salida;
deseados = y(2+i);


   [yrk, ecm,w] = feedForwardAdaline(alfa,entradas,w,deseados,0);
%  [yrk, ecm,w,c] = feedForwardMadaline(alfa,entradas,w,c,no,deseados,0);

Aux(i)=ecm;
[M,I]=sort(Aux,'descend');


x2(i+2)=yrk;
end

% Fns=tf([w(3),w(2),w(1)],[1,-w(5),-w(4)],0.005);
% [y3,t3]=step(Fns);
hold on
plot(x)
plot(y)
plot(x2)
% plot(y3*45)






