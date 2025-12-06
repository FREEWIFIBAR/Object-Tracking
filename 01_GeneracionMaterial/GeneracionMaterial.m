%Generar video de entrada
video = videoinput('winvideo', 1, 'YUY2_320x240');
preview(video);

video.ReturnedColorSpace = 'rgb';

video.TriggerRepeat = inf;
video.FrameGrabInterval = round(30/7);
set(video, 'LoggingMode', 'memory');

nombre = 'video_entrada.avi';

rutaArchivoVideo = ['./01_GeneracionMaterial/MaterialGenerado/' nombre];

formatoVideo = 'Motion JPEG AVI';
aviobj = VideoWriter(rutaArchivoVideo, formatoVideo);

aviobj.FrameRate = 7;

duracionGrabacion = 20;
numFramesGrabacion = duracionGrabacion * 7;

open(aviobj);

start(video);

for i = 1:numFramesGrabacion
    I = getdata(video, 1);
    writeVideo(aviobj, I);
end

stop(video);

close(aviobj);

implay(rutaArchivoVideo);

%Generar imagenes
numImagenes = 10;
ImagenesEntrenamiento = cell(1, numImagenes);

for i = 1:numImagenes
    pause(5);
    I = getsnapshot(video);
    ImagenesEntrenamiento{i} = I;
    imshow(I);
end

save('01_GeneracionMaterial/MaterialGenerado/ImagenesEntrenamiento_Calibracion.mat', "ImagenesEntrenamiento");