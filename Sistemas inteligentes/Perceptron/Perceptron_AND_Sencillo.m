%% PERCEPTRON LIMITADOR DURO
% Neurona perceptron limitador duro
% Limpio el workspace, cierro las figuras y limpio la pantalla.
clear ; close all; clc
%% Parte 1: Carga de datos de entrada y deseados.
fprintf('Cargando datos de entrada y deseados ...\n')
load('AND.mat');
% Agrego Bias autom�ticamente
entradas = [ones(1,size(entradas,2)); entradas] ;
% Obtengo el n�mero de datos, n�mero de entradas y n�mero de salidas.
nd = size(entradas,2);
ne = size(entradas,1);
ns = size(deseados,1);

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

nit = input('Ingrese el n�mero de iteraciones del algoritmo.\n');
% Inicializo los pesos Wi.
w = 2.*rand(ns,ne) - 1;
% Configuro la salida y el error cuadr�tico medio.
yrkTn = zeros(ns,nd);

ecmTrain = zeros(ns,nit);
ecmTest = zeros(ns,nit);
%% Parte 3: C�lculo hacia adelante de la red.
fprintf('Entrenando la red neuronal ...\n')
for m = 1:nit
   [yrkTn, ecmTrain(:,m),w] = feedForwardPerceptron(entradas,w,deseados,1);
end
[yrkTest, ecmTest] = feedForwardPerceptron(entradas,w,deseados,0); 
%% Parte 4: Grafico resultados.
fprintf('Graficando errores cuadr�ticos medio ...\n')
for i = 1:ns
    figure;
    plot(1:nit,ecmTrain(i,:),'b');
    xlabel('iteraci�n');
    ylabel('ecm');
    legend('ecm Entrenamiento')
    title(strcat('Salida ', num2str(i)));
end

fprintf('ECM Para prueba es: %f \n',[ecmTest])

