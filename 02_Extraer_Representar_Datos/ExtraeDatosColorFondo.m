%Extraccion de datos
rutaArchivoImagenes = './01_GeneracionMaterial/MaterialGenerado/ImagenesEntrenamiento_Calibracion.mat';
load(rutaArchivoImagenes);

numImagenes = length(ImagenesEntrenamiento);

DatosColor = [];

for i = 4:numImagenes
    R = ImagenesEntrenamiento{i}(:,:,1);
    G = ImagenesEntrenamiento{i}(:,:,2);
    B = ImagenesEntrenamiento{i}(:,:,3);

    region = roipoly(ImagenesEntrenamiento{i});
    DatosColor = [DatosColor; R(region) G(region) B(region)];
end

DatosFondo = [];

for i = 1:numImagenes-7
    R = ImagenesEntrenamiento{i}(:,:,1);
    G = ImagenesEntrenamiento{i}(:,:,2);
    B = ImagenesEntrenamiento{i}(:,:,3);

    region = roipoly(ImagenesEntrenamiento{i});
    DatosFondo = [DatosFondo; R(region) G(region) B(region)];
end

X = double([DatosFondo; DatosColor]);
Y = [zeros(size(DatosFondo, 1), 1); ones(size(DatosColor, 1), 1)];

save('02_Extraer_Representar_Datos/VariablesGeneradas/conjunto_de_datos_original.mat', "X", "Y");

%Representacion de datos
addpath('./Funciones')
representa_datos_color_seguimiento_fondo(X, Y);

%Eliminacion de outliers
addpath('./Funciones')

posClaseInteres = 2;

posOutliers = funcion_detecta_outliers_clase_interes(X, Y, posClaseInteres);

posOutliers = [false(length(Y)-length(posOutliers), 1); posOutliers];

X(posOutliers, :) = [];
Y(posOutliers) = [];

representa_datos_color_seguimiento_fondo(X, Y);

save('02_Extraer_Representar_Datos/VariablesGeneradas/conjunto_de_datos.mat', "X","Y");