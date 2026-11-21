t = [0.5; 1.0; 1.5; 2.0; 2.5; 3.0; 3.5; 4.0];
y = [6.80; 3.00; 1.50; 0.75; 0.48; 0.25; 0.20; 0.15];
%Soluciones obtenidas
x1_a = 14.376629; x2_a = -1.513916;  %Parte a)
x1_b = 8.634952; x2_b = -1.096669; %Parte b)

y_a = x1_a * exp(x2_a * t);
y_b = x1_b * exp(x2_b * t);
res_a = norm(y - y_a, 2);
res_b = norm(y - y_b, 2);

fprintf('Residuos:\n');
fprintf('Parte a): %f\n', res_a);
fprintf('Parte b): %f\n', res_b);

%Gráfico
t_grid = linspace(0.5, 4.0, 200)';
figure;
%Dibujo
plot(t, y, 'ko', 'MarkerSize', 8, 'MarkerFaceColor', 'k', 'DisplayName', 'Datos observados'); hold on;
plot(t_grid, x1_a * exp(x2_a * t_grid), 'b-', 'LineWidth', 2, 'DisplayName', 'Parte a)');
plot(t_grid, x1_b * exp(x2_b * t_grid), 'r--', 'LineWidth', 2, 'DisplayName', 'Parte b)');
%Formato del gráfico
grid on;
xlabel('t');
ylabel('y');
title('Ejercicio 10');
legend('Location', 'northeast');
