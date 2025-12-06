function centroides = funcion_calcula_centroides(X, idx)
    
    N = max(idx);
    centroides = zeros(N, size(X, 2));

    for i = 1:N
        valores = X(idx==i, :);
        centroides(i, :) = mean(valores);
    end
    
end