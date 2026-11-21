function w = eval_hermite_cos(n, v)
    % Nodos equiespaciados en [0, pi]
    x = linspace(0, pi, n + 1);

    % Evaluacion de la funcion y su derivada en los nodos
    y = cos(x);
    d = -sin(x);

    % Inicializacion del vector de salida
    w = zeros(size(v));

    % Paso constante del subintervalo
    h = pi / n;

    % Evaluacion punto por punto de v
    for j = 1:length(v)
        v_j = v(j);

        % Determinar el subintervalo [x_i, x_i+1] al que pertenece v_j
        if v_j <= x(1)
            i = 1;
        elseif v_j >= x(end)
            i = n;
        else
            i = find(x <= v_j, 1, 'last');
            if i > n
                i = n;
            end
        end

        % Variable local s en el subintervalo
        s = v_j - x(i);

        % Coeficientes de Hermite
        y0 = y(i);
        y1 = y(i+1);
        d0 = d(i);
        d1 = d(i+1);

        % Formula de la interpolante cubica de Hermite
        w(j) = ((3*h*s^2 - 2*s^3) / h^3) * y1 ...
             + ((h^3 - 3*h*s^2 + 2*s^3) / h^3) * y0 ...
             + (s^2 * (s - h) / h^2) * d1 ...
             + (s * (s - h)^2 / h^2) * d0;
    end
end
