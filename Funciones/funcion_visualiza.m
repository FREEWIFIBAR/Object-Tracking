function Io = funcion_visualiza(Ii, Ib, Color, flagRepresenta, varargin)
    
    [~, ~, num] = size(Ii);

    if num == 1
        R = Ii;
        G = Ii;
        B = Ii;
    else
        R = Ii(:, :, 1);
        G = Ii(:, :, 2);
        B = Ii(:, :, 3);
    end

    R(Ib) = Color(1);
    G(Ib) = Color(2);
    B(Ib) = Color(3);

    Io = cat(3, R, G, B);

    if nargin == 4 && flagRepresenta
        imshow(Io);
    end

end