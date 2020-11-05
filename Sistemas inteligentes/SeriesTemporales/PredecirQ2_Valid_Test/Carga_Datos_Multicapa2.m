%% PERCEPTRON LIMITADOR DURO
% Neurona perceptron limitador duro
% Limpio el workspace, cierro las figuras y limpio la pantalla.
% clear ; close all; clc
%% Parte 1: Inicializando parametros

load('MSFTPRICES.mat')
%Agrego Bias automáticamente
%entradas = [ones(1,size(entradas,2)); entradas] ;

% Obtengo el número de datos, número de entradas y número de salidas.
% nd = size(entradas,2);

% Imprimo en pantalla las variables obtenidas.
ne=644;
ns=1;
nd=ne;

% Parte 2: Configuración e inicialización de la red.
% Solicito número de iteraciones.
alfa = (0.1);
nit = 100; %dado que son 100 datos, 10mil iteraciones aprox repetir 100 veces
% no = round(ne);
no=2;
% Inicializo los pesos Wi.
% w = (2.*rand(no,ne) - 1);
% Inicializo los pesos Cj.
% c = (2.*rand(ns,no+1) - 1);
% Configuro la salida y el error cuadrático medio.
yrk = (zeros(ns,nd));
ecmTrain = (zeros(ns,1));


%% Parte 2: Declaracion de Funcion, entradas y deseado
fprintf('Entrenando la red neuronal ...\n')

r=ne;
entradas=(zeros(r,1));

maxValue=max(MSFTPRICES(:,2));
y = MSFTPRICES(:,2)'/2/maxValue;

% y = ySobremuestreada(1:50:end);
% plot(y,'.k');


%% Parte 3 Numero de iteraciones, usando random*
% veces que hace un tramo
for m=1:length(y)-r

entradas(:,m)=y(m:r+m-1)'+2*y(m:r+m-1)'.*(rand(ne,1)-0.5); 
deseados(:,m)=(y(m+r));

% veces que repite los mismos datos (ventana)
end



[tnEntradas,vEntradas,tEntradas,itnEntradas,ivEntradas,itEntradas] ...
    = dividerand(entradas,0.7,0.2,0.1);
tnDeseados=deseados(itnEntradas);
vDeseados=deseados(ivEntradas);
tDeseados=deseados(itEntradas);

indexrandom=randperm(length(tnEntradas));
entradasRandomizada=tnEntradas(:,indexrandom);
deseadosRandomizada=tnDeseados(:,indexrandom);

ecmTrain=0;
ecmV=0;
for i=1:nit
   [yrkTn, ecmTrain(:,i),w,c] = feedForwardPerceptron_multicapa2(alfa,entradasRandomizada,w,c,(no),deseadosRandomizada,1);

    [yrkV, ecmV(:,i),w,c] = feedForwardPerceptron_multicapa2(alfa,vEntradas,w,c,(no),vDeseados,0);
end
% disp((j-1)*(length(y)-r)+m);

hold on
plot(y);
[M,I]=sort(indexrandom);
plot(indexrandom(I)+r,yrkTn(I));
