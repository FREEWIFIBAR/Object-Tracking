%Diseño de clasificador
rutaArchivoDatos = './02_Extraer_Representar_Datos/VariablesGeneradas/conjunto_de_datos.mat';
load(rutaArchivoDatos);

valores = unique(Y);
XFondo = X(Y==valores(1), :);
XColor = X(Y==valores(2), :);

nAgrup = 5;

addpath('./Funciones')
[idx, centroides] = funcion_kmeans(XColor, nAgrup);

datosMultiplesEsferas = zeros(nAgrup, 4);

for i = 1:nAgrup
    agrupacion = XColor(idx==i, :);
    datosMultiplesEsferas(i, :) = calcula_datos_esfera(agrupacion, XFondo);
end

representa_datos_color_seguimiento_fondo(X, Y);

for i = 1:nAgrup
    centro = datosMultiplesEsferas(i, 1:3);
    radio = datosMultiplesEsferas(i, 4);

    representa_esfera(centro, radio);
    legend('Datos Color', 'Datos Fondo', 'Esfera');
end

save('03_DisegnoClasificador/VariablesGeneradas/datos_multiples_esferas.mat', "datosMultiplesEsferas");