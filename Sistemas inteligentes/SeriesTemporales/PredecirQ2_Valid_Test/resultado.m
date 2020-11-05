clear all
close all
load 'EspacioTrabajo.mat'
num=length(y)-2*r;
run hipotesisDeRed.m
title("Prediccion")
num=1;

figure();
run hipotesisDeRed.m
title("Entrenamiento/Validación")