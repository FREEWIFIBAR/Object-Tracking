function representa_datos_color_seguimiento_fondo(X, Y)

    DatosFondo = X(Y==0, :);
    DatosColor = X(Y==1, :);

    figure, plot3(DatosColor(:, 1), DatosColor(:, 2), DatosColor(:, 3), '.r'),
    hold on, plot3(DatosFondo(:, 1), DatosFondo(:, 2), DatosFondo(:, 3), '.y');

    axis([0 255 0 255 0 255]); % Especifica los límites de los ejes, como vector de 4, 6 u 8 elementos
    
    legend('Datos Color', 'Datos Fondo');
    xlabel('R'), ylabel('G'), zlabel('B');
    
end