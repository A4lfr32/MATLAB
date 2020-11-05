%% PERCEPTRON LIMITADOR DURO
% Neurona perceptron limitador duro
% Limpio el workspace, cierro las figuras y limpio la pantalla.
% clear ; close all; clc
%% Parte 1: Carga de datos de entrada y deseados.
fprintf('Cargando datos de entrada y deseados ...\n')
load('data_iris.mat');

%Agrego Bias autom�ticamente
%entradas = [ones(1,size(entradas,2)); entradas] ;
%Pregunto por el bias
bias = input('�Desea utilizar Bias? - 1:Si  0:No\n');
%Normalizo base de datos
maxentradas = max(max(entradas));
entradas = entradas/maxentradas;
if bias == 1
   entradas = [ones(1,size(entradas,2)); entradas] ;
end
% Obtengo el n�mero de datos, n�mero de entradas y n�mero de salidas.
nd = size(entradas,2);
ne = size(entradas,1);
ns = size(deseados,1);

% Cosntruyo la base de datos de entrenamiento, validaci�n y prueba
[tnEntradas,vEntradas,tEntradas,itnEntradas,ivEntradas,itEntradas] ...
 = dividerand(entradas,0.7,0.2,0.1);
ndtn = size(tnEntradas,2);
ndv = size(vEntradas,2);
ndt = size(tEntradas,2);
% Selecciono los deseados para cada conjunto de datos.
tnDeseados = deseados(:,itnEntradas);
vDeseados = deseados(:,ivEntradas);
tDeseados = deseados(:,itEntradas);

% Imprimo en pantalla las variables obtenidas.
fprintf('Los datos cargados tienen:\n');
fprintf('\t- N�mero de entradas = %d\n',ne);
fprintf('\t- N�mero de salidas = %d\n',ns);
fprintf('\t- N�mero de datos = %d\n\n',nd);
fprintf('Los datos se dividen en:\n');
fprintf('\t- Datos de entrenamiento = %d\n',nd);
fprintf('\t- Datos de validaci�n = %d\n',nd);
fprintf('\t- Datos de prueba = %d\n',nd);
% Parte 2: Configuraci�n e inicializaci�n de la red.
% Solicito n�mero de iteraciones.
alfa = input('Ingrese el alfa de entrenamiento de la red.\n');
nit = input('Ingrese el n�mero de iteraciones del algoritmo.\n');
no = input('Ingrese el n�mero de neuronas ocultas de la red.\n');
% Inicializo los pesos Wi.
w = 2.*rand(no,ne) - 1;
% Inicializo los pesos Cj.
c = 2.*rand(ns,no+1) - 1;
% Configuro la salida y el error cuadr�tico medio.
yrkTn = zeros(ns,ndtn);
yrkV = zeros(ns,ndv);
ecmTrain = zeros(ns,nit);
ecmValidacion = zeros(ns,nit);

%% Parte 3: C�lculo hacia adelante de la red.
fprintf('Entrenando la red neuronal ...\n')
for m = 1:nit
   [yrkTn, ecmTrain(:,m),w,c] = feedForwardPerceptron_multicapa2(alfa,tnEntradas,w,c,no,tnDeseados,1);
   [yrkV, ecmValidacion(:,m)] = feedForwardPerceptron_multicapa2(alfa,vEntradas,w,c,no,vDeseados,0);
   %[yrkTn, ecmTrain(:,m),w] = feedForwardPerceptron_multi2(entradas,w,deseados,1);
end
[yrkTest, ecmTest] = feedForwardPerceptron_multicapa2(alfa,tEntradas,w,c,no,tDeseados,0); 
%[yrkTest, ecmTest] = feedForwardPerceptron_multi2(entradas,w,deseados,0); 

%% Parte 4: Grafico resultados.
fprintf('Graficando errores cuadr�ticos medio ...\n')
for i = 1:ns
    figure;
    plot(1:nit,ecmTrain(i,:),'b',1:nit,ecmValidacion(i,:),'r');
    xlabel('iteraci�n');
    ylabel('ecm');
    legend('ecm Entrenamiento','ecm Validaci�n')
    title(strcat('Salida ', num2str(i)));
end

fprintf('ECM Para prueba es: %f \n',[ecmTest])

