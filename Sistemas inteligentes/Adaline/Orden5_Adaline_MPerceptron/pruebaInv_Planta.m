% Parte 2
alfa=0.000001;
% deseados=0;
Aux=0

x2=[0,0,0];
y2=[0,0,0];
% 

load PesosInverso.mat
w2=w;
w=[0.0031   -0.0717   -0.0134    0.0921   -0.7662    0.6344    1.1225];
for i=1:length(y)-3
% Controlador inverso
entradas=[x(i:3+i)';x2(i:i+2)'];
% entradas=[x(i:2+i)';y(i:1+i)'];

deseados = y(i+3);
[yrk, ecm,w2] = feedForwardMPerceptron(alfa,entradas,w2,c2,no,deseados,0);
   
%  [yrk, ecm,w,c] = feedForwardMadaline(alfa,entradas,w,c,no,deseados,0);

x2(i+3)=yrk;

entradas=[x2(i:3+i)';y2(i:i+2)'];
% entradas=[x(i:2+i)';y(i:1+i)'];
    [yrk, ecm,w] = feedForwardAdaline(alfa,entradas,w,deseados,0);

y2(i+3)=yrk;

end


hold on
plot(x)
plot(y)
plot(y2)






