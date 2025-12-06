%Algoritmo de seguimiento
rutaArchivoVideo = './01_GeneracionMaterial/MaterialGenerado/video_entrada.avi';
aviobj = VideoReader(rutaArchivoVideo);

rutaArchivoDatos = './03_DisegnoClasificador/VariablesGeneradas/datos_multiples_esferas.mat';
load(rutaArchivoDatos);

rutaArchivoUmbral = './04_AplicacionClasificador_ImgCalib/VariablesGeneradas/umbral_conectividad.mat';
load(rutaArchivoUmbral);

nFrames = aviobj.Duration*aviobj.FrameRate;
addpath('./Funciones')

aviobj.CurrentTime = 0;
for i = 1:nFrames

    I = readFrame(aviobj);
    Ib = calcula_deteccion_multiples_esferas_en_imagen(I, datosMultiplesEsferas);
    Ib_sinRuido = bwareaopen(Ib, numPix);

    if(sum(Ib_sinRuido(:))>0)

        [f, c] = find(Ib_sinRuido==1);
        centroide = [round(mean(f)), round(mean(c))];

        IbCentroide = false(size(I, 1), size(I, 2));
        IbCentroide(centroide(1)-3:centroide(1)+3, centroide(2)-3:centroide(2)+3) = true;
        IoPix = funcion_visualiza(I, Ib_sinRuido, [0 0 255], false);
        Io = funcion_visualiza(IoPix, IbCentroide, [255 255 255], true);

    else
        imshow(I);
    end

end