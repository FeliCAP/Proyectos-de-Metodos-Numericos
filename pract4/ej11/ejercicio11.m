function [x, alpha, k] = ejercicio11(x0, alpha0, tol, max_iter)
    if nargin < 3 || isempty(tol) %Si no se pasa tolerancia
        tol = 1e-10;
    end
    if nargin < 4 || isempty(max_iter) %Si no se pasa maximo de iteraciones
        max_iter = 100;
    end

    x = zeros(max_iter + 1, 1);
    alpha = zeros(max_iter + 1, 1);
    x(1) = x0;
    alpha(1) = alpha0;

    k = 0;
    for i = 1:max_iter
        k = i;
        alpha_act = alpha(k);
        if k == 1 && alpha_act == 0
          alpha_act = 4 / (4 - x(k));
          alpha(k) = alpha_act;
        end

        x(k+1) = alpha_act * exp(x(k)/4) + (1 - alpha_act) * x(k);
        alpha(k+1) = 4 / (4 - x(k+1));
        if abs(x(k+1) - x(k)) < tol %Criterio de parada
            break;
        end
    end
    x = x(1:k+1);
    alpha = alpha(1:k+1);
end
