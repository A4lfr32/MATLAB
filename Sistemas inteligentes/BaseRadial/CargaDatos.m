%% BASE RADIAL
% Red neuronal de base radial
% Limpio el workspace, cierro las figuras y limpio la pantalla.
clear ; close all; clc
 t=0:pi/10:2*pi; 
%% Parte 1: Carga de datos de entrada y deseados.

fprintf('Cargando datos de entrada y deseados ...\n')
% load('segment.mat');% alfa 0.04, 14 no, 500 iteracones para aprox 80% de
%acierto
load('tresCentros.mat');
entradas= entradas./(max(abs(entradas),[],2));

% Obtengo el número de datos, número de entradas y número de salidas.
nd = size(entradas,2);
ne = size(entradas,1);
ns = size(deseados,1);
% Cosntruyo la base de datos de entrenamiento, validación y prueba
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
fprintf('\t- Número de entradas = %d\n',ne);
fprintf('\t- Número de salidas = %d\n',ns);
fprintf('\t- Número de datos = %d\n\n',nd);
fprintf('Los datos se dividen en:\n');
fprintf('\t- Datos de entrenamiento = %d\n',ndtn);
fprintf('\t- Datos de validación = %d\n',ndv);
fprintf('\t- Datos de prueba = %d\n',ndt);

fprintf('Programa pausado. Presione enter para continuar.\n');
% pause;

%% Parte 2: Configuración e inicialización de la red.

% Solicito alfa, el número de neuronas ocultas y el número de iteraciones.
% alfa = input('Ingrese el alfa de entrenamiento de la red.\n');
alfa= 0.01;
% no = input('Ingrese el número de neuronas ocultas.\n');
no=3;
% nit = input('Ingrese el número de iteraciones del algoritmo.\n');
nit=200;
% Inicializo los centros Cji.
c = 2*rand(ne,no)-1;
% Inicializo las distancias Dj.
d = rand(no,1)./1;
% Inicializo los pesos Wjk.
w = 2.*rand(no+1,ns) - 1;
% Configuro la salida y el error cuadrático medio.
yrkTn = zeros(ns,ndtn);
yrkV = zeros(ns,ndv);
ecmTrain = zeros(ns,nit);
ecmValidacion = zeros(ns,nit);
% fprintf('Se comenzará el entrenamiento de la red neuronal ...\n')
% fprintf('Programa pausado. Presione enter para continuar.\n');
% pause;

plot(entradas(1,:),entradas(2,:),'.');
axis('equal');
hold on
%% Parte 3: Cálculo hacia adelante de la red.
fprintf('Entrenando la red neuronal ...\n')
for m = 1:nit
   [yrkTn, ecmTrain(:,m), w, c, d] = feedForwardBRN(tnEntradas,ne,no,c,d,w,tnDeseados,alfa,ns,ndtn,1);
   [yrkV, ecmValidacion(:,m)] = feedForwardBRN(vEntradas,ne,no,c,d,w,vDeseados,alfa,ns,ndv,0);  
   if (mod(m,1)==0)
        fprintf('Iteración %d ...\n',m);
        plot(c(1,:),c(2,:),'xr');
        Aux=plot(c(1,1)+2*d(1)*cos(t),c(2,1)+2*d(1)*sin(t),'.r');
        Aux2=plot(c(1,2)+2*d(2)*cos(t),c(2,2)+2*d(2)*sin(t),'.k');
        Aux3=plot(c(1,3)+2*d(3)*cos(t),c(2,3)+2*d(3)*sin(t),'.g');
     
        pause(0.01);
delete(Aux);
delete(Aux2);
delete(Aux3);
   end
end
[yrkT, ecmTest] = feedForwardBRN(tEntradas,ne,no,c,d,w,tDeseados,alfa,ns,ndt,0);  
fprintf('Graficando errores cuadráticos medio ...\n')
for i = 1:ns
    figure;
    plot(1:nit,ecmTrain(i,:),'b',1:nit,ecmValidacion(i,:),'r');
    xlabel('iteración');
    ylabel('ecm');
    legend('ecm Entrenamiento','ecm Validación')
    title(strcat('Salida ', num2str(i)));
end
% figure;
% fprintf('Graficando Matriz de confusión para datos de entrenamiento...\n')
% yrkTn = round(yrkTn);
% 
% plotconfusion(double(disclases(tnDeseados)),double(disclases(yrkTn)),'Entrenamiento');
% figure;
% fprintf('Graficando Matriz de confusión para datos de validación...\n')
% yrkV = round(yrkV);
% plotconfusion(double(disclases((vDeseados))),double(disclases(yrkV)),'Validación');
% fprintf('El error cuadrático medio para la salida %d de los datos de prueba es: %f \n',[(1:length(ecmTest)); ecmTest'])
% figure;
% fprintf('Graficando Matriz de confusión para datos de prueba...\n')
% yrkT = round(yrkT);
% plotconfusion(double(disclases((tDeseados))),double(disclases(yrkT)),'Prueba');


function sal=disclases(matriz)
clase1=~matriz(1,:) & ~matriz(2,:);
clase2=~matriz(1,:) & matriz(2,:);
clase3=matriz(1,:) & ~matriz(2,:);
sal = [clase1;clase2;clase3];
end