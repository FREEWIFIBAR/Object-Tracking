function [idx, centroides] = funcion_kmeans(X, K)

    [numValores, ~] = size(X);

    posSemillas = randsample(1:numValores, K);
    centroides_semilla = X(posSemillas, :);
    idx_semilla = funcion_calcula_agrupacion(X, centroides_semilla);

    flag = true;

    while flag
        
        centroides = funcion_calcula_centroides(X, idx_semilla);
        idx = funcion_calcula_agrupacion(X, centroides);
        var = funcion_compara_matrices(idx, idx_semilla);
        flag = not(var);

        if flag
            idx_semilla = idx;
        end

    end
    
end

function centroides = funcion_calcula_centroides(X, idx)
    
    N = max(idx);
    centroides = zeros(N, size(X, 2));

    for i = 1:N
        valores = X(idx==i, :);
        centroides(i, :) = mean(valores);
    end
    
end

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

function var = funcion_compara_matrices(m1, m2)

    m1 = double(m1); m2 = double(m2);
    [nF1, nC1] = size(m1);
    [nF2, nC2] = size(m2);

    if nF1==nF2 & nC1 == nC2

        dif = m1-m2;
        vMin = min(dif(:)); vMax = max(dif(:));
        
        if vMin==vMax && vMin==0
            var = true;
            disp('Matrices iguales')
        else
            var = false;
            disp('Matrices diferentes')
        end
        
    else
        var = false;
        disp('Matrices diferentes por distinta dimension')
    end
end