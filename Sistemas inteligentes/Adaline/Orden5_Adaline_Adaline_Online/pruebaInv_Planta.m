close all

w=[0.0031   -0.0717   -0.0134    0.0921   -0.7662    0.6344    1.1225];
% w2=[4.6284   -2.8155   -9.0716    7.3621   -0.0365    0.4280    0.4960];
% w2=rand(1,7);
error=0;
for i=1:10000
% Parte 2
alfa=10;
% deseados=0;
Aux=0;

x2=[0,0,0];
y2=[0,0,0];
% 


% w=rand(1,7);
% w2=rand(1,7);
for j=1:length(y)-3
% Controlador inverso

entradas=[x(j:3+j)';x2(j:j+2)'];
% entradas=[x(i:2+i)';y(i:1+i)'];

deseados = x(j+3);

   [yrk, ecm,w2] = feedForwardAdalineCompuesto(alfa,entradas,w2,0,0,w,error);
%  [yrk, ecm,w,c] = feedForwardMadaline(alfa,entradas,w,c,no,deseados,0);

x2(j+3)=yrk;

entradas2=[x2(j:3+j)';y2(j:j+2)'];
% entradas=[x(i:2+i)';y(i:1+i)'];

[yrk, ecm,w] = feedForwardAdaline(alfa,entradas2,w,deseados,0);
% disp(ecm);
error = deseados-yrk;
Aux(j)=error;
y2(j+3)=yrk;


[yrk, ecm,w2] = feedForwardAdalineCompuesto(alfa,entradas,w2,0,1,w,error);
end
% plot(Aux)

hold on
P1=plot(x,'k');
P2=plot(y,'r');
P3=plot(y2,'g');
pause(0.01)
delete(P1);
delete(P2);
delete(P3);
hold off

end
hold on
P1=plot(x,'k');
P2=plot(y,'r');
P3=plot(y2,'g');

