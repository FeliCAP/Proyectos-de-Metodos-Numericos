function ejercicio9_c()
  % 1. Parámetros de la solución exacta
  w = sqrt(1.5);
  C = 1 / (1.5 - (pi^2)/4);
  B = (1 - cos(w) - C) / sin(w);
  y_exacta = @(x) cos(w*x) + B*sin(w*x) + C*sin(pi/2 * x);

  % 2. Bucle para probar distintos valores de h = 10^-k
  for k = 1:4
    N = 10^k;
    h = 1 / N;
    x = linspace(0, 1, N+1)';
    x_int = x(2:N);
    n = N - 1; % Cantidad de incógnitas interiores

    % Diagonales de la matriz
    dp = (1.5 * h^2 - 2) * ones(n, 1);
    dl = ones(n-1, 1);
    du = ones(n-1, 1);

    % Vector del lado derecho b (con condiciones de borde y(0)=1, y(1)=1)
    b = h^2 * sin(pi/2 * x_int);
    b(1) = b(1) - 1;
    b(n) = b(n) - 1;

    % --- ALGORITMO DE THOMAS (Súper Sencillo) ---
    c_aux = dp;
    d_aux = b;
    for i = 2:n
      mult = dl(i-1) / c_aux(i-1);
      c_aux(i) = c_aux(i) - mult * du(i-1);
      d_aux(i) = d_aux(i) - mult * d_aux(i-1);
    end

    y_int = zeros(n, 1);
    y_int(n) = d_aux(n) / c_aux(n);
    for i = n-1:-1:1
      y_int(i) = (d_aux(i) - du(i) * y_int(i+1)) / c_aux(i);
    end
    % ---------------------------------------------

    % Solución completa incluyendo extremos
    y_num = [1; y_int; 1];

    % Cálculo del error máximo absoluto
    error_max = norm(y_num - y_exacta(x), inf);

    % Imprimimos el resultado de forma directa
    fprintf('Para h = 10^-%d (N = %d) --> Error Máximo = %e\n', k, N, error_max);
  end
end
