function Ib = calcula_deteccion_1esfera_en_imagen(I, centro_radio)

    R = double(I(:, :, 1));
    G = double(I(:, :, 2));
    B = double(I(:, :, 3));

    MD = sqrt((R-centro_radio(1)).^2 + (G-centro_radio(2)).^2 + (B-centro_radio(3)).^2);
    Ib = MD < centro_radio(4);

end