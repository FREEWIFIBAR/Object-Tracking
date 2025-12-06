function Ib = calcula_deteccion_multiples_esferas_en_imagen(I, centroides_radios)

    Ib = false(size(I,1), size(I,2));
    nAgrup = size(centroides_radios, 1);

    for i = 1:nAgrup
        Ib = calcula_deteccion_1esfera_en_imagen(I, centroides_radios(i, :)) | Ib;
    end

end

function Ib = calcula_deteccion_1esfera_en_imagen(I, centro_radio)

    R = double(I(:, :, 1));
    G = double(I(:, :, 2));
    B = double(I(:, :, 3));

    MD = sqrt((R-centro_radio(1)).^2 + (G-centro_radio(2)).^2 + (B-centro_radio(3)).^2);
    Ib = MD < centro_radio(4);

end