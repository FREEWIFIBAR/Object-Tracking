function posOutliers = funcion_detecta_outliers_clase_interes(X, Y, posClaseInteres)

    valores = unique(Y);
    muestra = X(Y==valores(posClaseInteres), :);
    
    muestraOrd = sort(muestra);
    
    %Componente Roja
    [numValores, ~] = size(muestraOrd);
    posQ1 = round(0.25*numValores);
    posQ3 = round(0.75*numValores);
    
    Q1 = muestraOrd(posQ1, 1);
    Q3 = muestraOrd(posQ3, 1);
    RI = Q3 - Q1;
    
    posOutliers = muestra(:, 1) < Q1-1.5*RI | muestra(:, 1) > Q3+1.5*RI;

    %Componente Verde
    mu = mean(muestraOrd(:, 2));
    des = std(muestraOrd(:, 2));

    posOutliers = muestra(:, 2) < mu-2.5*des | muestra(:, 2) > mu+2.5*des | posOutliers==true;

    %Componente Azul
    mu = mean(muestraOrd(:, 3));
    des = std(muestraOrd(:, 3));

    posOutliers = muestra(:, 3) < mu-3*des | posOutliers==true;

end