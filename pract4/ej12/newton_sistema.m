function [raiz, k] = newton_sistema(f, J, x0, tol, iter)
    % NEWTON_SISTEMA Resuelve el sistema no lineal f(x) = 0 por el metodo de Newton.
    %
    % Entradas:
    %   f    : Function handle que evalua f(x) (devuelve vector columna d x 1)
    %   J    : Function handle que evalua el Jacobiano J(x) (matriz d x d)
    %   x0   : Vector columna con el iterado inicial
    %   tol  : Tolerancia para el error relativo
    %   iter : Cantidad maxima de iteraciones
    %
    % Salidas:
    %   raiz : Vector columna aproximacion de la solucion
    %   k    : Cantidad de iteraciones realizadas hasta la convergencia

    % Garantizar vector columna para el punto inicial
    x = x0(:);
    k = 0;

    for idx = 1:iter
        k = idx;

        % Evaluacion del residuo y de la matriz Jacobiana en x_k
        fx = f(x);
        Jx = J(x);

        % Resolucion del sistema lineal J(x_k) * d = -f(x_k)
        d = Jx \ (-fx);

        % Criterio de parada: ||x_{k+1} - x_k||_2 <= tol * ||x_k||_2
        % Evaluamos el incremento d = x_{k+1} - x_k antes de actualizar x
        norma_d = norm(d, 2);
        norma_x = norm(x, 2);

        % Actualizacion del iterado: x_{k+1} = x_k + d
        x = x + d;

        if norma_d <= tol * norma_x
            break;
        end
    end

    raiz = x;
end
