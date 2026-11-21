function w = interpolante(x, y, v)
    % INTERPOLANTE Evalúa el polinomio interpolante p(v) definido por (x, y)
    % utilizando la representación en la base de Lagrange.
    % Entradas:
    %   x : Vector de nodos de interpolación de tamaño n+1
    %   y : Vector de valores f(x) de tamaño n+1
    %   v : Vector de puntos donde evaluar el polinomio
    % Salida:
    %   w : Vector del mismo tamaño que v con los valores p(v)

    n = length(x) - 1;
    w = zeros(size(v));

    % Para cada punto de evaluación en v
    for m = 1:length(v)
        vm = v(m);
        p_val = 0;

        % Suma sobre la base de Lagrange
        for k = 1:n+1
            % Construcción de L_k(vm)
            L_k = 1;
            for j = 1:n+1
                if j ~= k
                    L_k = L_k * (vm - x(j)) / (x(k) - x(j));
                end
            end
            p_val = p_val + y(k) * L_k;
        end

        w(m) = p_val;
    end
end
