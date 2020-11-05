function [yrk, ecm, w] = feedForwardPerceptron (entradas,w,deseados,entrena)
    nd = size(deseados,2);
    ns = size(deseados,1);
    % Configuro la salida y el error cuadr�tico medio.
    yrk = zeros(ns,nd);
    ecm = zeros(ns,1);
    for i = 1:nd
        % Calculo la agregaci�n de la capa oculta.
        a = w*entradas(:,i);
        % entradas(:,i)
        % Calculo la funci�n de activaci�n
        yrk(i) = (a>=0);
        % Calculo el error del dato y acumulo el error cuadr�tico medio.
        error = deseados(i) - yrk(i);
        ecm(:) = ecm(:) + (error.^2)./(2*nd);
        if entrena == 1
            % Calculo las sensitividades de salida
            
            % Actualizo los pesos Wji
            w = w + error*entradas(:,i)';
            %entradas(:,i)'
        end
    end
end