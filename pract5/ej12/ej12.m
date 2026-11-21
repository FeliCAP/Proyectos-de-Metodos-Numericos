% Datos de la tabla
h = [0.912, 0.986, 1.060, 1.130, 1.190, 1.260, 1.320, 1.380, 1.410, 1.490]';
p = [13.7, 15.9, 18.5, 21.3, 23.5, 27.2, 32.7, 36.0, 38.6, 43.7]';

% -------------------------------------------------------------
% Parte a): Método de Gauss-Newton
% -------------------------------------------------------------
x = [10; 2]; % [c1; c2] inicial
tol = 1e-8;
max_iter = 50;

for k = 1:max_iter
    c1 = x(1);
    c2 = x(2);

    f_val = c1 * (h .^ c2);
    A = [h .^ c2, c1 * (h .^ c2) .* log(h)];
    b_vec = p - f_val;

    d = A \ b_vec;
    x = x + d;

    if norm(d, 2) < tol
        break;
    end
end

c1_GN = x(1);
c2_GN = x(2);

fprintf('--- Parte a): Solución por Gauss-Newton ---\n');
fprintf('c1 (Gauss-Newton) = %.6f\n', c1_GN);
fprintf('c2 (Gauss-Newton) = %.6f\n', c2_GN);

% -------------------------------------------------------------
% Parte b): Modelo Linealizado log(p) = log(c1) + c2*log(h)
% -------------------------------------------------------------
u = log(h);
z = log(p);
A_lin = [ones(size(h)), u];

beta = (A_lin' * A_lin) \ (A_lin' * z);
c1_lin = exp(beta(1));
c2_lin = beta(2);

fprintf('\n--- Parte b): Solución por Modelo Linealizado ---\n');
fprintf('log(c1) = %.6f  =>  c1 = %.6f\n', beta(1), c1_lin);
fprintf('c2      = %.6f\n', c2_lin);

% -------------------------------------------------------------
% Parte c): Comparación de Residuos y Gráfico
% -------------------------------------------------------------
p_pred_GN = c1_GN * (h .^ c2_GN);
p_pred_lin = c1_lin * (h .^ c2_lin);

res_GN = norm(p - p_pred_GN, 2);
res_lin = norm(p - p_pred_lin, 2);

fprintf('\n--- Parte c): Comparación de Residuos (Norma 2) ---\n');
fprintf('Norma 2 del residuo (Gauss-Newton) : %.6f\n', res_GN);
fprintf('Norma 2 del residuo (Linealizado)   : %.6f\n', res_lin);

% Gráfica
h_grid = linspace(0.9, 1.5, 200)';
figure;
plot(h, p, 'ko', 'MarkerSize', 8, 'MarkerFaceColor', 'k', 'DisplayName', 'Datos de la tabla'); hold on;
plot(h_grid, c1_GN * (h_grid .^ c2_GN), 'b-', 'LineWidth', 2, 'DisplayName', 'Gauss-Newton (Parte a)');
plot(h_grid, c1_lin * (h_grid .^ c2_lin), 'r--', 'LineWidth', 2, 'DisplayName', 'Linealizado (Parte b)');
grid on;
xlabel('Altura h (m)');
ylabel('Peso p (kg)');
title('Ejercicio 12: Relación entre peso y altura (p = c_1 h^{c_2})');
legend('Location', 'northwest');
