function datosEsfera = calcula_datos_esfera(XColor, XFondo)
    
    centroide = mean(XColor);

    Rc = centroide(1);
    Gc = centroide(2);
    Bc = centroide(3);
    
    vColor = calcula_distancia_punto_a_nube_puntos(centroide', XColor');
    vFondo = calcula_distancia_punto_a_nube_puntos(centroide', XFondo');

    r1 = max(vColor);
    r2 = min(vFondo);

    r12 = (r1 + r2) / 2;

    datosEsfera = [Rc, Gc, Bc, r12];
    
end

function vector_distancia = calcula_distancia_punto_a_nube_puntos(P, NP)
    
    numPuntos = size(NP, 2);

    vector_distancia = zeros(1, numPuntos);

    for i = 1:numPuntos
        vector_distancia(i) = sqrt(sum((P - NP(:, i)).^2));
    end
    
end