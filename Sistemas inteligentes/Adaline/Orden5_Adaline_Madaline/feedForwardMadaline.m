function [h, ecm, w, c] = feedForwardMadaline(alfa,entradas,w,c,no,deseados,entrena)
    % Configuro la capa oculta.
    a2 = zeros(no+1,1);
    nd = size(deseados,2);
    ns = size(deseados,1);
    % Configuro la salida y el error cuadr�tico medio.
    h = zeros(ns,nd);
    ecm = zeros(ns,1);
    for i = 1:nd
        % Calculo la agregaci�n de la capa oculta
        z2 = w*entradas(:,i);
        % Configuro el Bias de la capa oculta.
        a2(1) = 1;
        % Calculo la funci�n de activaci�n sigmoidal de la capa oculta.
        a2(2:end) = 1./(1+exp(-z2));
        % Calculo la funci�n de activaci�n lineal de la capa oculta.
%         h(2:end) = a;
        % Calculo la agregaci�n de la capa de salida.
        z_L = c*a2;
        % Calculo la funci�n de activaci�n de la capa de salida.

            h(:,i)=z_L;
%             h(:,i) = 1./(1+exp(-z_L));

        
        % Calculo el error del dato y acumulo el error cuadr�tico medio.
        error = deseados(:,i) - h(:,i);
        ecm(:) = ecm(:) + (error.^2)./(2*nd);
        
        if entrena == 1
            %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
            % Calculo las sensitividades de salida
            dL = error;
            % Actualizo los pesos Cjk
            c = c + alfa*(dL*a2');
            %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
            % Calculo las sensitividades de la capa oculta
            dh = (dL'*c(:,2:end)).*(a2(2:end).*(1 - a2(2:end)))';
            
            % Actualizo los pesos Wji
            w = w + alfa*(dh'*entradas(:,i)');
            
        end
    end

end