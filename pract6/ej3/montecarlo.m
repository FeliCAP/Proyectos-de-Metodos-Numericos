function q = montecarlo(N)
    % MONTECARLO Aproxima la integral I = int_0^1 sqrt(1 - x^2) dx = pi/4
    % mediante el método de Monte Carlo en la caja [0, 1] x [0, 1].
    %
    % Entrada:
    %   N : Cantidad total de puntos aleatorios a generar
    %
    % Salida:
    %   q : Estimación de la integral (y de pi/4)

    % Generación de N puntos aleatorios con distribución uniforme en [0, 1]
    x = rand(N, 1);
    y = rand(N, 1);

    % Condición para estar debajo de la curva y = sqrt(1 - x^2) (o x^2 + y^2 <= 1)
    debajo = (x.^2 + y.^2 <= 1);

    % Conteo de puntos N0 y cálculo de la aproximación Q
    N0 = sum(debajo);
    q = N0 / N;
end
