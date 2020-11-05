%% PERCEPTRON LIMITADOR DURO
% Neurona perceptron limitador duro
% Limpio el workspace, cierro las figuras y limpio la pantalla.
clear ; close all; clc
%% Parte 1: Carga de datos de entrada y deseados.
fprintf('Cargando datos de entrada y deseados ...\n')
load('AND.mat');
% Agrego Bias automáticamente
entradas = [ones(1,size(entradas,2)); entradas] ;
% Obtengo el número de datos, número de entradas y número de salidas.
nd = size(entradas,2);
ne = size(entradas,1);
ns = size(deseados,1);

% Imprimo en pantalla las variables obtenidas.
fprintf('Los datos cargados tienen:\n');
fprintf('\t- Número de entradas = %d\n',ne);
fprintf('\t- Número de salidas = %d\n',ns);
fprintf('\t- Número de datos = %d\n\n',nd);
fprintf('Los datos se dividen en:\n');
fprintf('\t- Datos de entrenamiento = %d\n',nd);
fprintf('\t- Datos de validación = %d\n',nd);
fprintf('\t- Datos de prueba = %d\n',nd);
% Parte 2: Configuración e inicialización de la red.
% Solicito número de iteraciones.

nit = input('Ingrese el número de iteraciones del algoritmo.\n');
% Inicializo los pesos Wi.
w = 2.*rand(ns,ne) - 1;
% Configuro la salida y el error cuadrático medio.
yrkTn = zeros(ns,nd);

ecmTrain = zeros(ns,nit);
ecmTest = zeros(ns,nit);
%% Parte 3: Cálculo hacia adelante de la red.
fprintf('Entrenando la red neuronal ...\n')
for m = 1:nit
   [yrkTn, ecmTrain(:,m),w] = feedForwardPerceptron(entradas,w,deseados,1);
end
[yrkTest, ecmTest] = feedForwardPerceptron(entradas,w,deseados,0); 
%% Parte 4: Grafico resultados.
fprintf('Graficando errores cuadráticos medio ...\n')
for i = 1:ns
    figure;
    plot(1:nit,ecmTrain(i,:),'b');
    xlabel('iteración');
    ylabel('ecm');
    legend('ecm Entrenamiento')
    title(strcat('Salida ', num2str(i)));
end

fprintf('ECM Para prueba es: %f \n',[ecmTest])

