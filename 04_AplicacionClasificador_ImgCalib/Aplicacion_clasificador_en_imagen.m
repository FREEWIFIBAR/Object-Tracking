%Eliminacion de agrupaciones ruidosas
rutaArchivoImagenes = './01_GeneracionMaterial/MaterialGenerado/ImagenesEntrenamiento_Calibracion.mat';
load(rutaArchivoImagenes);

rutaArchivoDatos = './03_DisegnoClasificador/VariablesGeneradas/datos_multiples_esferas.mat';
load(rutaArchivoDatos);

nImagenes = length(ImagenesEntrenamiento);
[nf, nc, ~] = size(ImagenesEntrenamiento{1});

Ib = false(nf, nc, nImagenes);

addpath('./Funciones')
for i = 1:nImagenes
    Ib(:, :, i) = calcula_deteccion_multiples_esferas_en_imagen(ImagenesEntrenamiento{i}, datosMultiplesEsferas);
end

pixObjeto = roipoly(Ib(:, :, 10));
numPix = round(sum(pixObjeto(:)) / 2);

for i = 1:nImagenes
    figure, subplot(1,3,1), imshow(ImagenesEntrenamiento{i});
    subplot(1,3,2), funcion_visualiza(ImagenesEntrenamiento{i}, Ib(:, :, i), [0 255 0], true);
    Ib_sinRuido(:, :, i) = bwareaopen(Ib(:, :, i), numPix);
    subplot(1,3,3), funcion_visualiza(ImagenesEntrenamiento{i}, Ib_sinRuido(:, :, i), [0 255 0], true);
end

save('04_AplicacionClasificador_ImgCalib/VariablesGeneradas/umbral_conectividad.mat', "numPix");