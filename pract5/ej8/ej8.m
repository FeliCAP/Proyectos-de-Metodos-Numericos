% Datos observados
t = [0.25; 0.75; 1.25; 1.75; 2.25];
y = [0.28; 0.57; 0.68; 0.74; 0.79];

% Modelo: f(t; a, b) = a * (1 - exp(-b * t))
% Iterados iniciales: a = 1, b = 1
x = [1; 1];

tol = 1e-6;
max_iter = 50;

fprintf('k   |      a_k      |      b_k      |   ||d_k||_2   \n');
fprintf('--------------------------------------------------\n');
fprintf('0   |  %11.6f  |  %11.6f  |      -     \n', x(1), x(2));

for k = 1:max_iter
    a = x(1);
    b = x(2);

    % Evaluar funcion f(t; x)
    f_val = a * (1 - exp(-b * t));

    % Matriz Jacobiana A (n x 2)
    A = [1 - exp(-b * t), a * t .* exp(-b * t)];

    % Vector termino independiente b_vec = y - f(t; x)
    b_vec = y - f_val;

    % Incremento de Gauss-Newton resolviendo mínimos cuadrados lineal
    d = A \ b_vec;

    % Actualizar iterado
    x = x + d;

    norm_d = norm(d, 2);
    fprintf('%d   |  %11.6f  |  %11.6f  |  %11.4e\n', k, x(1), x(2), norm_d);

    if norm_d < tol
        break;
    end
end

fprintf('\nSolucion hallada:\n');
fprintf('a* = %.6f\n', x(1));
fprintf('b* = %.6f\n', x(2));
