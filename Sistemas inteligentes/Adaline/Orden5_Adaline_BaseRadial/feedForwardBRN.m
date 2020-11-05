function [yrk, ecm, w, c, d] = feedForwardBRN (entradas,ne,no,c,d,w,deseados,alfa,ns,nd,entrena)
    % Configuro h
    h = zeros(no+1,1);
    % Configuro la salida y el error cuadrático medio.
    yrk = zeros(ns,nd);
    ecm = zeros(ns,1);
    for i = 1:nd
        % Calculo la agregación de la capa oculta.
        t1 = repmat(entradas(:,i),1,no)- c; 
        dist = sum(t1.^2)';
        % Configuro el Bias de la capa oculta.
        h(1) = 1;
        % Calculo la función de activación de la capa oculta.
        h(2:end) = exp(-(1/2)*(dist./(d.^2)));
        % Calculo la agregación de la capa de salida.
        ysk = w'*h;
        % Calculo la función de activación de la capa de salida.
        yrk(:,i) = ysk;
        % Calculo el error del dato y acumulo el error cuadrático medio.
        error = deseados(:,i) - yrk(:,i);
        ecm(:) = ecm(:) + (error.^2)./(2*nd);
        if entrena == 1
            %Creo matriz de desviaciones
            dr = repmat(d,1,ne);
            % Actualizo los Cji
            c = c + repmat((alfa.*(w(2:end,:)*error).*h(2:end))',ne,1).*(t1./(dr'.^2));
%               c = c + repmat((alfa.*(w(2:end,:)*error).*h(2:end))',ne,1).*t1./dist';
            % Actualizo las desviaciones dj
%             d = d + alfa.*(w(2:end,:)*error).*(dist.^2./d.^3).*h(2:end).*(dist./d);
            d = d + alfa.*(w(2:end,:)*error).*h(2:end).*(dist./d).*(dist./(d.^2));
            % Actualizo los pesos Wj
            w = w + alfa.*(h*error');
        end
    end

end