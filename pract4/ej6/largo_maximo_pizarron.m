function L = largo_maximo_pizarron(l1, l2, gamma)
    % LARGO_MAXIMO_PIZARRON Computa el largo máximo L de un pizarrón que pasa por el pasillo.
    % Entradas:
    %   l1    : ancho del primer pasillo (l1 > 0)
    %   l2    : ancho del segundo pasillo (l2 > 0)
    %   gamma : ángulo del codo en radianes (0 < gamma < pi)
    % Salida:
    %   L     : largo máximo del pizarrón

    % Función auxiliar cuya raíz debemos hallar
    g = @(alpha) (l2 * cos(pi - gamma - alpha)) ./ (sin(pi - gamma - alpha).^2) - ...
                 (l1 * cos(alpha)) ./ (sin(alpha).^2);

    % El ángulo alpha debe estar estrictamente dentro del intervalo (0, pi - gamma)
    % Definimos un intervalo [a, b] acotado lejos de las singularidades
    a = 1e-4;
    b = (pi - gamma) - 1e-4;

    % Resolvemos g(alpha) = 0 usando fzero
    alpha_opt = fzero(g, [a, b]);

    % Evaluamos la fórmula del largo máximo L
    L = l2 / sin(pi - gamma - alpha_opt) + l1 / sin(alpha_opt);
end
