% 1. Datos observacionales originales
x_obs = [1.02, 0.95, 0.87, 0.77, 0.67, 0.56, 0.44, 0.30, 0.16, 0.01]';
y_obs = [0.39, 0.32, 0.27, 0.22, 0.18, 0.15, 0.13, 0.12, 0.13, 0.15]';

% Matriz de diseño original y solución de la parte a)
A_orig = [y_obs.^2, x_obs.*y_obs, x_obs, y_obs, ones(size(x_obs))];
b_orig = x_obs.^2;
coef_orig = (A_orig' * A_orig) \ (A_orig' * b_orig);

% 2. Perturbación aleatoria en [-0.0005, 0.0005]
rng(42); % Semilla fija para reproducibilidad
pert_x = (rand(size(x_obs)) - 0.5) * 0.001; % Ruido uniforme en [-0.0005, 0.0005]
pert_y = (rand(size(y_obs)) - 0.5) * 0.001;

x_pert = x_obs + pert_x;
y_pert = y_obs + pert_y;

% 3. Matriz de diseño y resolución para datos perturbados
A_pert = [y_pert.^2, x_pert.*y_pert, x_pert, y_pert, ones(size(x_pert))];
b_pert = x_pert.^2;
coef_pert = (A_pert' * A_pert) \ (A_pert' * b_pert);

% Mostrar y comparar los nuevos coeficientes
fprintf('=== Coeficientes datos originales vs. perturbados ===\n');
fprintf('Coeficiente |      Original     |     Perturbado    \n');
fprintf('------------+-------------------+-------------------\n');
nombres = {'a (y^2)', 'b (xy) ', 'c (x)  ', 'd (y)  ', 'e (1)  '};
for i = 1:5
    fprintf('  %s   |   %13.6f   |   %13.6f\n', nombres{i}, coef_orig(i), coef_pert(i));
end

% 4. Graficación comparativa
[X, Y] = meshgrid(-0.3:0.01:1.3, -0.1:0.01:0.7);

% Curvas implícitas Z(X,Y) = 0
Z_orig = X.^2 - (coef_orig(1)*Y.^2 + coef_orig(2)*X.*Y + coef_orig(3)*X + coef_orig(4)*Y + coef_orig(5));
Z_pert = X.^2 - (coef_pert(1)*Y.^2 + coef_pert(2)*X.*Y + coef_pert(3)*X + coef_pert(4)*Y + coef_pert(5));

figure;
plot(x_obs, y_obs, 'ro', 'MarkerSize', 8, 'MarkerFaceColor', 'r', 'DisplayName', 'Datos originales'); hold on;
plot(x_pert, y_pert, 'ks', 'MarkerSize', 6, 'MarkerFaceColor', 'g', 'DisplayName', 'Datos perturbados');

contour(X, Y, Z_orig, [0 0], 'b-', 'LineWidth', 2, 'DisplayName', 'Órbita original');
contour(X, Y, Z_pert, [0 0], 'm--', 'LineWidth', 2, 'DisplayName', 'Órbita perturbada');

grid on;
xlabel('x'); ylabel('y');
title('Parte b): Sensibilidad a perturbaciones (Rango casi deficiente)');
legend('Location', 'northeast');
axis equal;
