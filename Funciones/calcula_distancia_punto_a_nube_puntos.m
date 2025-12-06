function vector_distancia = calcula_distancia_punto_a_nube_puntos(P, NP)
    
    numPuntos = size(NP, 2);

    vector_distancia = zeros(1, numPuntos);

    for i = 1:numPuntos
        vector_distancia(i) = sqrt(sum((P - NP(:, i)).^2));
    end
    
end