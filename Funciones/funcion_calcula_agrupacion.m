function idx = funcion_calcula_agrupacion(X, centroides)

    numValores = size(X, 1);
    
    K = size(centroides, 1);

    idx = zeros(numValores, 1);
    
    for i = 1:numValores
        distancias = zeros(K, 1);
        for k = 1:K
            distancias(k) = norm(X(i,:) - centroides(k,:));
        end
        [~, idx(i)] = min(distancias);
    end

end