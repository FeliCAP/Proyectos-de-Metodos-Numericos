% Definicion del sistema de primer orden Y = [y; y']
f = @(t, Y) [Y(2); -4*t^2*Y(1) - 2*sin(t^2) - 8*t^3];

% Datos iniciales y discretizacion
Y0 = [1; -2];
h = 0.1;
N = round(1/h);
t = (0:N)*h;

Y = zeros(2, N+1);
Y(:, 1) = Y0;

% Metodo de Euler hacia atras con 3 iteraciones de punto fijo
for k = 2:N+1
    Y(:, k) = Y(:, k-1); % Semilla inicial
    g = @(Z) Y(:, k-1) + h * f(t(k), Z);

    for l = 1:3
        Y(:, k) = g(Y(:, k));
    end
end

% Mostrar tabla de valores obtenidos
fprintf('  t_k   |     y(t_k)     |    y''(t_k)\n');
fprintf('-----------------------------------------\n');
for k = 1:N+1
    fprintf(' %5.2f  |  %12.6f  |  %12.6f\n', t(k), Y(1, k), Y(2, k));
end

% Busqueda del primer cambio de signo de y(t) en [0, 1]
idx = find(Y(1, 1:end-1) .* Y(1, 2:end) <= 0, 1);

% Interpolacion lineal para hallar t1 (raiz de y) y y'(t1)
t_a = t(idx);     t_b = t(idx+1);
y_a = Y(1, idx);  y_b = Y(1, idx+1);
dy_a = Y(2, idx); dy_b = Y(2, idx+1);

t1 = t_a - y_a * (t_b - t_a) / (y_b - y_a);
dy_t1 = dy_a + (dy_b - dy_a) / (t_b - t_a) * (t1 - t_a);

fprintf('\nRaiz aproximada t1       : %.6f\n', t1);
fprintf('Valor aproximado y''(t1)  : %.6f\n', dy_t1);
