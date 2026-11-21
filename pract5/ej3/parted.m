t = (1:25)';
y = [ 5.0291 6.5099 5.3666 4.1272 4.2948 ...
      6.1261 12.5140 10.0502 9.1614 7.5677 ...
      7.2920 10.0357 11.0708 13.4045 12.8415 ...
      11.9666 11.0765 11.7774 14.5701 17.0440 ...
      17.0398 15.9069 15.4850 15.5112 17.6572]';

id_atipico = 7;
t_atipico = t(id_atipico);
y_atipico = y(id_atipico);
%Datos filtrados (descartando el atípico k = 7)
id_filtrado = [1:6, 8:25]';
t_filtrado = t(id_filtrado);
y_filtrado = y(id_filtrado);

A = [ones(size(t_filtrado)), t_filtrado, sin(t_filtrado)];
beta = (A' * A) \ (A' * y_filtrado);

% Coeficientes de la parte c)
beta1 = beta(1);
beta2 = beta(2);
beta3 = beta(3);

t_grid = linspace(0, 26, 500)';
y_grid = beta1 + beta2 * t_grid + beta3 * sin(t_grid);

%Gráfico
figure;
%Dibujo de la curva ajustada
plot(t_grid, y_grid, 'b-', 'LineWidth', 2, 'DisplayName', '\beta_1 + \beta_2 t + \beta_3 sin(t)');
hold on;
%Datos válidos
plot(t_filtrado, y_filtrado, 'bo', 'MarkerSize', 6, 'MarkerFaceColor', 'b', 'DisplayName', 'Datos válidos');
%Valor atípico
plot(t_atipico, y_atipico, 'r*', 'MarkerSize', 12, 'LineWidth', 2, 'DisplayName', 'Atípico (k = 7)');
%Formato del gráfico
grid on;
xlabel('t');
ylabel('y');
title('Parte d)');
legend('Location', 'northwest');
xlim([0, 26]);
