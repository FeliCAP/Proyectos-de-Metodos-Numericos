% 1. Datos observacionales originales
x_obs = [1.02, 0.95, 0.87, 0.77, 0.67, 0.56, 0.44, 0.30, 0.16, 0.01]';
y_obs = [0.39, 0.32, 0.27, 0.22, 0.18, 0.15, 0.13, 0.12, 0.13, 0.15]';

% Matriz de diseño A (10 x 5) y vector b (10 x 1)
A = [y_obs.^2, x_obs.*y_obs, x_obs, y_obs, ones(size(x_obs))];
b = x_obs.^2;

% 2. Descomposición SVD completa
[U, S, V] = svd(A);
sigma = diag(S);

fprintf('=== Valores Singulares de A ===\n');
for i = 1:5
    fprintf('sigma_%d = %.6e\n', i, sigma(i));
end
fprintf('\nNúmero de condición kappa_2(A) = %.4e\n\n', sigma(1)/sigma(5));

% 3. Grilla para graficación
[X, Y] = meshgrid(-0.4:0.01:1.4, -0.2:0.01:0.8);

figure;
plot(x_obs, y_obs, 'ko', 'MarkerSize', 8, 'MarkerFaceColor', 'r', 'DisplayName', 'Observaciones');
hold on;
colors = {'c--', 'g--', 'm--', 'k--', 'b-'};

% 4. Cómputo de la solución truncada para k = 1, ..., 5
coef_k = zeros(5, 5);
for k = 1:5
    % Pseudoinversa truncada a rango k
    S_k_inv = zeros(5, 10);
    for i = 1:k
        S_k_inv(i,i) = 1 / sigma(i);
    end

    coef_k(:, k) = V * S_k_inv * U' * b;

    % Graficación de la curva Z(X,Y) = 0 para el rango k
    Z = X.^2 - (coef_k(1,k)*Y.^2 + coef_k(2,k)*X.*Y + coef_k(3,k)*X + coef_k(4,k)*Y + coef_k(5,k));
    contour(X, Y, Z, [0 0], colors{k}, 'LineWidth', 1.5, 'DisplayName', sprintf('k = %d', k));
end

grid on;
xlabel('x'); ylabel('y');
title('Parte c): Órbitas resultantes según el rango k de la SVD');
legend('Location', 'northeast');
axis equal;
