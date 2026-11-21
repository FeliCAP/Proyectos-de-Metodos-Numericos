% 1. Datos observacionales originales y perturbados
x_obs = [1.02, 0.95, 0.87, 0.77, 0.67, 0.56, 0.44, 0.30, 0.16, 0.01]';
y_obs = [0.39, 0.32, 0.27, 0.22, 0.18, 0.15, 0.13, 0.12, 0.13, 0.15]';

rng(42); % Misma semilla que en la parte b)
pert_x = (rand(size(x_obs)) - 0.5) * 0.001;
pert_y = (rand(size(y_obs)) - 0.5) * 0.001;

x_pert = x_obs + pert_x;
y_pert = y_obs + pert_y;

% Matrices de diseño y vectores de datos
A_orig = [y_obs.^2, x_obs.*y_obs, x_obs, y_obs, ones(size(x_obs))];
b_orig = x_obs.^2;

A_pert = [y_pert.^2, x_pert.*y_pert, x_pert, y_pert, ones(size(x_pert))];
b_pert = x_pert.^2;

% Descomposición SVD para ambas matrices
[U_o, S_o, V_o] = svd(A_orig);  sig_o = diag(S_o);
[U_p, S_p, V_p] = svd(A_pert);  sig_p = diag(S_p);

% Grilla para graficación
[X, Y] = meshgrid(-0.4:0.01:1.4, -0.2:0.01:0.8);

% 2. Comparación de la órbita para rango truncado k = 4
k = 4;

% Solución truncada a k = 4 para datos originales
S_inv_o = zeros(5, 10);
for i = 1:k, S_inv_o(i,i) = 1 / sig_o(i); end
coef_k_orig = V_o * S_inv_o * U_o' * b_orig;

% Solución truncada a k = 4 para datos perturbados
S_inv_p = zeros(5, 10);
for i = 1:k, S_inv_p(i,i) = 1 / sig_p(i); end
coef_k_pert = V_p * S_inv_p * U_p' * b_pert;

% Curvas implícitas Z(X,Y) = 0
Z_orig_k4 = X.^2 - (coef_k_orig(1)*Y.^2 + coef_k_orig(2)*X.*Y + coef_k_orig(3)*X + coef_k_orig(4)*Y + coef_k_orig(5));
Z_pert_k4 = X.^2 - (coef_k_pert(1)*Y.^2 + coef_k_pert(2)*X.*Y + coef_k_pert(3)*X + coef_k_pert(4)*Y + coef_k_pert(5));

% Graficación
figure;
plot(x_obs, y_obs, 'ro', 'MarkerSize', 8, 'MarkerFaceColor', 'r', 'DisplayName', 'Datos originales'); hold on;
plot(x_pert, y_pert, 'ks', 'MarkerSize', 6, 'MarkerFaceColor', 'g', 'DisplayName', 'Datos perturbados');

contour(X, Y, Z_orig_k4, [0 0], 'b-', 'LineWidth', 2, 'DisplayName', 'SVD Truncada k = 4 (Original)');
contour(X, Y, Z_pert_k4, [0 0], 'm--', 'LineWidth', 2, 'DisplayName', 'SVD Truncada k = 4 (Perturbada)');

grid on;
xlabel('x'); ylabel('y');
title('Parte d): Estabilidad ante perturbaciones usando SVD truncada (k = 4)');
legend('Location', 'northeast');
axis equal;
