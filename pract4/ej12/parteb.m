% 1. Definición de la grilla en (-4, 4) x (-4, 4)
x_vec = linspace(-4, 4, 400);
y_vec = linspace(-4, 4, 400);
[X, Y] = meshgrid(x_vec, y_vec);

% 2. Evaluación de las funciones f(x,y) y g(x,y)
F = X.^2 + X.*(Y.^3) - 9;
G = 3*(X.^2).*Y - Y.^3 - 4;

% 3. Gráfica de las curvas de nivel 0
figure;
contour(X, Y, F, [0, 0], 'b-', 'LineWidth', 1.8); hold on;
contour(X, Y, G, [0, 0], 'r--', 'LineWidth', 1.8);
grid on;

xlabel('x'); ylabel('y');
title('Curvas de nivel 0: f(x,y) = 0 (azul) y g(x,y) = 0 (rojo)');
legend('f(x,y) = 0', 'g(x,y) = 0', 'Location', 'northeast');
axis([-4 4 -4 4]);
