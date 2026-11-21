function q = trapecio(f, a, b, n)
    % TRAPECIO Computa la aproximacion de la integral de f en [a, b]
    % mediante la regla del trapecio compuesta con n subintervalos.
    %
    % Entradas:
    %   f : Funcion real a integrar (function handle, ej: @(x) ...)
    %   a : Extremo inferior del intervalo (a < b)
    %   b : Extremo superior del intervalo
    %   n : Numero natural de subintervalos
    %
    % Salida:
    %   q : Aproximacion numérica de la integral

    % Ancho de los subintervalos
    h = (b - a) / n;

    % Nodos de la particion equiespaciada
    x = linspace(a, b, n + 1);

    % Evaluaciones de la función en los nodos
    y = f(x);

    % Aplicacion de la regla del trapecio compuesta (vectorizada)
    q = (h / 2) * (y(1) + 2 * sum(y(2:end-1)) + y(end));
end
