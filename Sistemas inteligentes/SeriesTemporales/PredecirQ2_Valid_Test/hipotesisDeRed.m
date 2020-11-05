comenzaren=1213;
yHipotesis=y(comenzaren-r+1:comenzaren)';  %validacion original
entradas=yHipotesis;

% for i=1:length(y)-comenzaren
for i=1:1000
% [yrk, ecm,w,c] = feedForwardPerceptron_multicapa2(alfa,entradas,w,c,no,y(comenzaren+i),0);
[yrk, ecm,w,c] = feedForwardPerceptron_multicapa2(alfa,entradas,w,c,no,0,0);

yHipotesis(end+1)=yrk;

entradas=yHipotesis(i+1:end);

end

hold on
% plot(comenzaren+r-1,y(comenzaren+r-1),'r*')
plot(comenzaren+1:comenzaren+length(yHipotesis)-r+1,yHipotesis(r:end))
% plot(1:comenzaren+r-1,y(1:comenzaren+r-1),'k')
% legend("Horizonte","Predicción","Tramo real")
plot(y,'-r')
