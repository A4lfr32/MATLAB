function [yrk, ecm, w] = feedForwardPerceptron (entradas,w,deseados,entrena)
    nd = size(deseados,2);
    ns = size(deseados,1);
    % Configuro la salida y el error cuadrático medio.
    yrk = zeros(ns,nd);
    ecm = zeros(ns,1);
    for i = 1:nd
        % Calculo la agregación de la capa oculta.
        a = w*entradas(:,i);
        % entradas(:,i)
        % Calculo la función de activación
        yrk(i) = (a>=0);
        % Calculo el error del dato y acumulo el error cuadrático medio.
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