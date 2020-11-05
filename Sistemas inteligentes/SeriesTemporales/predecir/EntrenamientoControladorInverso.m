load Datos.mat

hold on
x= [0,0,0,0,0,u];
y= [0,0,0,0,0,deseados];

alfa=0.1;
% deseados=0;

% w2 = rand(1,5);


I=[1,2,3,4];

for j=1:100000

    
i=I(1);
% i=371;
if (i<1)
   i=1;
elseif (i>length(y)-4)
    i=length(y)-4;
end

entradas=[y(1+i:3+i)';x(1+i:2+i)'];

% salida= Planta'*entradas;
% y(end+1)=salida;
deseados = x(3+i);

for k=1:10
   [yrk, ecm,w2] = feedForwardAdaline(alfa,entradas,w2,deseados,1);
Aux2(k)=ecm;
end
Aux(i)=ecm;
[M,I]=sort(Aux,'descend');



y2(j)=yrk;
end
plot(Aux)










