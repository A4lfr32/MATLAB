function [yrk, ecm, w] = feedForwardAdalineCompuesto(alfa,entradas,w,deseados,entrena,waux,error)
    nd = size(deseados,2);
    ns = size(deseados,1);
    % Configuro la salida y el error cuadrático medio.
    yrk = zeros(ns,nd);
    ecm = zeros(ns,1);
    for i = 1:nd
        % Calculo la agregación.
        a = w*entradas(:,i);
        % Calculo la función de activación para todas las entradas
        yrk(:,i) = a;
        % Calculo el error del dato y acumulo el error cuadrático medio.
%         error = deseados(:,i) - yrk(:,i);
        ecm(:,1) = ecm(:,1) + (error.^2)./(2*nd);
        if entrena == 1
            % Actualizo los pesos Wji
            w = w + alfa*error*waux(1).*entradas(:,i)';
        end
    end
end