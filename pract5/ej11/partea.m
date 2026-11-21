% 1. Datos observacionales (10 posiciones)
x_obs = [1.02, 0.95, 0.87, 0.77, 0.67, 0.56, 0.44, 0.30, 0.16, 0.01]';
y_obs = [0.39, 0.32, 0.27, 0.22, 0.18, 0.15, 0.13, 0.12, 0.13, 0.15]';

% 2. Construcción de la matriz de diseño A (10 x 5) y del término independiente b
A = [y_obs.^2,  x_obs.*y_obs,  x_obs,  y_obs,  ones(size(x_obs))];
b = x_obs.^2;

% 3. Resolución por mínimos cuadrados (Ecuaciones normales A'*A * x = A'*b)
coef = (A' * A) \ (A' * b);

a = coef(1);
b_coef = coef(2);
c = coef(3);
d = coef(4);
e = coef(5);

% Mostrar coeficientes hallados
fprintf('=== Coeficientes orbitales hallados ===\n');
fprintf('a = %10.6f\n', a);
fprintf('b = %10.6f\n', b_coef);
fprintf('c = %10.6f\n', c);
fprintf('d = %10.6f\n', d);
fprintf('e = %10.6f\n', e);

% 4. Graficación de las observaciones y la órbita implícita resultante
[X, Y] = meshgrid(-0.2:0.01:1.2, 0.0:0.01:0.6);

% Ecuación implícita de la forma: Z(X,Y) = 0
Z = X.^2 - (a*Y.^2 + b_coef*X.*Y + c*X + d*Y + e);

figure;
plot(x_obs, y_obs, 'ro', 'MarkerSize', 8, 'MarkerFaceColor', 'r', 'DisplayName', 'Observaciones');
hold on;
contour(X, Y, Z, [0 0], 'b-', 'LineWidth', 2, 'DisplayName', 'Órbita elíptica ajustada');

grid on;
xlabel('x');
ylabel('y');
title('Parte a): Ajuste de órbita planetaria por mínimos cuadrados');
legend('Location', 'northeast');
axis equal;
