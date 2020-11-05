function [yrk, ecm, w] = feedForwardAdalineCompuesto(alfa,entradas,w,deseados,entrena,waux,error)
    nd = size(deseados,2);
    ns = size(deseados,1);
    % Configuro la salida y el error cuadr�tico medio.
    yrk = zeros(ns,nd);
    ecm = zeros(ns,1);
    for i = 1:nd
        % Calculo la agregaci�n.
        a = w*entradas(:,i);
        % Calculo la funci�n de activaci�n para todas las entradas
        yrk(:,i) = a;
        % Calculo el error del dato y acumulo el error cuadr�tico medio.
%         error = deseados(:,i) - yrk(:,i);
        ecm(:,1) = ecm(:,1) + (error.^2)./(2*nd);
        if entrena == 1
            % Actualizo los pesos Wji
            w = w + alfa*error*waux(1).*entradas(:,i)';
        end
    end
end